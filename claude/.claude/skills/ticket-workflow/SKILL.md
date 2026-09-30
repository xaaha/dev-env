---
name: ticket-workflow
description: Take a ticket from decisions to a reviewed PR. Use when asked to work on, implement, pick up, or land a ticket, issue, or Jira key. Settles decisions before any code, one commit per decision with its test, then an independent adversarial review and a bot-comment sweep.
---

# Ticket workflow

Five phases in order. Do not start the next one early.

## 1. Settle the decisions. Write nothing until they are approved.

Read the ticket and the code. List every decision the ticket forces, numbered `D1`, `D2`, and so on. For each: the choice, your recommendation, and the evidence behind it. A file and symbol, a ticket, a schema field. Not a feeling.

Then stop and ask for approval. Write no code, no tests, no branch until the user says yes.

A decision is anything where a reasonable engineer could pick differently and the code would change. Where two sources disagree, say so and name both.

If the user changes a decision, renumber nothing. Keep `D2` as `D2` with its new answer, so commits and tests stay traceable.

## 2. Turn each decision into an assertion

Every approved decision gets at least one test that fails if the decision is violated. The test name says which decision it guards.

A test that passes whether or not the decision holds is not a test. Before moving on, break the implementation on purpose and confirm the test fails. State that you did.

## 3. One commit per decision

Each commit lands one decision whole: its test and the implementation that satisfies it. A reviewer reads one commit and sees a claim plus its proof.

- Order commits so each builds on the last. No commit leaves the suite red.
- The subject names the decision: `D2: exclude closed-window rejects`.
- Never `--amend`. A failed hook means no commit happened, so re-stage and make a new one.
- `git add <files>` by name.
- Run the suite before each commit and state counts.

By the last commit the branch is the whole change, reviewable in sequence.

## 4. Independent adversarial review

Open the PR first. Use the `pr-description` skill for the body, because the reviewers only get what it says.

Then spawn three agents in parallel, in one message. Each gets the PR body and the diff and nothing else.

Use a fresh `general-purpose` agent for each. Never `subagent_type: "fork"`. A fork inherits this conversation and would review its own reasoning, which is the one thing this phase exists to prevent. Do not tell them what you intended, which parts you are unsure about, or that the decisions were approved.

The three angles:

- Correctness. Where does this break? Edge cases, error paths, concurrency, data that does not look like the happy path.
- Decisions. Read `D1` onward from the PR body. Does the code actually do that? Find where it diverges.
- Tests. Would each test fail if the thing it guards were wrong? Find assertions that cannot fail.

When they report back, verify each finding yourself before changing anything. Agents produce confident false positives. Reproduce the failure or point at the code that proves it. Say which findings you rejected and why.

Fix what survives as new commits, same one-idea-per-commit rule.

## 5. Bot sweep: fix the hole, not the comments

`cursor[bot]` and `cycode-security[bot]` comment one at a time and can leave a hundred of them. Do not walk the list.

Collect everything first:

```
gh api repos/<owner>/<repo>/issues/<pr>/comments   --paginate   # PR-level, cursor[bot]
gh api repos/<owner>/<repo>/pulls/<pr>/comments    --paginate   # line-level
gh api repos/<owner>/<repo>/pulls/<pr>/reviews     --paginate   # cycode-security[bot]
```

Then group by cause, not by comment. Forty comments about an unvalidated field are one missing guard. Fifteen about a hardcoded path are one constant. Report the grouping before you fix: how many comments, how many actual causes.

Fix each cause once, in one commit, and say which comments it resolves. A commit per comment is the failure mode here.

What is left after grouping is genuine one-offs. Handle those individually, and reject the ones that are wrong, saying why. A bot is not automatically right.

Poll for up to 20 minutes after opening the PR. If a bot never reports, say which one and stop waiting rather than hanging.

## Done

Ping through the terminal bell when the PR is clean: suite green with counts, review findings resolved or rejected with reasons, bot causes fixed.

Then report, short: the PR link, the commits in order, what the review caught, how many bot comments collapsed into how many fixes.

Never merge. Opening the PR is where this ends.
