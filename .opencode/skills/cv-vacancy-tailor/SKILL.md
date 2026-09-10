---
name: cv-vacancy-tailor
description: "Trigger: vacancy, job description, tailor CV, adapt CV, recruiter, ATS matching, fit a vacancy. Transform verified candidate evidence into a truthful, targeted CV."
license: Apache-2.0
metadata:
  author: "Juan Camilo García Jiménez"
  version: "1.1"
---

## Activation Contract
Activate for vacancy analysis, recruiter screening, ATS matching, or CV adaptation.

## Hard Rules
- Load `data/cv-memory.json` once first. It is the complete canonical fact store; LaTeX is only a generated projection.
- Classify every vacancy requirement as `confirmed`, `partially supported`, `unknown`, or `contradicted`. Never infer adjacent experience, metrics, dates, titles, certifications, language levels, ownership, production scope, or keywords.
- Treat a confirmed conversational explanation tied to real project work as professional evidence. The user need not phrase it like a CV; transform it yourself.
- Keep canonical memory complete, but project only the current vacancy's ranked relevance set. Never append vacancy keywords or retain stale material merely because it appeared in an earlier CV. Keep meaningful omissions visible.
- Add durable facts only after explicit confirmation, with provenance and confidence. Vacancy-specific wording and selection remain ephemeral unless persistence is requested.

## Mandatory Evidence-to-Value Transformation
Transform every selected fact before writing:

`raw account -> professional capability -> project context/problem -> candidate action/solution -> supporting technology -> verified outcome or qualitative purpose`

The capability is the message and must be the grammatical subject and first meaningful idea. Technologies are supporting evidence. Preserve the full confirmed capability while improving its wording; do not reduce it to a tool inventory or require the user to rewrite it.

For AI-assisted engineering, state what the candidate enabled or improved in software delivery first, then explain how LLMs, MCPs, subagents, persistent context, orchestration, or structured workflows supported it. “Across project work” is valid when confirmed, but do not upgrade it to a production system, business impact, scale, or integration absent from memory. A missing metric may use only a confirmed qualitative purpose such as structured or maintainable delivery.

## Projection Quality Gate
Apply this gate to the summary, every skill grouping, and every professional bullet:

`capability + context/problem + action/solution + technology as evidence + outcome/purpose`

- Summary: 45–70 words, maximum two sentences, candidate-focused, no keyword chain or weak/basic skill.
- Professional profile/summary: lead with candidate capability and value; do not enumerate implementation tools or internal workflow names. Name detailed tools only in a relevant experience bullet or a capability-grouped skills line when they support a meaningful claim.
- Experience bullet: action + context/problem + solution + technology + outcome/purpose. Vary `implemented`, `led`, `maintained`, `participated`, and `exposed` according to evidence.
- Skills: group technologies only when the grouping communicates a capability or practice; never create a standalone inventory for a targeted value claim.
- Reject literal vacancy wording, nominal fragments, generic value claims, and any sentence that fails the remove-the-tools test: removing tool names must leave a meaningful capability, context, action, or purpose.
- A named ATS-relevant tool may remain only inside a capability statement, never as the statement's value.
- If a gate fails, rewrite from canonical evidence, ask only for genuinely missing evidence, or omit the item. Never project failed wording.

## Decision Gates
| Evidence state | Action |
| --- | --- |
| Complete | Draft only after the transformation and quality gates pass. |
| Partial | Ask one highest-value targeted question; do not invent the missing field. |
| Insufficient | Omit the bullet or retain only a truthful minimal responsibility. |
| Confirmed practice but list-like wording | Rewrite capability-first; never project the list. |
| Capability, context, and action confirmed but outcome unmeasured | Use the verified qualitative purpose. |

When clarification is needed, use the native question tool with custom text, ask one question at a time, and preserve free-text answers for confirmation before saving. Do not ask questions already answered in memory. For editing, obtain approval unless generation was explicitly requested.

## Selection and Two-Page Budget
Rank content by direct vacancy relevance, evidence strength, recency, distinctiveness, and value. Penalize duplicate, generic, stale, low-signal, and standalone-tool content. If over two pages, prune once in this order: standalone/duplicate skills, low-relevance skills, generic or overlapping bullets, older low-relevance bullets, then summary detail. Never remove contact, employer/title/dates, education, language, or the strongest evidence per employer. Do not delete canonical facts.

## Execution Steps
1. Load canonical memory once and parse the vacancy once into requirements and evidence tests.
2. Match requirements, classify evidence, compute the relevance set, and build the content budget.
3. Build evidence cards for selected responsibilities with action, context/problem, solution, technologies, outcome/purpose, scope, ownership, recency, provenance, confidence, and memory links.
4. Ask only the highest-value missing question when a selected claim cannot pass the gates; otherwise transform confirmed evidence directly.
5. Merge only newly confirmed durable facts into `data/cv-memory.json`.
6. Apply the mandatory transformation, remove-the-tools test, quality gate, and bilingual-parity check; project only passing content into both language directories.
7. If needed, perform one bounded relevance-pruning pass. Then run one final `make docker-all` (or documented host fallback), inspect both PDFs with `pdftotext`, verify page count, and run repository text validation. Use targeted builds only for troubleshooting.
8. Report fit, gaps, questions, meaningful omissions, changed paths, generated PDFs, timing, verification, and overflow.

## Output Contract
Return the classified requirement matrix, fit summary, gaps, questions, and adaptation plan before edits when approval is required. After edits, return status, updated memory, changed projections, meaningful omissions, timing by phase, verification result, generated variants, and overflow.

## References
- `../../../data/cv-memory.json` — canonical candidate evidence.
- `assets/cv-memory.schema.json` — memory schema.
- `../../../AGENTS.md` — project conventions.
