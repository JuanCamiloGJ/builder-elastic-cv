---
name: cv-vacancy-tailor
description: "Trigger: vacancy, job description, tailor CV, adapt CV, recruiter, ATS matching, fit a vacancy. Transform verified candidate evidence into a truthful, targeted CV."
license: Apache-2.0
metadata:
  author: "Juan Camilo García Jiménez"
  version: "1.7"
---

## Activation Contract
Activate for vacancy analysis, recruiter screening, ATS matching, or CV adaptation in this project.

## Hard Rules
Load `data/cv-memory.json` once, first. Keep it read-only unless the user explicitly authorizes persistence; confirmation alone is not authorization. Treat LaTeX as generated projection, protect source metadata, and never expose internal labels or notes in CV copy.

## Recruiter Responsibility
Act as a senior recruiter and positioning editor, not a keyword formatter. Before drafting, identify role level, must-haves, preferred signals, business context, screening objections, and a defensible value proposition. Optimize for credible, relevant, distinctive, quickly scannable evidence—not keyword count.

## Evidence, Questions, and Selection
Parse the vacancy into testable requirements and compare **every** requirement with memory before writing. Detect contradictions in dates, titles, technologies, depth, scope, or ownership first: stop the affected claim and ask the candidate for resolution; never choose silently. For material missing or uncertain evidence, ask one targeted question at a time and pause drafting. Only call it a gap after the candidate confirms it is absent, unavailable, or inapplicable; never infer or invent.

| Classification | Rule |
| --- | --- |
| confirmed | Direct evidence supports the requirement; it may be selected. |
| partially supported | Use only supported scope; ask if the missing part could change fit. |
| unknown / missing | Ask first when material; report as a gap only after candidate confirmation. |
| contradicted | Ask for resolution before drafting; omit until resolved and report the resolved issue. |

Maintain private or recruiter-report traceability for every material claim: link it to concrete canonical evidence and preserve scope, ownership, depth, dates, recency, limitations, provenance, and confidence. Rank evidence by relevance, strength, recency, distinctiveness, and value; penalize duplicates, stale/low-signal facts, and tool-only material. Plan summary, reverse-chronological experience, grouped skills, and omissions explicitly. Never drop important evidence merely because it appears later in memory.

## Human Recruiter Readiness Gate
The three evaluators are real human recruiters; the first submission must be strong because a second opportunity is not guaranteed. Do not simulate external reviewers, claim reviewer availability, or imply anyone reviewed the draft. Instead, critically inspect it yourself before projection: can a recruiter understand value quickly, see fit and relevant evidence, notice honest gaps, and trust every claim? If not, rewrite from evidence, ask the highest-value question, or omit the claim. Record recruiter-readiness findings and resolved issues, never external approval.

## Writing and Budget Contract
Apply practical Oxford-style principles used by this project—clear hierarchy, concise positioning, reverse chronology, strong action verbs, accomplishment/capability/context/purpose bullets, scannable prose, consistent punctuation, no first person, no empty claims—without claiming an official external Oxford standard. Transform each fact as `evidence -> capability -> context/problem -> action/solution -> technology evidence -> verified outcome/purpose`. Contextualize ATS terms naturally; tools support the narrative.

- **Summary:** Exactly two candidate-focused sentences, 45–70 words: value first, then identity/domain/experience, problems solved, outcome or purpose, and delivery context. Use at most three technology groups; no individual versions, long sequences, or AI workflow names unless AI is primary. Reject tool-chain, Skills-copy, empty, or tool-dependent summaries and rewrite.
- **Experience:** One main idea per bullet; use scope-matched verbs and `action + context/problem + solution + evidence technology + outcome/purpose`. Reject fragments, vacancy-copy, tool-only bullets, and list-like prose. Use verified qualitative purpose when outcomes are unmeasured.
- **Skills:** Include only relevant supported inventory, grouped by capability/practice; it need not include all memory and must not replace experience or be copied into the summary.

## Decision Gates
Draft only confirmed/appropriately limited evidence after transformation. For material unknowns or contradictions, ask and pause. For failed writing or traceability gates, rewrite or omit. Obtain required edit approval before projection; never persist memory without separate explicit authorization.

If over two pages, prune in this order: least relevant grouped skills; duplicate/overlapping bullets; stale or low-signal evidence; generic wording; then compress remaining detail. Preserve contact, employers/titles/dates, education, language, strongest vacancy-relevant evidence, and at least defensible evidence per employer.

## Execution Steps
1. Load memory -> parse vacancy -> classify every requirement -> detect contradictions -> ask pending questions -> rank/select.
2. Define value proposition, role level, screening risks, section plan, ranked selections, omissions, and pruning rationale.
3. Draft and self-check summary, experience, skills, traceability, limitations, ATS context, factuality, and bilingual parity.
4. Apply the human recruiter-readiness gate and two-page budget; resolve findings without unsupported claims.
5. Obtain approval when required, project both languages, and change memory only when explicitly authorized.
6. Build, inspect extracted text and page count, and run repository validation.

## Final Pre-Projection Checklist
Block projection until memory-first order, complete matrix, resolved contradiction/question gates, value proposition, ranked selections, section plan, traceability, writing gates, honest fit/gaps, recruiter-readiness findings with no unresolved blockers, privacy/limitation checks, factual parity, two-page budget, and required approval pass.

## Output Contract
Return: status; classified requirement matrix; questions asked/answered; value proposition; ranked selections; omissions and pruning decisions; claim-to-evidence traceability status; fit/gaps; recruiter-readiness findings and resolved issues; approval state; files/memory status; projections; verification; variants; overflow.

## References
- `../../../data/cv-memory.json` — canonical candidate evidence.
- `assets/cv-memory.schema.json` — memory schema.
- `../../../AGENTS.md` — project conventions.
