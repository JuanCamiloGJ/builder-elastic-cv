---
name: cv-vacancy-tailor
description: "Trigger: vacancy, job description, tailor CV, recruiter, ATS. Build a truthful, evidence-based CV tailored to the vacancy."
license: Apache-2.0
metadata:
  author: "Juan Camilo García Jiménez"
  version: "1.9"
---

## Activation Contract
Activate for vacancy analysis, recruiter screening, ATS matching, or CV adaptation in this project.

## Hard Rules
Load `data/cv-memory.json` once, first, and keep it read-only unless the user explicitly authorizes persistence; confirmation alone is not authorization. Load and enforce `assets/cv-element-templates.md` before drafting. Treat LaTeX as a generated projection: protect source metadata and never expose internal labels or notes.

Act as a senior recruiter and positioning editor, not a keyword formatter. Keep fit analysis private from the public CV. Analyze gaps, uncertainty, limitations, screening risks, role level, must-haves, preferred signals, business context, and value proposition privately. Visible copy may contain only supported, scope-matched claims. Never put negative gap/disclaimer language, apologies, “without…”, “no experience…”, or detailed weakness explanations in the profile or skills. Omission must never become a false positive or unsupported senior title.

Use clear hierarchy, reverse chronology, strong action verbs, accomplishment-based prose, natural ATS terms, consistent punctuation, no first person, and no empty claims. Maintain traceability for every material claim to canonical evidence, including scope, ownership, depth, dates, recency, provenance, limitations, and confidence.

Before asking questions or classifying fit, semantically normalize each vacancy requirement to its underlying capability. Classify evidence as direct, foundational/parent, transferable sibling/tool, adjacent, or unsupported/missing. Infer only the supported capability and keep exact product/version experience separately labeled: Spring evidences Java use but not an exact Java version; Bitbucket evidences Git/source-control workflows but not GitHub-specific product experience. Do not ask for a parent capability already evidenced by a child technology, and do not erase that underlying competence when the exact product is absent.

When material ambiguity remains and the runtime exposes the native `question` tool, ask through it—not prose—using one grouped interaction for related questions, preserving single-select or multi-select semantics and allowing custom text where needed; then pause. If unavailable, ask a complete plain-text fallback and pause without assuming an answer. Never ask questions already resolved by semantic transfer.

## Decision Gates
| Gate | Decision |
| --- | --- |
| Semantic requirement analysis | Normalize every requirement to its underlying capability before fit classification or questions; record direct, foundational/parent, transferable sibling/tool, adjacent, and unsupported/missing evidence, with product/version limits explicit. |
| Requirement matrix | Compare normalized requirements with memory. Select direct or scope-matched transferred evidence; preserve underlying competence when an exact product is missing, but never upgrade it to product/version evidence. |
| Uncertainty or contradiction | For material missing, uncertain, or contradictory dates, titles, technology, depth, scope, or ownership, ask one non-redundant targeted question through native `question` when available, otherwise complete plain text, and pause. Report a gap only after candidate confirmation; never infer or invent. |
| Evidence selection | Rank relevance, strength, recency, distinctiveness, and value; penalize duplicates, stale/low-signal facts, and tool-only material. Do not discard important evidence because it appears later in memory. |
| Public elements | Enforce the asset: summary is exactly two candidate-focused sentences and 45–70 words; experience uses one accomplishment-based idea per bullet (`action + context/problem + solution + technology evidence + outcome/purpose`), retaining verified qualitative purpose when outcomes are unmeasured; skills are concise grouped `Category: items`, relevant and supported. Keep the summary to at most three technology groups; omit versions, long sequences, and AI workflow names unless AI is primary. Omit weak skills or use one short truthful neutral label only when strategic. Reject tool chains, vacancy-copy, fragments, list-like bullets, and Skills-copy. |
| Human readiness | Before projection, inspect whether a real recruiter can quickly understand value, fit, relevant evidence, and trustworthy claims. Rewrite, ask, or omit when not ready. Do not simulate reviewers, claim external review, or imply approval. |
| Length and approval | If over two pages, prune least relevant skills, duplicate bullets, stale/low-signal evidence, generic wording, then compress detail. Preserve contact, employers/titles/dates, education, language, strongest relevant evidence, and defensible evidence per employer. Obtain edit approval before projection; persistence also needs separate authorization. |


## Execution Steps
1. Load memory first, load the asset, parse and semantically normalize every vacancy requirement, classify evidence and fit, then ask only unresolved material questions through the required interaction path and pause.
2. Define value proposition, role level, risks, section plan, ranked evidence, omissions, and pruning rationale; retain private fit analysis and traceability.
3. Draft profile, reverse-chronological experience, and grouped skills under every asset boundary; self-check factuality, ATS context, traceability, public/private separation, and truthful bilingual parity.
4. Apply human-readiness and two-page gates. After required approval, project both languages; change memory only with explicit authorization.
5. Build, check page count and `pdftotext` output, and run repository validation.

## Output Contract
Return: status; complete requirement matrix; questions asked/answered; value proposition; ranked selections; omissions and pruning decisions; claim-to-evidence traceability; private fit/gaps; recruiter-readiness findings and resolutions; template compliance for profile, experience, and skills; public/private boundary compliance; approval state; files and memory status; projections and bilingual parity; build, page-count, `pdftotext`, and repository validation; variants; overflow.

## References
- `../../../data/cv-memory.json` — canonical candidate evidence.
- `assets/cv-memory.schema.json` — memory schema.
- `assets/cv-element-templates.md` — mandatory public-CV element templates.
- `../../../AGENTS.md` — project conventions.
