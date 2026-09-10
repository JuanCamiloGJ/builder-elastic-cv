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

## Decision Gates
- High-value unknown/partial: ask one short, prioritized questionnaire covering technology, context, recency, depth, and outcome.
- No useful gap: do not ask questions already answered in memory.
- Editing requested: report fit and obtain approval unless the user explicitly requests generation.

## Execution Steps
1. Parse the vacancy into requirements and evidence tests.
2. Match each requirement against memory and classify it.
3. Return fit summary, matches, gaps, questions, and a truthful adaptation plan.
4. After answers, merge confirmed facts and provenance into `data/cv-memory.json` before rendering.
5. Project the complete canonical memory plus vacancy-specific approved tailoring into `src/config/{spanish,english}/` and `src/content/{spanish,english}/` as requested; preserve factual parity and the ATS-safe one-column layout (no photo, icons, tables, or graphics).
6. After approved JSON/LaTeX projection, verify with `make docker-all` when Docker is available. This mounts the current project at `/workspace` and writes PDFs to the host `build/` directory. Docker compiles and validates only; never use it to modify or recreate memory/source files. If Docker is unavailable, run `make all` only when the host has `make`, `latexmk`, `pdflatex`, and `pdftotext`; otherwise report the setup block clearly.
7. Report the updated memory, changed LaTeX paths, and generated PDF paths.

## Output Contract
Return the classified requirement matrix, concise questionnaire (if needed), and adaptation plan before LaTeX edits; afterwards report the updated canonical memory, changed LaTeX projections, verification result, and generated variant(s).

## References
- `../../../data/cv-memory.json` — base evidence memory.
- `assets/cv-memory.schema.json` — memory validation schema.
- `../../../AGENTS.md` — CV source and publishing conventions.
