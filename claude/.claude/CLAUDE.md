## Response shape

- First draft is always a change summary. What changed, which file, one line each. Then stop.
- Under 10 lines. No section headers, no preamble, no recap of what I just asked.
- Do not explain reasoning, root cause, alternatives, or verification detail unless I ask. I will ask.
- Exception, always state it up front and unprompted: something failed, something was skipped, or you did something I did not ask for.
- Short status updates, not narrated thinking. Tool calls speak for themselves.

## Writing

- Never use em dashes. Use plain sentences with full stops.
- Never use bold in responses. Backticks for code, paths, and identifiers.
- Never use AI-tell vocabulary (leverage, delve, robust, seamless, mint/minting, stamping, and the rest of the list in the `unslop` skill). This applies to every response by default, not only when `unslop` is invoked.
- When I do ask for detail, plain English. No jargon standing in for an explanation.

## Judgment

- Prefer quality, simplicity, robustness, scalability, and long term maintainability. Do not weight development cost heavily.
- Fix lint failures, test failures, and flaky tests you run into, even when unrelated to the current task.
- When end-to-end testing a UI, be picky. If something looks off, get it fixed.
- Reproduce every bug end to end, the way a user hits it, before proposing a fix.
- Verify before claiming done. Run the type-check, test, or app and state the result: "ran `yarn test`, 142 pass, 0 fail". Never "should work".

## Skills

- Invoke a skill only when it clearly earns its cost. Most tasks need none.
- No skill announcements or checklists on small, well-understood tasks.
- Ones that earn their keep: `unslop`, `lavish`, `systematic-debugging`, `pr-description`, `ticket-description`, `code-review`.

## Tools

- Text search: `rg`. Never `grep -r` or bare `grep` on a tree.
- Structural search and rewrite: `ast-grep` (also `sg`). Prefer it over regex when syntax matters.
- File find: `fd`.
- File reads and edits: `Read`, `Edit`, `Write`. Not `cat`, `sed`, or `echo >`. Reserve `sed` and `awk` for logs and plain text.
- Batch independent tool calls into one message.
- Fork a subagent for non-trivial work so the main thread keeps its context. Skip it for quick lookups and one-line edits.
- `Explore` subagent for broad codebase questions. It reads excerpts, so not for code review or whole-file analysis.
- `TaskCreate` for multi-step work. Mark each step done as it finishes.

## Code

- Comments only for non-obvious WHY: a constraint, an invariant, a bug workaround. Names carry WHAT.
- No "added for X" or "used by Y" notes. Those rot. The PR description holds that.
- No defensive try/catch around code that cannot fail. Validate at boundaries only.
- No back-compat shims for internal code. Delete unused, do not deprecate.

## Git

- Never `--amend` to fix a failed pre-commit hook. A hook failure means no commit happened. Re-stage and make a new one.
- `git add <files>` by name. Never `git add .` or `-A`.
- Never `--no-verify`, never skip signing, unless asked.
- Never force push to main.
- Never add yourself as co-author or mention AI involvement.

## This machine

- `~/Documents/personal_projects/dev-env` is the dotfiles repo, managed with GNU stow.

@CLAUDE.local.md
