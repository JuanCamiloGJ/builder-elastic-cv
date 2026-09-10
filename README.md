# ATS-oriented LaTeX CV

This repository builds the same factual CV in Spanish and English as readable,
one-column PDFs targeting two pages. The JSON memory is canonical; LaTeX files
are localized projections; `build/` contains generated PDFs.

## Purpose and architecture

- `data/cv-memory.json` is the durable, reusable store of confirmed candidate facts.
- `src/config/{spanish,english}/` and `src/content/{spanish,english}/` contain the localized LaTeX projections.
- `src/layouts/` and `src/main.tex` provide shared macros, theme, and assembly.
- `variants/spanish.tex` and `variants/english.tex` are the two thin base entrypoints.
- `compose.yaml` defines the mounted Docker build service and its image tag.
- Local and Docker builds generate `build/spanish.pdf` and `build/english.pdf`.

LaTeX was chosen for deterministic, version-controlled layout, precise
typography, reusable shared macros, and selectable/extractable text that can be
checked with `pdftotext`. LaTeX does **not** guarantee ATS acceptance; the
project also deliberately uses a simple, readable structure.

## Quick path (Docker, recommended)

### Linux/macOS

```sh
git clone <repository-url> builder-elastic-cv
cd builder-elastic-cv
make docker-all
```

### Windows Docker Desktop / WSL

In PowerShell (after enabling Docker Desktop's file sharing for the repository drive):

```powershell
git clone <repository-url> builder-elastic-cv
Set-Location builder-elastic-cv
docker compose build cv
docker compose run --rm cv
```

The same `make docker-all` command works from Git Bash, WSL, or another
environment that provides `make`. Enable Docker Desktop file sharing for the
repository drive. All paths leave PDFs in the host `build/` directory.

## Docker lifecycle

`make docker-all` checks for the Compose image tag
`builder-elastic-cv:bookworm`. On the first run, or when that tag is absent, it
builds the toolchain image and then runs the mounted service. Later runs reuse
the existing image and only run the service. Because the repository is
bind-mounted at `/workspace`, source and JSON edits do not rebuild the image.

Run `make docker-build` explicitly after changing `Dockerfile` or toolchain
dependencies. Docker is only the compiler and validator: OpenCode and the
`cv-vacancy-tailor` skill edit files on the host, while generated PDFs persist
in the host `build/` directory. Quit and restart OpenCode after changing the
skill so its instructions reload.

## Workflow

- Keep shared formatting in `src/layouts/` and `src/config/`; keep localized facts under the corresponding language directory.
- Keep formatting in `src/layouts/professional.tex` and shared commands/theme files.
- Use `variants/spanish.tex` and `variants/english.tex` as thin language entrypoints; do not copy CV content into them.
- Inspect extracted text with `pdftotext` whenever content or layout changes.

## Commands and local fallback

| Command | Purpose |
| --- | --- |
| `make build` | Compile all configured variants into `build/`. |
| `make validate` | Validate required headings in extracted PDF text. |
| `make all` | Build and validate all variants. |
| `make docker-all` | Build the image only when `builder-elastic-cv:bookworm` is absent, then build and validate in Docker. |
| `make docker-build` | Explicitly rebuild the Docker toolchain image. |
| `docker compose build cv` then `docker compose run --rm cv` | PowerShell fallback when `make` is unavailable. |
| `make clean` | Remove generated build artifacts while preserving `build/.gitkeep`. |
| `make build VARIANT=spanish\|english` | Compile one language version. |

The local build fails with an explicit dependency message when `latexmk`,
`pdflatex`, or `pdftotext` is unavailable. If Docker is unavailable, install a
standard TeX distribution plus Poppler (`pdftotext`) on the host, then use
`make all`. Local PDFs also go to `build/`.

## Vacancy tailoring

Use `.opencode/skills/cv-vacancy-tailor/SKILL.md` with a vacancy or job description. It
loads `data/cv-memory.json`, identifies evidence-backed matches and gaps, asks
only high-value questions, and edits LaTeX only after approval. Confirmed facts
and provenance are added to JSON before approved content is projected into both
languages. Docker performs canonical verification when available; it never
modifies or recreates source or memory files.

## Layout principles

The professional layout uses one column, Latin Modern Roman, navy hierarchy,
ordinary text contact details, conventional section headings, and selectable PDF
text. It targets two readable pages rather than compressing type or spacing.
To preserve these ATS-oriented constraints, do not add a photo, icons, tables,
graphics, or multi-column layout.

## Factual content

Keep dates, technologies, outcomes, and links factual. Both variants must remain
factually identical; the Languages section contains only the supplied English
A2 proficiency.

The canonical reusable CV memory is `data/cv-memory.json`. Vacancy tailoring
updates this file only with explicitly confirmed facts, then projects approved
content into the localized LaTeX files before generating PDFs.
