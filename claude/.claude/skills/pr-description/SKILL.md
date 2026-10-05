---
name: pr-description
description: Write a PR description and open the pull request. Use when asked to create, open, or raise a PR, or to write, rewrite, or shorten a PR description or body. Enforces a short two-section format and fills a repo PR template only where there is real content.
---

# PR description

The reviewer reads the diff. The description says what problem this fixes, what changed, and where the reasoning lives.

## Shape

````
## Summary
<one sentence: the problem this fixes>

- <what changed>
- <what changed>
- Decision and rationale: <link>

## Ticket
<url>
````

- Summary line: one sentence, under 20 words, present tense. Names the problem, not the implementation.
- Bullets: at most 5, under 15 words each. Each is a change with its consequence. Numbers where they exist.
- Rationale is linked, never written out.
- Nothing else.

More than 5 real changes means the PR is too big. Write the 5 largest and say it should be split.

## Title

`<TICKET-KEY> <what changed>`, no full stop. Not the summary line: the summary names the problem, the title names the change.

Use a different convention only if the last few merged PRs in that repo agree on one.

## Repo template

Check `.github/pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE/*.md`, `docs/`, and the root.

If one exists: its headings, its order. Fill only sections with real content and delete the rest, heading included. Never N/A or a placeholder. Tick only boxes you verified. Caps above still apply.

## Ticket reference

First hit wins: a ticket key in the branch name, then that key in Jira through the Atlassian MCP (use its real title to write the summary line), then an open GitHub issue (add `Fixes #123` as the last line). Nothing found: write from the diff and carry on.

## Never

- "This PR", "This change", "In this PR".
- A file-by-file walkthrough, or any restatement of the diff.
- Rationale, alternatives, risk, rollback, or future work as prose. Link it.
- Improves, enhances, ensures, leverages, robust, seamless, comprehensive.
- Em dashes, bold.

## Model

GuildEducationInc/guild-tuition#3037, titled `MX-4330 fix where migrated requests land, and drop unclaimable rejects`:

````
## Summary
Migrated rejects land in a state the member can never act on.

- `rejected` and `restarted` now target `PENDING_REVIEW`; nothing maps to `CORRECTIONS_REQUESTED`
- `pre_approval_rejected` lands as a spend-period shell, so `submitRequest` stamps its own date
- Drops fixable rejects whose submission window closed before cutover: SCH 63 to 48
- Blocks the achievement when every term carries an unwalkable target
- Decision, rationale and the open questions are here:
    - <confluence url>

## Ticket
<jira url>
````

## Steps

1. `git log origin/main..HEAD --oneline` and `git diff origin/main...HEAD --stat`.
2. Find the template and the ticket.
3. Write the body to a file in the scratchpad, pass it with `--body-file`.
4. Push the branch if it has no upstream: `git push -u origin HEAD`. Never push to main.
5. A PR already exists: `gh pr edit --body-file <path>`. Otherwise `gh pr create --title "<title>" --body-file <path>`.
6. Print the URL. Nothing else.
