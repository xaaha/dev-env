---
name: systematic-debugging
description: Find the actual cause of a bug before changing any code. Use when hitting a bug, test failure, flaky test, or any behavior that does not match expectations, before proposing or applying a fix.
---

# Debugging

Four steps in order. Skipping one is how a fix lands that does not hold.

## 1. Reproduce it

Reproduce end to end, the way a user hits it. Not a unit test that approximates the path. The real path.

You do not understand the bug until you can make it happen on demand. Until then every fix is a guess.

Write down the exact trigger: input, state, environment, timing.

Cannot reproduce it? Say so and stop. Do not fix a bug you have not seen.

## 2. Trace to the cause

Start where it breaks and work backward. At each layer ask one question: is this wrong, or was it handed something wrong?

Keep going until you reach the first point where a correct value became an incorrect one. That is the cause. Everything between there and the symptom is downstream noise.

Evidence beats theory. Print the value, read the log, query the row. A plausible story about what happened is not a finding.

Two candidate causes? Prove which one by changing a single thing.

## 3. Fix the cause

Fix the first place it went wrong, not the last place it showed up.

You are patching a symptom if:

- The fix is a null check, a retry, or a try/catch at the point of failure.
- The fix special-cases the input from the bug report.
- You cannot say how the bad value got there, only that it did.
- The fix sits in a different layer than the cause you traced.

A guard at the boundary is worth adding on top of the real fix. It is never the real fix.

## 4. Verify with output

Run the reproduction from step 1. It has to stop reproducing.

Run the suite and state counts: "yarn test, 142 pass, 0 fail". Paste what the command printed.

Never "should work". Never "this should resolve it".

If the report came with a member id, request id, or trace, check that exact case.

## Stuck

Three failed fixes means your model of the bug is wrong. Stop fixing and go back to step 2 with fresh evidence.

Write out what you tried, what you expected, and what happened instead. That usually exposes the wrong assumption.
