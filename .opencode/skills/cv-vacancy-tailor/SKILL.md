---
name: cv-vacancy-tailor
description: "Trigger: vacancy, job description, tailor CV, adapt CV, recruiter, ATS matching, fit a vacancy. Evaluate fit from verified CV evidence and plan truthful tailoring."
license: Apache-2.0
metadata:
  author: "Juan Camilo García Jiménez"
  version: "1.0"
---

## Activation Contract
Activate for vacancy analysis, recruiter screening, ATS matching, or CV adaptation requests.

## Hard Rules
Load `data/cv-memory.json` once first and treat it as the complete canonical, durable fact store, not content that must all appear in every CV. LaTeX files are generated projections, never the memory source; do not reconstruct future applications from LaTeX alone. Compute the current vacancy's relevance set before drafting and exclude stale or low-relevance material from this projection without deleting it from canonical memory. Never infer adjacent-technology experience, fabricate facts, metrics, dates, titles, certifications, language levels, or keywords. Mark every vacancy item `confirmed`, `partially supported`, `unknown`, or `contradicted`. Add only newly confirmed durable facts once, with stable provenance and confidence; never append vacancy keywords or duplicate responsibilities merely because they match, and keep vacancy-specific wording/selection ephemeral unless persistence is explicitly requested. Keep unknowns and meaningful omissions visible.
When information is missing, use the native interactive question tool with useful single-select or multi-select choices as applicable, always with custom text. Ask one question at a time and preserve exact free-text answers for confirmation before saving.
Write strategically, not as a keyword list. Make the summary a candidate-focused value proposition with identity, experience, domain/context, value, and strengths; use 45–70 words, at most 2 sentences, no keyword chains, and no weak/basic skills. Build each responsibility's evidence card with action, context/problem, solution, technologies, outcome/purpose, scope, ownership, recency, provenance, and confidence; cross-link it to relevant memory records. Write bullets as action + context/problem + solution + technology + outcome/purpose. Contextualize ATS terms, vary repetition, distinguish `implemented`, `led`, `maintained`, `participated`, and `exposed`, never infer ownership/outcomes, and reject nominal fragments or standalone technology lists.
If a verified metric is unavailable, use only a verified qualitative purpose and keep the unknown visible. Apply the narrative-quality gate to every summary and professional bullet for candidate focus, readability, naturalness, no keyword dumping, and bilingual factual parity. Keep claims deterministic (0.2–0.35), prose at 0.45–0.60, and alternatives at no more than 0.65; wording may change, evidence may not.

## Value Communication Gate
Before projection, require every summary, skill grouping, and experience bullet to translate verified evidence into: **professional capability + context/problem + action/solution + technology as supporting evidence + verified outcome or qualitative purpose**. The capability is the message; tools are evidence. Reject keyword dumps, literal vacancy/user wording, and tool inventories. Present user-facing capabilities (for example, automation, delivery, analysis, or collaboration) rather than internal implementation details. Generalize OpenCode, Engram, Gentle AI, SDD, and project-specific skills into professional language unless the named tool is itself a verified ATS-relevant requirement or necessary evidence; retain it only when its presence is truthful and useful, never as the value claim. If any element is unsupported, keep it unknown, ask the highest-value question, or omit the item. Example: `Python, OpenCode, SDD, automation` → `Automated [verified workflow] to address [verified problem], using Python and documented delivery practices to support [verified outcome/purpose].`
Apply the same gate during narrative-quality review and again when assembling the ranked two-page projection; a technically accurate item still fails if its candidate value is not clear.

## Decision Gates
- Missing narrative field: identify the weakest/highest-value responsibility and ask one targeted interactive question at a time; do not use a generic questionnaire when a targeted question is possible. Cover technology, context, recency, depth, ownership, or outcome only as needed.
- No useful gap: do not ask questions already answered in memory.
- Editing requested: report fit and obtain approval unless the user explicitly requests generation.

| Evidence card state | Required action |
| --- | --- |
| Complete | Draft only through the action + context/problem + solution + technology + outcome/purpose gate. |
| Partial | Ask the single highest-value targeted question; keep unknowns visible and do not project until the bullet gate passes. |
| Insufficient | Do not draft the bullet; report the gap or retain a truthful minimal responsibility without invented narrative. |

| Need | Interactive question behavior |
| --- | --- |
| One valid answer | Single-select choices plus custom text. |
| Several valid answers | Multi-select choices plus custom text. |
| No reliable choices | Open custom-text question. |
| Custom answer supplied | Confirm its meaning and evidence before saving; never infer unsupported facts. |

| Selection decision | Runtime action |
| --- | --- |
| Include | Project verified, high-signal material in the current relevance set. |
| Condense | Combine overlapping verified facts while preserving the strongest evidence and purpose. |
| Omit from projection | Exclude stale/low-relevance material this vacancy does not need; never delete its canonical fact. |
| Ask | Ask only when the missing fact is the single highest-value unresolved gap. |

Before projection, build a ranked content budget for the summary, skills, and each employer's bullets. Rank by direct vacancy relevance, evidence strength, recency, distinctiveness, and outcome/value; penalize duplicates, generic duties, standalone tools, and low-signal details. If content exceeds two pages, prune in this order: duplicate/standalone skills, low-relevance skills, generic or overlapping bullets, older low-relevance bullets, then summary detail. Never remove contact, employer/title/dates, education, language, or high-evidence/high-relevance facts; preserve at least the strongest evidence per employer. Never silently delete canonical facts: report meaningful omissions.

## Execution Steps
1. Load canonical memory once; parse the new vacancy once into requirements and evidence tests, reusing existing evidence IDs, stable cross-links, and the cached fact inventory.
2. Compare only the vacancy delta against that inventory, classify every requirement, and compute the ranked relevance set and content budget. Do not re-ask answered questions or reprocess unrelated technologies/employers.
3. For each selected professional responsibility, cross-link its evidence card, detect missing narrative fields, and ask at most the single highest-value missing question per interaction round. When metrics are unavailable, use already verified qualitative purposes.
4. Return fit summary, matches, gaps, questions, and a truthful adaptation plan; obtain approval for editing unless generation was explicitly requested.
5. After answers, merge only confirmed durable facts and provenance into `data/cv-memory.json`; retain vacancy-specific selection and wording only in the current projection.
6. Apply the value-communication, bullet, and narrative-quality gates, then project only the ranked relevant selection into both language directories; if any gate fails, do not project. Preserve factual parity and the ATS-safe one-column layout (no photo, icons, tables, or graphics).
7. If over two pages, perform one bounded pruning pass using the stated order, re-render, and verify extracted text and page count. Do not shrink layout as a substitute for selection. If still over two pages, report the overflow and exact items considered.
8. Avoid intermediate builds: edit both projections, then run one final `make docker-all` (or the documented host fallback) build/validation pass. Use `make build VARIANT=...` only for targeted troubleshooting. Report timing by load/match/question/projection/build phase and identify external/build bottlenecks.
9. Report the updated memory, changed LaTeX paths, meaningful omissions, verification result, generated variant(s), and any overflow.

## Output Contract
Return the classified requirement matrix, concise questionnaire (if needed), and adaptation plan before LaTeX edits; afterwards report the updated canonical memory, changed projections, meaningful omissions, timing by phase, verification result, generated variants, and any overflow.

## References
- `../../../data/cv-memory.json` — base evidence memory.
- `assets/cv-memory.schema.json` — memory validation schema.
- `../../../AGENTS.md` — CV source and publishing conventions.
