#!/usr/bin/env python3
import argparse
import html
import json
import mimetypes
import re
import sys
import urllib.request
import uuid
from pathlib import Path

BADGE = {"green": "green", "red": "red", "yellow": "yellow", "orange": "yellow", "blue": "blue", "purple": "purple", "grey": "neutral", "gray": "neutral"}
CALLOUT = {"note": "note", "warning": "warning", "danger": "error", "success": "success", "key": "info", "info": "info"}


def slug(text):
    return re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")[:50] or "image"


def upload(site, page_id, token, path):
    boundary = uuid.uuid4().hex
    mime = mimetypes.guess_type(path.name)[0] or "application/octet-stream"
    body = (f'--{boundary}\r\nContent-Disposition: form-data; name="file"; filename="{path.name}"\r\nContent-Type: {mime}\r\n\r\n').encode() + path.read_bytes() + f"\r\n--{boundary}--\r\n".encode()
    base = site if "://" in site else f"https://{site}"
    req = urllib.request.Request(f"{base}/wiki/api/v2/content/{page_id}/attachment-upload", data=body, method="POST", headers={
        "Authorization": f"Bearer {token}", "Accept": "application/json", "Content-Type": f"multipart/form-data; boundary={boundary}"})
    with urllib.request.urlopen(req) as res:
        return json.load(res)["fileId"]


def media(file_id, page_id, alt, caption, png):
    width = "80" if png else "60"
    cap = f"<figcaption>{html.escape(caption, quote=False)}</figcaption>" if caption else ""
    return (f'<figure data-type="media-single" data-layout="center" data-width="{width}" data-width-type="percentage">'
            f'<div data-type="media" data-media-type="file" data-id="{file_id}" data-collection="contentId-{page_id}" data-alt="{html.escape(alt)}"></div>{cap}</figure>')


def kv(match):
    rows = re.findall(r'<kapi-item[^>]*\bkey="([^"]+)"[^>]*>(.*?)</kapi-item>', match.group(0), re.S)
    return "<table><tbody>" + "".join(f"<tr><th><p>{k}</p></th><td><p>{v.strip()}</p></td></tr>" for k, v in rows) + "</tbody></table>"


def attr(attrs, name):
    m = re.search(rf'\b{name}="([^"]*)"', attrs)
    return m.group(1) if m else ""


def cell(match):
    tag, attrs, inner = match.group(1), match.group(2) or "", match.group(3).strip()
    inner = re.sub(r"<div\b[^>]*>", "<p>", inner).replace("</div>", "</p>")
    inner = re.sub(r"<span(?![^>]*data-type)[^>]*>(.*?)</span>", r"\1 ", inner, flags=re.S)
    inner = re.sub(r"(<br\s*/?>\s*)+$", "", inner).strip()
    if not re.match(r"<(p|ul|ol|pre|figure|table)\b", inner):
        inner = f"<p>{inner}</p>"
    return f"<{tag}{attrs}>{inner}</{tag}>"


def convert(src, images):
    out = re.sub(r'\s*data-kapi-id="[^"]*"', "", src)
    title = re.search(r"<h1[^>]*>(.*?)</h1>", out, re.S)
    out = re.sub(r"<h1[^>]*>.*?</h1>\s*", "", out, count=1, flags=re.S)
    out = re.sub(r"<(script|style)\b.*?</\1>", "", out, flags=re.S)
    out = re.sub(r"<kapi-kv\b.*?</kapi-kv>", kv, out, flags=re.S)
    out = re.sub(r"<kapi-badge([^>]*)>(.*?)</kapi-badge>",
                 lambda m: f'<span data-type="status" data-color="{BADGE.get(attr(m.group(1), "tone"), "neutral")}">{m.group(2).strip().upper()}</span>', out, flags=re.S)
    out = re.sub(r"<kapi-callout([^>]*)>(.*?)</kapi-callout>",
                 lambda m: f'<div data-type="panel-{CALLOUT.get(attr(m.group(1), "tone") or "note", "info")}">{m.group(2).strip()}</div>', out, flags=re.S)
    out = re.sub(r"<(td|th)(\s[^>]*)?>(.*?)</\1>", cell, out, flags=re.S)

    def figure(m):
        src_, alt = m.group(1), html.unescape(m.group(2) or "")
        cap = re.search(r"<figcaption>(.*?)</figcaption>", m.group(0), re.S)
        caption = html.unescape(re.sub(r"<[^>]+>", "", cap.group(1))) if cap else alt
        ref = images.get(src_)
        if not ref:
            return f"<p><em>[missing image: {html.escape(src_)}]</em></p>"
        return media(ref["fileId"], ref["pageId"], alt or caption, caption, src_.lower().endswith(".png"))

    out = re.sub(r'<figure[^>]*>\s*<img[^>]*\bsrc="([^"]+)"(?:[^>]*\balt="([^"]*)")?[^>]*>.*?</figure>', figure, out, flags=re.S)
    out = re.sub(r'<img[^>]*\bsrc="([^"]+)"(?:[^>]*\balt="([^"]*)")?[^>]*>', figure, out)
    out = re.sub(r"</?kapi-gallery[^>]*>", "", out)
    leftovers = sorted(set(re.findall(r"<(kapi-[a-z-]+)", out)))
    if re.search(r'class="mermaid"', out):
        leftovers.append("mermaid")
    out = re.sub(r"\n\s+", "\n", out)
    return out, (html.unescape(re.sub(r"<[^>]+>", "", title.group(1))).strip() if title else ""), leftovers


def main():
    p = argparse.ArgumentParser(description="Turn a kapi page into a Confluence body, uploading its local images as attachments.")
    p.add_argument("page", type=Path, help="the kapi .html page")
    p.add_argument("--page-id", required=True, help="numeric id of the Confluence page that will own the images")
    p.add_argument("--token-file", type=Path, required=True, help="file holding the mediaToken from createConfluenceAttachment")
    p.add_argument("--site", required=True, help="Atlassian host, for example acme.atlassian.net")
    p.add_argument("--out", type=Path, required=True, help="folder for the renamed images and body.html")
    a = p.parse_args()

    src = a.page.read_text()
    token = a.token_file.read_text().strip()
    (a.out / "img").mkdir(parents=True, exist_ok=True)
    refs = re.findall(r'<img[^>]*\bsrc="(\./[^"]+|[^":]+)"(?:[^>]*\balt="([^"]*)")?', src)
    images, n = {}, 0
    for ref, alt in refs:
        if ref in images:
            continue
        local = (a.page.parent / ref).resolve()
        if not local.is_file():
            print(f"skipped {ref}: not a local file", file=sys.stderr)
            continue
        n += 1
        named = a.out / "img" / f"{n:02d}-{slug(html.unescape(alt) or local.stem)}{local.suffix.lower()}"
        named.write_bytes(local.read_bytes())
        images[ref] = {"fileId": upload(a.site, a.page_id, token, named), "pageId": a.page_id}
        print(f"uploaded {named.name}", file=sys.stderr)

    body, title, leftovers = convert(src, images)
    (a.out / "body.html").write_text(body)
    print(json.dumps({"body": str(a.out / "body.html"), "title": title, "images": n, "unconverted": leftovers}))


if __name__ == "__main__":
    main()
