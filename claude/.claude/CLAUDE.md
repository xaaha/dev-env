# Global Claude Code Guidance

User-level preferences. Loaded every session. Project-level `CLAUDE.md` overrides where conflicting.

## Search & file tools

- **Code text search**: use `rg` (ripgrep). Only use `grep` when `rg` is not available. Never `grep -r` or plain `grep` on trees.
- **Structural / AST search**: use `ast-grep` (binary also exposed as `sg`) for syntax-aware queries — refactors, finding call sites by shape, language-aware lints. Prefer over regex when you care about syntax (e.g. "all `useEffect` with empty deps", "all `console.log` calls", "all `fn` returning `Result<_, _>`").
- **File find**: use `fd` over `find` when available. Falls back to `find` only if `fd` missing.
- **No `awk`/`sed` for code**: use `rg --replace`, `ast-grep --rewrite`, or `Edit`/`Write` tools. `sed`/`awk` reserved for log/CSV/plain-text munging.
- **File reads/edits**: always prefer `Read`, `Edit`, `Write` tools over `cat`/`sed`/`echo >`. Better diffs, better permission UX.

### Quick reference

| Task                                 | Tool                                                         |
| ------------------------------------ | ------------------------------------------------------------ |
| Find string in repo                  | `rg 'pattern'`                                               |
| Find files by name                   | `fd 'name'`                                                  |
| Find function/class definition shape | `ast-grep --pattern 'function $NAME($$$) { $$$ }' --lang ts` |
| Rewrite syntactic pattern            | `ast-grep --pattern '...' --rewrite '...' --lang ts`         |
| Inspect one file                     | `Read` tool                                                  |
| Modify file                          | `Edit` / `Write` tool                                        |

## Agentic coding workflow

- **Parallel tool calls** — when calls are independent (multiple Reads, multiple greps, multiple git inspects), batch them in one message.
- **Use `Explore` subagent** for broad codebase questions (3+ queries). Saves context window. Don't use it for code review or whole-file analysis — it reads excerpts.
- **Verify before claiming done** — type-check, test, or run the app. State results: "ran `yarn test`, 142 pass, 0 fail". Don't say "should work" — show it.
- **TaskCreate** for any multi-step work. Mark completed as soon as each step finishes; don't batch.
- **Don't narrate thinking** — short status updates only. Tool calls speak for themselves.

## Code style

- No comments unless they capture non-obvious WHY (constraint, invariant, bug workaround). Identifier names carry WHAT.
- No "added for X" / "used by Y" references — those rot. PR description holds that.
- No defensive `try/catch` around code that can't fail. No fallbacks for impossible states. Boundary validation only.
- No backward-compat shims when changing internal code. Delete unused, don't deprecate.

## Git

- New commits, never `--amend` to "fix" a failed pre-commit hook. Hook failure = no commit happened. Re-stage and make a new commit.
- `git add <files>` by name. Never `git add .` or `-A` — risks .env, secrets, large binaries.
- Never `--no-verify` or skip signing unless explicitly asked.
- No `git push --force` to main.

## Project context

- `~/Documents/personal_projects/dev-env` is the dotfiles repo, managed with GNU stow.

## Memory hygiene

- Auto-memory is at `~/.claude/projects/<cwd-slug>/memory/`. Index in `MEMORY.md`.
- Save: user role, feedback (with **Why:** + **How to apply:**), project state (with absolute dates), external refs.
- Don't save: code patterns derivable from repo, recent git history, debug recipes, ephemeral state.

## Defaults

- Model: `opus[1m]` (1M-token context).
- Editor mode: `vim`.
- Effort: `high`.
- Co-authored-by attribution: off.

## Machine-local overlay

Optional. Untracked. Add machine-specific context (work repo conventions, employer-internal services) at `~/.claude/CLAUDE.local.md`. Missing file = no-op.

@CLAUDE.local.md
