---
name: ticket-description
description: Write or tighten a Jira ticket description and save it to the ticket. Use when asked to write, rewrite, shorten, clean up, or file a ticket, issue, bug report, or story. Enforces a short per-type shape while keeping every concrete fact.
---

# Ticket description

A PR description can be short because the diff carries the detail. A ticket has no diff. The description is the only record, so the rule here is different.

Cut words, never cut facts. Remove narration, background the team already knows, hedging, and restatement. Keep every error string, id, number, step, and link.

## Bug

```
<one sentence: what goes wrong, from the user's side>

Repro:
1. <step>
2. <step>
3. <step>

Expected <x>, got <y>.

<env, version, ids, links>
```

Lead line under 20 words. Steps under 12 words each, as many as it takes. Expected and actual on one line. Facts on the last line, bare, no prose around them.

## Story

```
<one sentence: who cannot do what today>

Done when:
- <observable condition>
- <observable condition>
```

Lead line names the gap, not the feature. Conditions must be checkable by someone who did not write the ticket. Max 6, under 15 words each.

Skip "As a user I want, so that" unless the team's template demands it.

## Task

```
<one sentence: what needs doing and why now>

- <what>
- <what>
```

Max 5 bullets, under 15 words each.

## Never cut

These survive every rewrite, no matter how long the result gets:

- Error text and stack traces, quoted exactly. A paraphrased error is unsearchable.
- IDs and environment. Member id, request id, trace id, env, version, region, timestamp.
- Repro steps, as a numbered list. Never compressed into a sentence.
- Links out. Datadog, log queries, Slack threads, related tickets. Bare links, no description.

## Never write

- Background the team already knows.
- A guess at the root cause, or a proposed fix, in a bug. That is triage and it is usually wrong.
- The title restated as the first line of the body.
- Priority, severity, or urgency as prose. Those are fields.
- "This ticket", "This issue", "We should", "It would be good to".
- Improves, enhances, ensures, leverages, robust, seamless, comprehensive.
- Em dashes or bold.

## Rewriting an existing ticket

The risk is losing a fact someone needs later. Before replacing anything:

1. Read the current description.
2. List every concrete fact in it. Errors, ids, versions, steps, links, names, dates, numbers.
3. Write the new description.
4. Check the list. Every item appears in the new text, or it was a duplicate of something that does.

If a fact does not fit the shape, put it on the trailing facts line. Do not drop it.

## Example

Same bug, as filed and as it should read.

Filed:

```
Hi team, we have been seeing some strange behaviour in the webhook
pipeline over the last couple of days and I wanted to raise a ticket
so we can track it properly.

As you may know, the webhook system is responsible for delivering
charge events to the billing service. There is a retry mechanism in
place for when deliveries fail, which is generally a good thing.

However, it seems that in certain circumstances the retry can cause
the same event to be processed more than once, which results in the
member being charged twice. I believe this may be related to the
idempotency handling but I have not confirmed this yet. It might also
be worth looking at whether the cron schedule is too aggressive.

This is fairly important as it affects billing. One member reported
it yesterday. I tried it on staging and was able to see it happen.
Happy to pair on this if useful.
```

Should read:

```
A retried webhook delivery charges the member twice.

Repro:
1. Submit a charge webhook
2. Kill the delivery worker mid-request
3. Wait for the retry_webhooks cron to fire

Expected one charge, got two.

staging, api v4.2.1, member 88231, 2026-09-28 14:02 UTC
https://app.datadoghq.com/logs?query=webhook_retry
```

The guess about idempotency, the offer to pair, and the explanation of what webhooks are all went. Every fact stayed, and two that were missing got added.

## Steps

1. Work out the type. Bug, story, or task.
2. Rewriting: `getJiraIssue` for the current description, issue type, and project.
3. Call `getContentFormatGuide` before composing. Jira description fields are not plain markdown and the format differs by instance.
4. Rewriting: run the fact checklist above.
5. Compose to the shape for the type.
6. `createJiraIssue` for a new ticket, `editJiraIssue` for a rewrite.
7. Print the ticket key and URL. Nothing else.
