# Agent Guide

This repository is a reusable, ATS-oriented, one-column LaTeX CV targeting two readable pages.

## Source structure

- `variants/spanish.tex` and `variants/english.tex` are thin language entrypoints.
- Shared assembly is in `src/main.tex`.
- `src/main.tex` inputs shared commands/theme/layout plus language-specific metadata and content from `src/config/{spanish,english}/` and `src/content/{spanish,english}/`.
- Put factual contact metadata in the matching language directory under `src/config/` and factual CV content in the matching directory under `src/content/`.
- Treat `data/cv-memory.json` as the canonical durable fact store; localized LaTeX files are generated projections and must not become the only source of candidate information.
- Keep formatting and macros in `src/layouts/` and `src/config/`. Do not copy content into `variants/`.

## Before publishing

- Keep both localized versions factually identical; the Languages section contains only the supplied English A2 proficiency.
- After content or layout changes, inspect extracted text with `pdftotext`.

## Commands

```text
make all
make build
make validate
make build VARIANT=spanish|english
make clean
tests/validate-text.sh build/_CV_Juan_Camilo_Garcia_Jimenez_english.pdf tests/required-sections-english.txt
make docker-all
```

`make all` builds and then validates. `make validate` expects PDFs in `build/` and must follow a build. Building requires `latexmk` and `pdflatex`; validation requires `pdftotext`. `latexmkrc` forces `pdflatex`, enables halt-on-error, and allows at most three repeats.

## Build locations

- Local `Makefile` output is written to `build/_CV_Juan_Camilo_Garcia_Jimenez_<language>.pdf`.
- CI builds both language variants with `xu-cheng/latex-action@v3`, explicitly disables XeLaTeX, and validates PDFs emitted under `variants/*.pdf`.
- Do not confuse the local `build/` PDFs with the CI `variants/*.pdf` PDFs.

`.gitignore` ignores build output and LaTeX auxiliary files while preserving `build/.gitkeep`.

## Portable Docker build

- OpenCode and the `cv-vacancy-tailor` skill stay on the host and edit `data/cv-memory.json` plus localized LaTeX projections. Docker is only the compiler and validator; it never owns or recreates source files.
- Linux/macOS: from a fresh clone, run `make docker-all`.
- Windows Docker Desktop PowerShell: from a fresh clone, run `docker compose build cv` then `docker compose run --rm cv`. Enable Docker Desktop file sharing for the repository drive. Git Bash/WSL can use `make docker-all` if `make` is installed.
- `make docker-all` reuses `builder-elastic-cv:bookworm` when present and builds it only when absent; run `make docker-build` to explicitly rebuild after Dockerfile or toolchain dependency changes.
- The repository is mounted at `/workspace`, so generated PDFs remain in the host `build/` directory. `compose.yaml` is portable across Docker Desktop and Linux/macOS.
- After changing the project skill, quit and restart OpenCode so it reloads the instructions.

## Mandatory skill onboarding

- Before project work, discover and install/register the relevant repository skills using the active harness's native mechanism; do not assume every harness handles `.opencode/skills/` identically.
- Load the relevant skill before editing or generating CV content.
- Determine the user's profile intent first: use `cv-new-base-profile` for a new user or explicit complete profile replacement; use `cv-vacancy-tailor` for an existing user's vacancy adaptation. Never reuse facts from a previous profile in the new-user workflow.
- If profile intent is unclear, ask before selecting a skill or changing profile data.
- If a skill is unavailable or incompatible with the harness, report the limitation and do not silently proceed.

## Project skills

- `.opencode/skills/cv-vacancy-tailor/SKILL.md` — evidence-based vacancy matching and truthful CV tailoring; its base memory is `data/cv-memory.json`.
- `.opencode/skills/cv-new-base-profile/SKILL.md` — exclusively replaces the complete canonical CV memory for an explicitly requested new user profile, then projects both localized variants after approval.
