---
name: pr-review
description: Review a PR, branch, or local diff for bugs, design, completeness, tests, and clarity, covering everything Shawn's and Liz's Guild review skills check. Sizes the review to the diff and spawns only the agents it needs, often none. Reports findings to the user in plain English and never posts to GitHub. Use when asked to review a PR or diff, or from ticket-workflow once the PR is open.
---

# PR review

Checklists come from Shawn's and Liz's skills: https://github.com/GuildEducationInc/guild-ai-skills/tree/main/engineering/pr-review. Their posting and tone are dropped.

## Rules

- Never post, comment, approve, request changes, or resolve threads on GitHub. The user does that.
- Never edit the branch. Read, search, and run safe checks. Anything that writes files runs in a disposable worktree.
- Verify every finding against the code before reporting it. Anything not verified is marked `unverified`.
- No lint-level style nits. Pre-existing issues outside the diff go in follow-ups, unless the diff makes them worse.

## 1. Read

- PR: `gh pr view <n> --json title,body,baseRefName,headRefOid,files` and `gh pr diff <n>`. Local: `git diff <base>...HEAD`.
- The ticket from the title or branch, through the Atlassian MCP.
- Every changed file in full, plus direct callers of changed functions.

## 2. Size the review

The main thread runs the whole checklist. Spawn an agent only for a lookup that is wide and independent. When no row below matches, spawn nothing.

| Signal in the diff | Spawn |
|---|---|
| Changed exported symbol, route, event, schema, shared config, or published package | one `Explore` agent: every consumer in the repo, plus `gh search code <bare symbol> --owner GuildEducationInc`, one symbol per query; each consumer marked updated, stale, or unaffected |
| `.github/workflows/` or action versions | one agent: each pinned version exists (`gh release list`), and caller job permissions cover what the called workflow needs |
| DB migration or data backfill | one agent: locks, rollback, rows affected, behavior against current data |
| Over ~800 changed lines across 3 or more modules | one agent per module group, max 3, each running section 3 on its files only |
| A blocker that rests on a design judgment | one agent told to refute it; drop the finding if the refutation holds |

Use `model: haiku` for searches and version checks. Give each agent one narrow task and ask for findings with file and line, not prose.

## 3. Check

Skip a list that cannot apply to the diff.

Correctness
- Boundaries: empty, null, zero, off-by-one, time zones, ordering, duplicates.
- Errors: no swallowed `catch`, no fallback that hides a failure, no invented success. "Key missing, return undefined" is a real branch; "call failed, carry on" is a bug.
- Authorization, concurrency, retries, idempotency wherever the code touches them.
- Recovery paths such as rollback and retry are real code with tests, and "recovery also failed" is loud.

Design
- Business logic is separate from I/O. AWS, network, DB, clock, and env are wired in one place so the logic runs with fakes.
- Each module has one reason to change. Two files that must be kept in sync by hand should be one source of truth.
- An abstraction earns its keep. A concept repeated across call sites gets one name and one home.
- Core code does not import entrypoint or CLI concerns.
- Input is validated where it enters, with an error that says what is wrong and how to fix it. Illegal states are blocked by types, not by comments. Name and key collisions are guarded.
- The PR does one thing. Generality added "while we're here" is a follow-up. Before calling a choice wrong, check whether a platform limit or a published contract forces it.

Completeness
- Every consumer of a changed thing is updated. Report X of Y.
- Siblings in the same repo: README examples, docs, fixtures, config, other copies of the same pattern.
- The PR body's scope matches the diff. "All workflows" with 3 of 5 touched is a finding.
- Pinned versions exist and are current. The lockfile resolves.
- What runs after merge: workflows, env gates, deploys, migrations, jobs. Will each pass?
- Claims are checked, not trusted: "tests pass", "no breaking changes", "removed everywhere". Spot-check at least one version, URL, or date.

Tests
- A plausible wrong implementation the tests would still pass.
- Assertions against a hand-copied expectation instead of the real output.
- Mocks so broad the test checks the mock.
- Branches no test can reach. Missing failure-path tests. Timing or ordering flakiness.

Clarity and hygiene
- Docs or comments that contradict the code. Two docs covering the same thing.
- Text that reads wrong once merged: "new in this PR", "renamed from X".
- Unexplained magic numbers, pinned versions, regions, or IDs. Acronyms not spelled out on first use.
- Names that make sense to whoever consumes the surface, not only the author.
- Error messages a newcomer could act on.
- Real ARNs, account IDs, hostnames, or secrets in docs, examples, logs, or error bodies.
- Guild conventions, checked against one or two sibling repos: Yarn not npm, Jest or Vitest, TSDoc on non-obvious exported API where the repo uses it, ROCS tags on infra, current runtime versions.
- PR title type (`feat:`, `fix:`, `chore:`) matches the change when the repo uses conventional commits. Ticket key in the title or branch.
- Mixed scope, such as a refactor inside a feature. A TODO with no ticket.

Automation
- Manual work in the PR that will recur, such as the same edit across many repos. Note it as a follow-up.

## 4. Report

Rank by impact across all lists:

- Blocker: wrong behavior, data loss, security hole, broken CI or deploy, missed consumer.
- Should fix: a design or test gap that will cost later.
- Nit: clarity, naming, docs.

Write each finding so someone who has not read the code understands it. Plain words, no jargon standing in for an explanation.

```
<level> `path:line` <what is wrong, one sentence>
Why: <what breaks and for whom, one sentence>
Fix: <smallest change that solves it, one sentence>
```

Then:

- Completeness: X of Y consumers updated, or "no shared surface".
- After merge: what to watch or do.
- Follow-ups: out-of-scope issues and automation ideas, one line each.
- Agents: which ran and why, or "none".
- Not covered: checks not run and why.

Zero findings is a valid result when the report says what was covered.

Called by a user: up to about 12 lines prints in the terminal; longer goes to a kapi page with two lines in the terminal. Called by another skill or agent: return the report as text and publish nothing.

## Called from ticket-workflow

The caller passes a review packet. Also trace every acceptance criterion and D-ID to code and to a check: missing behavior, extra behavior, contradictions, and any decision that conflicts with the requirement. Inspect the tests themselves rather than trusting reported mutation results.
