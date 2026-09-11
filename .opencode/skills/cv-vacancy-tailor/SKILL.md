---
name: cv-vacancy-tailor
description: "Trigger: vacancy, job description, tailor CV, adapt CV, recruiter, ATS matching, fit a vacancy. Transform verified candidate evidence into a truthful, targeted CV."
license: Apache-2.0
metadata:
  author: "Juan Camilo García Jiménez"
  version: "1.4"
---

## Activation Contract
Activate for vacancy analysis, recruiter screening, ATS matching, or CV adaptation.

## Hard Rules
- Load `data/cv-memory.json` once first. It is the complete canonical fact store; LaTeX is only a generated projection.
- Classify every vacancy requirement as `confirmed`, `partially supported`, `unknown`, or `contradicted`. Never infer adjacent experience, metrics, dates, titles, certifications, language levels, ownership, production scope, or keywords.
- Treat confirmed conversational explanations tied to real project work as evidence and transform them into CV language.
- Keep canonical memory complete, but project only the current vacancy's ranked relevance set. Never append vacancy keywords or stale material; keep meaningful omissions visible.
- Add durable facts only after explicit confirmation, with provenance and confidence. Vacancy-specific wording and selection remain ephemeral unless persistence is requested.
- Separate evidence controls from projection language: canonical memory retains provenance, confidence, depth, and limitations. Visible CV text must not copy internal labels such as `conceptual knowledge`, `non-expert`, `basic/formative`, `unknown`, or source notes when they unnecessarily weaken a truthful statement.
- Use capability-first wording and calibrated context. Confirmed technologies may appear in relevant grouped skills without self-defeating parentheticals. Enforce limitations by avoiding claims of ownership, expert depth, production use, or professional experience in profile/bullets. Use `familiarity with` when a material qualifier is needed, never internal metadata.

## Mandatory Evidence-to-Value Transformation
Transform every selected fact before writing:

`raw account -> professional capability -> project context/problem -> candidate action/solution -> supporting technology -> verified outcome or qualitative purpose`

Make capability the grammatical subject and first meaningful idea; technologies are evidence, not the value.

For AI-assisted engineering, state the delivery capability before supporting LLM, MCP, subagent, context, orchestration, or workflow practices; do not upgrade project work to unsupported production systems, impact, scale, or integrations.

## Professional Summary Construction Contract
- Treat the summary as a candidate-positioning statement, never as a Technical Skills inventory.
- Write exactly 2 candidate-focused sentences and 45–70 words total. Sentence 1 must state professional identity, strongest capability, relevant domain, and experience. Sentence 2 must state problems solved, outcomes or purpose, and collaboration or delivery context.
- Use at most 3 technology groups as supporting evidence; never list individual Java versions, long tool sequences, or detailed technology inventories. Put detailed technologies in Technical Skills or Experience.
- Do not name AI tools or workflow names in the summary unless AI engineering is the primary role.
- Reusable template: `[Identity] specialized in [strongest capability] for [domain], with [experience]. [He/She/They] [solves problem] to [outcome/purpose] while [collaboration/delivery context], supported by [up to 3 technology groups].`
- Negative validation: reject and rewrite any summary that begins with tools, contains 3+ tools in sequence, repeats Technical Skills, or loses candidate value when tools are removed. Reject patterns including `using Java, Spring Boot, RabbitMQ, Docker, Kubernetes...`, `experienced in [long technology list]`, and `works with [long technology list]`. Whenever validation fails, rewrite from evidence; never deliver the failed summary.

## Projection Quality Gate
Apply this gate to the summary, every skill grouping, and every professional bullet:

`capability + context/problem + action/solution + technology as evidence + outcome/purpose`

- Summary: 45–70 words, maximum two candidate-focused sentences; no keyword chain or weak/basic skill.
- Professional summary: lead with capability/value, not tools or internal workflow names. Put detailed tools only in relevant bullets or capability-grouped skills.
- Experience bullet: action + context/problem + solution + technology + outcome/purpose, with verbs matching scope.
- Skills: group technologies to communicate a capability or practice, never as a standalone targeted inventory.
- Reject literal vacancy wording, fragments, generic claims, and sentences failing the remove-the-tools test: removing tools must leave meaningful capability, context, action, or purpose.
- If a gate fails, rewrite from canonical evidence, ask for genuinely missing evidence, or omit the item. Never project failed wording.
- Evidence calibration: project only technologies and practices supported by the canonical memory and relevant to the current vacancy. Preserve each item's recorded scope, depth, limitations, and recency internally, but do not force any technology into the CV. Never upgrade familiarity, conceptual knowledge, formative exposure, or non-expert practice into professional ownership or expertise.
- Vacancy relevance: a confirmed technology is not automatically selected. Include it only when it strengthens a requirement, capability, or evidence-backed responsibility for the current vacancy.
- Missing evidence: never fill gaps with adjacent technologies, semantic similarity, or vacancy wording. If a requirement is unknown or contradicted, omit it or report it as a gap.

## Decision Gates
| Evidence state | Action |
| --- | --- |
| Complete | Draft only after the transformation and quality gates pass. |
| Partial | Ask one highest-value targeted question; do not invent the missing field. |
| Insufficient | Omit the bullet or retain only a truthful minimal responsibility. |
| Confirmed practice but list-like wording | Rewrite capability-first; never project the list. |
| Capability, context, and action confirmed but outcome unmeasured | Use the verified qualitative purpose. |

Before final projection, identify high-value unknowns and ask one targeted question at a time when the answer could materially change fit. Do not re-ask answered questions; if the user explicitly lacks/does not use something, record and omit it. Use the native question tool, confirm free-text before saving, and obtain editing approval unless generation was explicitly requested.

## Selection and Two-Page Budget
Rank by vacancy relevance, evidence strength, recency, distinctiveness, and value; penalize duplicate, stale, low-signal, standalone-tool content. If over two pages, prune skills, overlapping/older bullets, then summary detail. Never remove contact, employer/title/dates, education, language, strongest evidence per employer, or canonical facts.

## Execution Steps
1. Load canonical memory once and parse the vacancy once into requirements and evidence tests.
2. Classify requirements, match evidence, compute relevance, and build the budget.
3. Build evidence cards with action, context/problem, solution, technologies, outcome/purpose, scope, ownership, recency, provenance, confidence, and memory links.
4. Ask only the highest-value missing question when a selected claim cannot pass the gates; otherwise transform confirmed evidence directly.
5. Merge only newly confirmed durable facts into `data/cv-memory.json`.
6. Apply transformation, remove-the-tools, quality, and bilingual-parity gates; project only passing content into both language directories.
7. Prune once if needed. Run `make docker-all` or a documented host fallback, inspect both PDFs, verify page count, and run repository validation.
8. Report fit, gaps, questions, omissions, changed paths, PDFs, timing, verification, and overflow.

## Output Contract
Return the classified requirement matrix, fit summary, gaps, questions, and adaptation plan before edits when approval is required. After edits, return status, updated memory, changed projections, meaningful omissions, timing by phase, verification result, generated variants, and overflow.

## References
- `../../../data/cv-memory.json` — canonical candidate evidence.
- `assets/cv-memory.schema.json` — memory schema.
- `../../../AGENTS.md` — project conventions.
