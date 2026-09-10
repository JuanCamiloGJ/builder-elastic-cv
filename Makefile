SHELL := /bin/sh

VARIANTS := spanish english
BUILD_DIR := build

COMPOSE := docker compose
DOCKER_IMAGE := builder-elastic-cv:bookworm

.PHONY: all build clean validate check-dependencies docker-build docker-all

all: build validate

check-dependencies:
	@command -v latexmk >/dev/null 2>&1 || { echo "ERROR: latexmk is required. Install a standard TeX distribution." >&2; exit 1; }
	@command -v pdflatex >/dev/null 2>&1 || { echo "ERROR: pdflatex is required. Install a standard TeX distribution." >&2; exit 1; }

build: check-dependencies
	@mkdir -p $(BUILD_DIR)
	@if [ "$(VARIANT)" != "" ]; then \
		case "$(VARIANT)" in spanish|english) ;; *) echo "ERROR: unknown VARIANT='$(VARIANT)'. Use spanish or english." >&2; exit 1 ;; esac; \
		echo "Building $(VARIANT)..."; \
		latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR) -jobname=$(VARIANT) variants/$(VARIANT).tex; \
	else \
		for variant in $(VARIANTS); do echo "Building $$variant..."; latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR) -jobname=$$variant variants/$$variant.tex || exit $$?; done; \
	fi

validate:
	@command -v pdftotext >/dev/null 2>&1 || { echo "ERROR: pdftotext is required for ATS text validation." >&2; exit 1; }
	@for variant in $(if $(VARIANT),$(VARIANT),$(VARIANTS)); do \
		test -f $(BUILD_DIR)/$$variant.pdf || { echo "ERROR: missing $(BUILD_DIR)/$$variant.pdf. Run 'make build'." >&2; exit 1; }; \
		tests/validate-text.sh $(BUILD_DIR)/$$variant.pdf tests/required-sections-$$variant.txt || exit $$?; \
	done

clean:
	@find $(BUILD_DIR) -type f ! -name .gitkeep -delete 2>/dev/null || true

docker-build:
	@$(COMPOSE) build cv

docker-all:
	@if docker image inspect $(DOCKER_IMAGE) >/dev/null 2>&1; then \
		echo "Reusing Docker image $(DOCKER_IMAGE)..."; \
	else \
		echo "Docker image $(DOCKER_IMAGE) not found; building..."; \
		$(COMPOSE) build cv; \
	fi
	@$(COMPOSE) run --rm cv
