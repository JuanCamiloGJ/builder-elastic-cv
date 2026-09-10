---
name: cv-new-base-profile
description: "Trigger: create new base information, new user profile, replace base CV memory, crear información base, nuevo usuario. Replace CV memory from user evidence."
license: Apache-2.0
metadata:
  author: "Juan Camilo García Jiménez"
  version: "1.0"
---

## Activation Contract
Activate exclusively when the user explicitly requests creating base information for a new user/profile or replacing the base CV memory. Do not activate for vacancy tailoring, recruiter matching, or partial profile updates.

## Hard Rules
- Accept a user-provided file or pasted text; never invent, infer, or silently retain facts from the previous profile.
- Classify every extracted fact as `confirmed`, `partially supported`, `unknown`, or `contradictory`, preserving source and evidence.
- Use native interactive questions, one at a time: single-select, multi-select where applicable, and custom text for uncovered answers. Ask only for missing or conflicting data.
- Build a complete schema-compatible replacement, validate it against `../cv-vacancy-tailor/assets/cv-memory.schema.json`, and write atomically only after explicit final-summary approval. Do not create a backup unless an existing repository convention permits it; document whether one was made.
- Project both localized variants only after approval; keep factual parity and follow `AGENTS.md`.

## Decision Gates
| Condition | Action |
| --- | --- |
| Intent is not explicit new-profile replacement | Do not activate; use the appropriate workflow. |
| Source is absent or incomplete | Ask one native question at a time; keep gaps visible. |
| Facts conflict | Show the conflict and request confirmation; do not choose silently. |
| Summary not approved or validation fails | Do not overwrite or project. |

## Execution Steps
1. Confirm replacement intent and collect a file or pasted source.
2. Load the schema and current conventions; extract facts without importing old data.
3. Ask prioritized native questions and assemble the replacement with provenance.
4. Report sources, missing fields, statuses, and conflicts; obtain explicit approval of the complete summary.
5. Validate, atomically replace `data/cv-memory.json`, then project `src/config/{spanish,english}/` and `src/content/{spanish,english}/`.
6. Verify JSON/schema, factual parity, and projected output; report all results.

## Output Contract
Return activation decision, sources, missing fields, confirmation status, modified files, backup decision, and verification results. Before approval, return only the summary and required questions; after approval, report replacement and both projections.

## References
- `../../../data/cv-memory.json` — canonical base memory.
- `../cv-vacancy-tailor/assets/cv-memory.schema.json` — compatibility schema.
- `../../../AGENTS.md` — repository and projection conventions.
