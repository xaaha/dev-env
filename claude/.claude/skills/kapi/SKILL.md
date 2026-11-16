---
name: kapi
description: Share a durable HTML page with the user where both of you can edit, annotate, send messages, and review visual work through the kapi CLI. Use when the user mentions kapi or when a long plan, report, comparison, diagram, or implementation review is easier to understand on one shared page than in chat.
license: MIT
metadata:
  author: Pratik Thapa (xaaha)
  argument-hint: <page to work on>
---

# kapi

Use kapi for substantial work that benefits from a shared visual page. The page file, event log, revisions, and each reader's position are durable across agent and daemon restarts.

## Rules

- Run `kapi` first. It lists active pages, unread work, and the next commands to use.
- Use `kapi --help`, `kapi <command> --help`, and `kapi preset` as the current source of truth for commands and page structure.
- Write only the plain HTML and kapi presets the CLI documents. Keep the page source reviewable and update it as the work changes.
- Keep `kapi wait <page>` running as a background task when the harness reliably wakes you after it exits; start it again after each event and before going idle. Use `kapi watch <page>` only when the harness reliably delivers every streamed line.
- Acknowledge what you read with the CLI's current `say --seen`, `say --reply`, `seen`, or `pending` workflow.
- Stop watching after the user ends the session.

## Do not

- Do not require Node, npm, npx, or a separate browser package. The installed kapi binary contains and serves the browser JavaScript.
- Do not copy command flags or preset syntax from this skill when CLI help differs; installed skills can outlive the CLI version that wrote them.
- Do not add scripts, inline styles, iframes, or arbitrary application JavaScript to a kapi page.
- Do not detach a watcher in a way that cannot wake or resume this agent.

## Request

$ARGUMENTS

If a page is named, run `kapi` to inspect its state and then follow the current CLI guidance for that page. If no page is named, run `kapi` and pick up any page with unread messages.
