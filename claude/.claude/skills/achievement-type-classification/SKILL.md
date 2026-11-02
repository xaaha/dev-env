---
name: achievement-type-classification
description: Classify or re-classify a program's Achievement Type (Certificate-Undergraduate vs Graduate, Bootcamp, Professional Certification, Individual Course, License/CDL, degree levels) from only program name plus academic partner, with mandatory live web verification against the canonical Confluence definitions. Use for legacy "Certificate or Bootcamp" bucket cleanup, single-program classification, or any achievement_type audit or reclassification task.
---

# Achievement type classification

Classify a program's canonical Achievement Type using only its name and academic partner (learning partner, LP). No other database metadata is assumed available.

Every classification requires one live web verification pass. Do not classify from name-pattern matching or memorized knowledge, and do not skip verification because a pattern looks obviously correct. That exact assumption produced the highest error rates in the audit this skill came from.

Built and validated across a full-catalog reclassification of ~2,364 Program Service programs (LM-26536). Every rule below is either the canonical policy doc or a specific miscalibration found and corrected during that audit.

## Canonical source of truth

Confluence, AFO space, [Achievement Type](https://guild-education.atlassian.net/wiki/spaces/AFO/pages/5328371735/Achievement+Type), sections "Proposed Credential Types" and "LP Type as a Classification Signal" (Kiley Larson, accepted 2026-08-21 per the embedded ADR).

Re-fetch that page before relying on it for anything load bearing. It is marked `DRAFT` with open decisions that could still change `ged`, `college-prep`, `language-program`, and `bootcamp`.

## Required input

| Field | Required | Notes |
|---|---|---|
| `program_name` | Yes | Exact name as catalogued |
| `academic_partner` / LP name | Yes | Institution or vendor delivering the program |
| `program_kind`, `prerequisite_level`, any other internal tag | No, weak prior only | See "Internal tags are not authoritative" |

Internal tags decide which programs get individual verification instead of pattern-based batch verification. They never substitute for the web check.

## Step 1. Classify the LP type

| LP type | Examples | Rule |
|---|---|---|
| Academic institution | State universities, community colleges, private colleges | Degree level and certificate level come from the program name plus the verified admission requirement. Certificates default to `certificate-undergraduate` unless this specific program requires a prior bachelor's degree or 6+ years of significant relevant work experience to enroll. |
| Bootcamp provider | General Assembly, Flatiron, Coding Dojo, Springboard, Kenzie Academy, Per Scholas, Merit America, Grand Circus, Tech Elevator, 2U MicroBootCamps, Chegg Skills (rebranded Thinkful) | `bootcamp` regardless of program name or duration. This overrides any "too short to be a bootcamp" instinct. |
| Professional body | PMI, AWS, Google, CompTIA, Salesforce, SHRM, CFA Institute, (ISC)², ISACA | `professional-certification`, but only when this LP is the actual issuing or governing body of the credential, not a reseller training toward it. See step 3. |
| Mixed or platform | Coursera, edX, LinkedIn Learning, Simplilearn, OpenClassrooms | Requires program-level disambiguation. LP type alone is not enough. A Coursera "Professional Certificate" authored by Google is a professional body credential; a Coursera course delivered by a university partner is an academic institution credential. Verify per program. |

The bootcamp provider list merges the doc's four examples with providers confirmed during the LM-26536 audit.

Chegg Skills / Thinkful is a confirmed two-tier exception. It runs a genuine mentored bootcamp tier (20+ hrs/week, career services) and a lightweight self-paced certificate tier (5 to 10 hrs/week, no mentorship) under the same brand. Verify duration and mentorship or career-services language per program before applying the blanket bootcamp rule to this LP. Two independent verification passes disagreeing on this LP is what surfaced the exception. Do not silently pick one side.

## Step 2. Always run one live web verification pass

Non-negotiable, per program, or per representative sample within a verified-uniform batch. See Batching.

Dispatch a read-only research subagent with the `Agent` tool (`Explore` or `general-purpose`) that has `WebSearch` and `WebFetch`. Run batches in parallel, multiple `Agent` calls in a single message.

The agent prompt must require quoting from the LP's own official page, the program page or the admissions and enrollment-requirements page, not a third-party aggregator (course-comparison blogs, Reddit). It must answer explicitly:

1. Is the credential completion-based (finish the curriculum) or assessment-based (pass a standardized exam administered by a governing body)?
2. Does this specific program require a prior bachelor's degree, or 6+ years of significant relevant work experience, to enroll? Not to earn the downstream credential, not an associate's degree, not a co-requisite professional license.
3. If it looks like a professional certification: does this LP own and administer the credential, or is it training learners toward a separate body's exam?

Every answer carries a confidence level (`high`, `medium`, `low`) and a source URL. `low` confidence or missing evidence gets flagged for human review, never guessed.

Model tier: a capable small-to-mid model with web search and this decision tree is sufficient. The entire LM-26536 audit ran on a low-effort tier, including the nuanced findings (eCornell and OpenClassrooms tag-versus-policy conflicts, the Chegg Skills two-tier split, associate-versus-bachelor's distinctions). That worked because the decision tree is explicit and trap-annotated enough for a cheap model to execute reliably, not because the model reasons through ambiguity unprompted. For higher stakes than a one-time catalog cleanup, pass `model: "sonnet"` or `"opus"` on the `Agent` call and treat the cheap tier as the proven floor.

### Two kinds of "name", only one is weak evidence

If internal catalog metadata (`program_kind`, `prerequisite_level`) conflicts with the LP's own page, the verified web evidence wins. During LM-26536, dozens of eCornell and OpenClassrooms programs were tagged `advanced_certificate`, implying Certificate-Graduate, while both providers' own admissions pages stated no prerequisites at all. The tag was simply wrong, carried forward from an earlier, less verified pass. Internal tags and our own `program_name` field are a signal for where to look harder, never a tiebreaker over direct evidence.

That is distinct from how to treat the LP's own naming once you have confirmed its official page. Our `program_name` is weak because it is internal, possibly stale, mistyped, or carried over from an old migration. But once the agent has located the LP's actual current page for this specific program, confirmed by matching course content, code, or description rather than a similar-sounding title, whatever that page calls the credential ("Graduate Certificate", "Certificate of Achievement", "Bootcamp", "Diploma") is first-party authoritative evidence and weighs strong. In the 100-program validation run, Bellevue's own page called a program a "graduate-level certificate" for BSA/MSA students, contradicting our catalog's "Undergrad Cert." name. The LP's page outranks the catalog.

Neither replaces the admission-requirement test in rule 6. A credential's self-description and its actual admission requirement can diverge. eCornell and OpenClassrooms both market credentials with "Advanced" or graduate-sounding names while stating no prerequisites on the same page. When an LP's own naming and its own stated admission requirement genuinely conflict, that is a real anomaly worth flagging at medium or low confidence, not a reason to silently pick one.

Confirm you are on the right page before trusting anything on it. An agent that cannot verify the page matches the catalog program (wrong program, a 404, an ambiguous search result) has zero evidence and must flag for review rather than report a confident-sounding answer anchored to an unconfirmed match. That produced one of the validation run's genuine misses: an agent assigned `certificate-graduate` to an OpenClassrooms program at low confidence after admitting the page it found 404'd. It should have flagged the row.

## Step 3. Apply the decision tree

Run in order. Stop at the first match.

1. Data quality, not classification. Name indicates test, demo, duplicate, or discontinued (`TEST`, `DO NOT USE`, `DNU`, `[DEMO]`, closed-provider entries like Kenzie Academy post-shutdown): flag `DATA_QUALITY_FLAG`, assign no achievement type.

2. License / CDL test. Does completing this program directly confer a state or government-issued license or CDL, with no separate state exam or registry step? Then `license` or `cdl`.
   - Common trap, reject this path: training or exam prep toward a separately administered state credential (CNA training to state competency exam, LPN program to NCLEX-PN, pharmacy tech training to state Board of Pharmacy registration, insurance or electrician exam prep to a state licensing exam) is not itself a license. These stay in the Certificate-UG/Grad track. This was a repeated miscalibration in LM-26536, flagged independently by multiple passes and rejected every time.

3. Bootcamp test. LP is a confirmed bootcamp provider from step 1 and, for dual-tier LPs like Chegg Skills, the specific program matches the bootcamp tier: `bootcamp`.

4. Professional certification test. The credential is assessment-based (exam or competency standard, not program completion) and the issuing or governing body itself is offering this program: `professional-certification`.
   - Common trap, reject this path: a training vendor (Simplilearn, SkillUp, a bootcamp's cert-prep arm) delivering prep courses toward an external body's exam (AWS, CompTIA, CFA, CFP, PMP, Scrum Alliance, ISC², ISACA) is not professional certification. The vendor does not own the credential. Classify by rule 6 instead. This was the single highest-volume correction category in LM-26536, roughly a 90% error rate in the pre-audit professional certification bucket.

5. Individual course test. Program is a single course, not a bundle under one named multi-course credential: `individual-course`.
   - Watch for a platform's named "track" or "program" that is one course under a cosmetic wrapper. Confirm by checking whether the LP's own catalog lists it as a standalone course or a multi-course certificate. Sophia Learning, for example, issues individual courses and Credly badges only, never bundled named certificates.
   - Watch for an elective course that is a component of a larger named credential but catalogued separately.

6. Certificate-Undergraduate versus Certificate-Graduate. The default path for anything not caught above, including most academic institution and mixed/platform programs.
   - Does enrollment in this specific program require a prior bachelor's degree, or 6+ years of significant relevant work experience? Yes: `certificate-graduate`. No: `certificate-undergraduate`.
   - An associate's degree, a professional certification or registry credential (ARRT, RN, CNA), or "recommended but not required" experience does not satisfy this test. Per the canonical doc, "programs requiring only an associate's degree map to certificate-undergraduate." This reversed several LM-26536 classifications that had moved imaging technology certificates (MRI, CT, Mammography, Nuclear Medicine) to Certificate-Graduate because they required a prior ARRT credential plus an associate degree. Associate level is not bachelor's level.
   - Name conventions in our own catalog ("Graduate Certificate", "Post-Baccalaureate Certificate", "Advanced Certificate") are a weak prior, not proof. Verify against the LP's actual page every time. Once confirmed, the LP's own page naming carries real weight, but still corroborate it against the stated admission requirement on that same page. A catalog program literally named "Undergraduate Certificate" sitting in a Graduate-tagged bucket is a tagging error, not a real graduate-level program.

7. Everything else. Trade/vocational, language program, college prep, high school diploma, GED, degree levels (associate's, bachelor's, master's, doctoral): use the canonical definitions directly. These are lower ambiguity and rarely need more than a confirming spot check.

## Step 4. Resolve conflicts, do not guess

- Two independent verification passes disagree: prefer the majority. With no majority (1 versus 1 with good evidence on both sides), escalate for human review rather than picking arbitrarily, and document both findings.
- Before applying any correction, check it against decisions already made in the same pass. If you established that associate-level prerequisites do not qualify for Certificate-Graduate, and a later finding would re-introduce that logic, reject it. Items must not be evaluated in isolation from the standing decisions of the batch.
- Reject recommendations that invert an already-adjudicated policy direction without new evidence, such as a suggestion to move CNA/LPN-adjacent programs to License when the batch already established with evidence that this pattern stays Certificate-UG/Grad.

## Step 5. Aggregate results mechanically, never by hand

This step exists because of a measured failure. A 100-program validation run spent 9.5 of 20.5 total minutes (46%) with zero tool calls, reading ~21 agent reports and holding all 100 verdicts in working memory before writing any code, then hand-typing a 100-row array from memory. The actual web verification took 5 minutes. If aggregation takes longer than verification, something has gone wrong. Aggregation should be close to instant.

Require structured output when dispatching in step 2. Instruct each subagent to write its findings as a JSON file in the scratchpad directory, one file per batch, and to return only the file path plus a one-line count. A subagent's prose summary is not the data.

Each findings file is an array of:

```json
{
  "program_id": "string",
  "suggested_slug": "string",
  "confidence": "high | medium | low",
  "evidence": "quote + source_url",
  "rationale": "names the step 3 rule applied"
}
```

Once every batch has completed:

1. Read each batch's JSON file, not its prose summary.
2. Concatenate all arrays with a short `bash` plus `python3` heredoc script.
3. Write the final CSV in that same script, in one pass, from the merged data.

Never hold dozens of rows in working memory as the aggregation mechanism, and never hand-type a data literal from recollection. If you catch yourself about to compose a long array or table from memory instead of reading it programmatically, stop. That is the anti-pattern that cost 46% of runtime in the validation run.

## Batching for scale

Reclassifying many programs from the same LP at once (for example "all 153 eCornell programs"): spot-check 2 to 3 representative programs per LP and extend high confidence across the batch only when both hold.

- The LP's admission policy is stated as a blanket institutional rule, not program specific, on an official page.
- The spot-checked programs are representative of the range in the batch. Do not spot-check only the shortest, longest, or most generic-sounding titles.

Still flag any program with an unusual name, a program-kind tag that conflicts with the blanket rule, or "advanced" phrasing for individual verification rather than silent inclusion in the pattern.

## Output format

One row per program:

```
program_id (if known), program_name, academic_partner, current_achievement_type,
suggested_achievement_type, suggested_slug, confidence, evidence (quote + source_url), rationale
```

- `confidence`: `high` is a direct LP admissions-page quote, `medium` is pattern-based from a verified blanket LP policy, `low` means could not verify. Flag `low` for human review, do not guess.
- `rationale`: name the specific step 3 rule applied, not just the conclusion. That is what lets later passes catch and correct earlier mistakes.

## Canonical slugs and Program Service IDs

Technical IDs are the canonical schema's `technical_id` values. Program Service's `achievement_type` table carries four legacy display-name mismatches (Confluence ADR, 2026-08-21): `Doctorate Degree` not "Doctoral Degree", `High School` not "High School Diploma", `College Start` not "College Prep", `Language` not "Language Program". The `achievement_type_id` UUIDs are stable; the doc's proposed display names are not reconciled with the DB's actual display names. Query `achievement_type` directly, do not assume the doc's wording.

| Display name (doc) | Technical ID | `program_service_prod.public.achievement_type.id` |
|---|---|---|
| Certificate, Undergraduate | `certificate-undergraduate` | `f0154f11-6f3f-48c5-bd22-a48f71b44a77` |
| Certificate, Graduate | `certificate-graduate` | `18b669d2-42b7-4a8d-b886-d047a35d2b08` |
| Bootcamp | `bootcamp` | `9d531d65-fa0e-49c5-bc9a-1166754fa43d` |
| Professional Certification | `professional-certification` | `8ca27ade-d538-48e6-98ed-d6e159d02b60` |
| Individual Course | `individual-course` | `c2f7aa97-120d-46cf-8472-2e92678d85a6` |
| Trade / Vocational | `trade-vocational` | `ee2d29c0-4c7c-403a-aa51-e03d6a7ac651` |
| CDL | `cdl` | `bfc556b1-816e-4bf2-97d8-3cf4c6250100` |
| License | `license` | `7fca4532-46d8-4218-96a3-b98b5c83c538` |
| Language Program | `language-program` | `22935914-6b45-4345-86ef-ae03f9cc9abc` |
| College Prep | `college-prep` | `255fd679-c827-4ef9-a96d-c4e4c0423ca8` |
| High School Diploma | `high-school-diploma` | `e1b0d07f-1ee0-4458-be89-60bb23c11025` |
| GED | `ged` | `eb3c5618-2082-4e29-a230-992d6b89a310` |
| Associate's Degree | `associate-degree` | `cc24062e-1597-4638-a0d5-018c065a9b14` |
| Bachelor's Degree | `bachelor-degree` | `9de23578-1482-47c2-9869-589572649f44` |
| Master's Degree | `master-degree` | `73ac374c-511e-4629-85c1-3ec097eb43b5` |
| Doctoral Degree | `doctoral-degree` | `e3d97f9e-e8cd-4bb8-a463-dbe82ac647dc` |
| Unknown | `unknown` | `15692fce-0ea7-4e40-944f-21fa80592539` |
| Legacy, pre-disambiguation: Certificate or Bootcamp | `legacy-certificate-or-bootcamp` | `c2fdfb29-5208-4cde-8d6a-3f75a211a312` |

Verify these IDs against the live `achievement_type` table before using them in a write. This list is a snapshot from the LM-26536 audit (2026-10), not a live query.

## Lessons learned, LM-26536, ~2,364 programs audited

Error rates varied enormously by bucket. This is the strongest argument for never skipping step 2, even on patterns that look obvious.

| Bucket | Approx. error rate found | Dominant failure mode |
|---|---|---|
| Professional Certification (pre-audit) | ~90% | Reseller or training-vendor credential treated as owned by the vendor instead of the exam body |
| Bootcamp (pre-audit) | Low but non-zero | Duration-based "too short to be bootcamp" overrides that ignored confirmed-provider status |
| Individual Course (pre-audit) | Low to moderate | Elective course components and single-course products mislabeled as standalone certificates |
| Certificate-UG/Graduate (full sweep) | ~3.8% | Internal `advanced_certificate` tags contradicted by the LP's own stated admissions policy; associate-level prerequisites miscounted as satisfying the bachelor's-or-experience test |

Other recurring patterns:

- Duplicate and stale catalog entries surface constantly in this kind of audit: the same program under two UUIDs, discontinued providers, renamed programs. These are data-quality findings, not achievement-type corrections. Track them separately, do not let them block the classification pass.
- A program named "Undergraduate Certificate" sitting in the Graduate bucket, or the reverse, is a near-certain tagging error, not a real edge case. Fix on sight.
- Two passes giving opposite answers about the same dual-tier LP (see Chegg Skills) is a real signal the LP has a split product line. Do not force a single blanket rule onto it.
