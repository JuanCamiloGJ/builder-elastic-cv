---
name: cv-vacancy-tailor
description: "Trigger: vacancy, job description, tailor CV, recruiter, ATS. Build a truthful, evidence-based CV tailored to the vacancy."
license: Apache-2.0
metadata:
  author: "Juan Camilo García Jiménez"
  version: "2.0"
---

## Activation Contract
Activate for vacancy analysis, recruiter screening, ATS matching, or CV adaptation in this project.

## Hard Rules
Load `../../../data/cv-memory.json` once, first; keep it read-only unless the user explicitly authorizes persistence (confirmation is not authorization). Load and enforce `assets/cv-element-templates.md` before drafting. LaTeX is a generated projection: protect metadata and never expose internal labels or notes.

Act as a recruiter and positioning editor, not a keyword formatter. Keep fit analysis, gaps, limitations, risks, role level, value proposition, and traceability private. Public copy contains only supported, scope-matched claims. Never use negative gap language, apologies, “without…”, “no experience…”, weakness explanations, empty claims, or first person. Omission is not permission to imply competence or seniority.

Align the overall title to the vacancy only when evidence supports its scope and level; a target title never overrides canonical evidence or asserts unsupported specialization, seniority, or responsibility. Use hierarchy, reverse chronology, action verbs, accomplishment-based prose, natural ATS terms, and consistent punctuation. Trace every material claim to evidence, including scope, ownership, depth, dates, recency, provenance, limitations, and confidence.

Before fit classification or questions, semantically normalize every requirement to its underlying capability. Classify evidence as direct, foundational/parent, transferable sibling/tool, adjacent, or unsupported/missing. Infer only supported capability and preserve exact product/version limits: Spring may evidence Java, not a Java version; Bitbucket may evidence Git/source-control workflows, not GitHub. Do not ask for a parent capability evidenced by a child technology, and do not erase that competence when the exact product is absent.

For material ambiguity, use native `question` (one grouped interaction for related questions, preserving single/multi-select and custom text), then pause. Without it, ask complete plain text and pause; never assume or repeat a question resolved by semantic transfer. Education & Certifications use confirmed institution, location, formal title, provider, and dates only: omit or confirm missing fields, never invent, keep relevant certifications, and standardize title/provider/date. Use neutral foundational-skill labels.

## Decision Gates
| Gate | Decision |
| --- | --- |
| Requirement matrix | Normalize requirements first; match direct or scope-matched transferred evidence and preserve product/version limits. |
| Uncertainty | Ask one non-redundant targeted question for material missing, uncertain, or contradictory facts; pause; report gaps only after confirmation. |
| Evidence | Rank relevance, strength, recency, distinctiveness, and value; penalize duplicates, stale/low-signal facts, and tool-only material. |
| Public elements | Profile: exactly two candidate-focused sentences, 45–70 words, aiming for no more than four rendered lines. Experience: one accomplishment-based idea per bullet and 5–7 highest-impact bullets per role by default, fewer when evidence is limited; never force unrelated consolidation. Skills: concise, grouped, relevant, supported, and neutral. Reject tool chains, vacancy-copy, fragments, list-like bullets, negative gap language, and Skills-copy. |
| Bilingual parity | Keep factual scope, dates, seniority, technologies, ownership, and responsibility identical; translate faithfully without adding or weakening claims. |
| Length and readiness | Prune low-relevance content before compressing; preserve contact, employers/titles/dates, education, language, strongest evidence, and defensible evidence per employer. Do not simulate review or imply approval. Obtain edit approval before projection. |

## Execution Steps
1. Load memory and asset; normalize requirements; classify fit; ask only unresolved material questions through the required path and pause.
2. Define private value proposition, role level, risks, section plan, ranked evidence, omissions, pruning rationale, and traceability.
3. Draft the evidence-aligned title, exact two-sentence 45–70-word profile with line goal, reverse-chronological experience, 5–7 bullets per role by default, confirmed-field Education & Certifications, and grouped skills. Check factuality, ATS context, boundaries, and parity.
4. Enforce human readiness and two pages. After edit approval, project both languages; persist only with explicit authorization.
5. Build, inspect page count and `pdftotext`, and run repository validation.

## Output Contract
Return: status; requirement matrix; questions/answers; value proposition; ranked selections; omissions/pruning; claim traceability; private fit/gaps; readiness findings/resolutions; template and boundary compliance; approval; files and memory status; projections and bilingual parity; build, page count, `pdftotext`, repository validation; variants; overflow.

## References
- `../../../data/cv-memory.json` — canonical candidate evidence.
- `assets/cv-memory.schema.json` — memory schema.
- `assets/cv-element-templates.md` — mandatory public-CV templates.
- `../../../AGENTS.md` — project conventions.
