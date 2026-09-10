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
Load `data/cv-memory.json` first and treat it as the canonical, durable source of candidate facts. LaTeX files are generated projections, never the memory source; do not reconstruct future applications from LaTeX alone. Never infer adjacent-technology experience, fabricate facts, metrics, dates, titles, certifications, language levels, or keywords. Mark every vacancy item `confirmed`, `partially supported`, `unknown`, or `contradicted`. Add facts only after explicit confirmation, with provenance and confidence. Keep unknowns visible.
When information is missing or clarification is needed, use the native interactive question tool. Present answer choices when useful, enable multiple selection when more than one answer may apply, and always allow custom text so the user can provide an answer not covered by the choices. Ask only one question at a time and preserve the user's exact free-text answer for confirmation before adding it to canonical memory.
Write strategically, not as a keyword list. Make the summary a candidate-focused value proposition containing identity, years of experience, domain/context, value delivered, and relevant strengths; keep it to 45–70 words and no more than 2 sentences. Avoid semicolon-separated keyword chains and exclude weak or basic skills from the summary. For each responsibility, build an evidence card with: action, context/problem, solution, technologies, outcome/purpose, scope, ownership, recency, evidence/provenance, and confidence. Cross-link it to the relevant project, role, technologies, and known outcomes already in `data/cv-memory.json` before drafting. Write every experience bullet as action + context/problem + solution + technology + outcome/purpose. Contextualize ATS keywords in truthful statements, vary repeated terms naturally, and distinguish `implemented`, `led`, `maintained`, `participated`, and `exposed`; never infer ownership or outcomes. Reject or rewrite nominal fragments and standalone technology lists.
If a verified metric is unavailable, use only a verified qualitative purpose and keep the unknown visible. The narrative-quality gate checks every summary and every professional-experience bullet for candidate focus, readability, naturalness, no keyword dumping, and factual parity; it must not inspect the summary alone. Keep factual claims deterministic (temperature concept 0.2–0.35), prose at 0.45–0.60, and alternatives at no more than 0.65; creativity may improve wording only, never facts, depth, metrics, scope, or evidence classification.

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

## Execution Steps
1. Load canonical memory, then parse the vacancy into requirements and evidence tests.
2. Match each requirement against memory and classify it `confirmed`, `partially supported`, `unknown`, or `contradicted`.
3. For each professional responsibility, cross-link the evidence card to memory records and detect missing narrative fields; ask the one prioritized targeted question when needed.
4. Return fit summary, matches, gaps, questions, and a truthful adaptation plan; for editing, obtain approval unless generation was explicitly requested.
5. After answers, merge confirmed facts and provenance into `data/cv-memory.json` before rendering.
6. Before projection, apply the bullet gate to every experience bullet and the narrative-quality gate to summaries and bullets. Revise wording without altering evidence, depth, metrics, or scope; if either gate fails, do not project.
7. Project the complete canonical memory plus vacancy-specific approved tailoring into `src/config/{spanish,english}/` and `src/content/{spanish,english}/` as requested; preserve factual parity and the ATS-safe one-column layout (no photo, icons, tables, or graphics).
8. After approved JSON/LaTeX projection, verify with `make docker-all` when Docker is available. This mounts the current project at `/workspace` and writes PDFs to the host `build/` directory. Docker compiles and validates only; never use it to modify or recreate memory/source files. If Docker is unavailable, run `make all` only when the host has `make`, `latexmk`, `pdflatex`, and `pdftotext`; otherwise report the setup block clearly.
9. Report the updated memory, changed LaTeX paths, and generated PDF paths.

## Output Contract
Return the classified requirement matrix, concise questionnaire (if needed), and adaptation plan before LaTeX edits; afterwards report the updated canonical memory, changed LaTeX projections, verification result, and generated variant(s).

## References
- `../../../data/cv-memory.json` — base evidence memory.
- `assets/cv-memory.schema.json` — memory validation schema.
- `../../../AGENTS.md` — CV source and publishing conventions.
