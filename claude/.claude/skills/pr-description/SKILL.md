---
name: pr-description
description: Write a PR description and open the pull request. Use when asked to create, open, or raise a PR, or to write, rewrite, or shorten a PR description or body. Enforces a short lead-line-plus-bullets format and fills a repo PR template only where there is real content.
---

# PR description

The reviewer reads the diff. The description says what problem this fixes and what changed. Nothing else.

## Shape

With no repo template, the entire body is:

```
<one sentence naming the problem this fixes>

- <what changed>
- <what changed>
- <what changed>
```

Caps, no exceptions:

- Lead line: one sentence, under 20 words, present tense. Names the problem, not the implementation.
- Bullets: at most 5, under 15 words each, one per meaningful change.
- Nothing else. No headings, no intro, no closing paragraph.

If the diff has more than 5 meaningful changes the PR is too big. Write the 5 largest and say the PR should be split.

## Repo template

Look for `.github/pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE/*.md`, `docs/pull_request_template.md`, and the repo root.

If one exists:

- Use its headings, in its order.
- Fill only the sections you have real content for. Delete every other section, heading included.
- Never write N/A, TBD, or a placeholder. A deleted section is better than an empty one.
- Keep checklists. Tick only boxes you actually verified.
- The caps above apply inside each section.

## Issue reference

Check in this order and stop at the first hit:

1. A ticket key in the branch name, such as `ABC-1234` or `123`.
2. That key in Jira through the Atlassian MCP. Use the ticket's real title to write the lead line.
3. Open GitHub issues matching the branch or the change. Add `Fixes #123` as the last line of the body.

Found nothing: write the lead line from the diff and carry on. Do not ask.

## Never write

- "This PR", "This change", "In this PR", "This commit".
- A file-by-file walkthrough, or any restatement of code the reviewer can read.
- Why this approach was chosen, alternatives considered, risk, rollback, future work, or what to watch after deploy. Only if a template heading asks for it.
- Improves, enhances, ensures, leverages, robust, seamless, comprehensive.
- Em dashes or bold.

## Example

The diff dedupes webhook deliveries.

Wrong:

```
## Summary

This PR addresses an issue where webhook deliveries that were retried could
result in duplicate charges being applied to customer accounts.

The root cause was that the `WebhookQueue` class did not check whether an
event had already been processed before handing it to the charge handler.
When the retry cron fired it would re-enqueue events already in flight.

## Changes

- Modified `WebhookQueue.enqueue()` to check the idempotency key against the
  `webhook_events` table before enqueueing
- Removed the `retry_webhooks` cron job in `config/schedule.rb`
- Added exponential backoff to the delivery path
- Added a unique index on `webhook_events.key` via migration

## Risk

Low. The change is isolated to the webhook path and is covered by tests.
```

Right:

```
Fixes duplicate charges when a webhook delivery is retried.

- Dedupes by idempotency key in `WebhookQueue`
- Drops the `retry_webhooks` cron for exponential backoff
- Adds a unique index on `webhook_events.key`
```

## Steps

1. `git log origin/main..HEAD --oneline` and `git diff origin/main...HEAD --stat` to see the scope.
2. Find the template. Find the issue.
3. Write the body to a file in the scratchpad directory. Use `--body-file` so nothing has to survive shell quoting.
4. Title is the lead line without its full stop. If recent merged PRs use a prefix convention such as `fix:` or `[ABC-1234]`, match it.
5. Push the current branch if it has no upstream: `git push -u origin HEAD`. Never push to main.
6. An open PR already exists for this branch: `gh pr edit --body-file <path>`. Otherwise `gh pr create --title "<title>" --body-file <path>`.
7. Print the PR URL. Nothing else.
