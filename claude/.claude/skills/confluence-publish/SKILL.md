---
name: confluence-publish
description: Publish a kapi page, or any local HTML page with images, to Confluence with its images inline. Use when asked to push, publish, export, move or copy a page or notes to Confluence, given a Confluence link or a place in words such as "my space" or "Team > notebook > tests".
---

# Confluence publish

Confluence will not import an HTML file. This recipe uploads the page's images as attachments and writes the body in the HTML the Atlassian connector accepts, so the images show inline.

## Steps

1. Find the target page.
   - A link: the number after `/pages/` is the page id.
   - Words: search Confluence by space and title. Exactly one match: use it and name it in your reply. None or several: ask before uploading anything.
   - The page has content: tell the person it gets replaced and that Confluence keeps the earlier version in its history. A repeat export of the same page updates the same Confluence page.
2. Read the format guide once per task: `getContentFormatGuide` with `toolName: createConfluencePage`.
3. Get an upload token: `createConfluenceAttachment` with `contentId` set to the page id and any `localFilePath`, keeping only `mediaToken`. Write it to a file in the scratchpad. It expires in 5 minutes, so run step 4 straight away.
4. Run the script. It renames the images from their captions, uploads them, and writes `body.html`:

   ```bash
   python3 -I scripts/publish.py <page.html> --page-id <id> --token-file <file> --site <host>.atlassian.net --out <scratchpad dir>
   ```

   It prints the page title, the image count, and any `unconverted` kapi presets. Diagrams and `kapi-render` mockups do not carry over. Screenshot them and attach them as images, or tell the person they were left out.
5. Publish with `updateConfluenceContent`, `body.format: html`, the contents of `body.html`, and the `snapshotToken` from `getConfluenceContent`. Replace the whole body, or only the matching section when the page holds other material worth keeping. Say which you did.
6. Read the page back in Markdown. `lostFeatures` listing `ac:image` means the images are attachments, which is expected. Reply with the link, the image count, and anything left out.

The page goes up exactly as written, so check it for secrets or test logins before publishing to a shared space.
