SHELL := /bin/sh

VARIANTS := spanish english
BUILD_DIR := build
PDF_PREFIX := _CV_Juan_Camilo_Garcia_Jimenez_
DATE_DIR := $(shell TZ=America/Bogota date +%d%m%Y)

COMPOSE := docker compose
DOCKER_IMAGE := builder-elastic-cv:bookworm

.PHONY: all build archive clean validate check-dependencies docker-build docker-all

all: build validate

check-dependencies:
	@command -v latexmk >/dev/null 2>&1 || { echo "ERROR: latexmk is required. Install a standard TeX distribution." >&2; exit 1; }
	@command -v pdflatex >/dev/null 2>&1 || { echo "ERROR: pdflatex is required. Install a standard TeX distribution." >&2; exit 1; }

build: check-dependencies
	@mkdir -p $(BUILD_DIR)
	@if [ "$(VARIANT)" != "" ]; then \
		case "$(VARIANT)" in spanish|english) ;; *) echo "ERROR: unknown VARIANT='$(VARIANT)'. Use spanish or english." >&2; exit 1 ;; esac; \
		echo "Building $(VARIANT)..."; \
		latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR) -jobname=$(PDF_PREFIX)$(VARIANT) variants/$(VARIANT).tex; \
	else \
		for variant in $(VARIANTS); do echo "Building $$variant..."; latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR) -jobname=$(PDF_PREFIX)$$variant variants/$$variant.tex || exit $$?; done; \
	fi
	@$(MAKE) --no-print-directory archive GENERATED="$(if $(VARIANT),$(VARIANT),$(VARIANTS))"

archive:
	@dir="$(BUILD_DIR)/$(DATE_DIR)"; \
	mkdir -p "$$dir"; \
	lastnum=$$(ls "$$dir" | grep -E '_[0-9]+\.pdf$$' | grep -oE '[0-9]+\.pdf$$' | grep -oE '^[0-9]+' | sort -n | tail -1); \
	nextnum=$$(( $${lastnum:-0} + 1 )); \
	for v in $(if $(GENERATED),$(GENERATED),$(VARIANTS)); do \
		src="$(BUILD_DIR)/$(PDF_PREFIX)$$v.pdf"; \
		test -f "$$src" || continue; \
		cur="$$dir/.cmp_$$v.txt"; \
		pdftotext "$$src" "$$cur" 2>/dev/null || cur="$$src"; \
		dup=0; \
		for f in "$$dir/$(PDF_PREFIX)$$v"_*.pdf; do \
			test -f "$$f" || continue; \
			if pdftotext "$$f" - 2>/dev/null | cmp -s "$$cur" -; then dup=1; break; fi; \
		done; \
		rm -f "$$dir/.cmp_$$v.txt"; \
		if [ "$$dup" -eq 1 ]; then echo "Archive[$$v]: unchanged content, no new iteration"; continue; fi; \
		cp "$$src" "$$dir/$(PDF_PREFIX)$${v}_$${nextnum}.pdf"; \
		echo "Archive[$$v]: build/$(DATE_DIR)/$(PDF_PREFIX)$${v}_$${nextnum}.pdf"; \
	done

validate:
	@command -v pdftotext >/dev/null 2>&1 || { echo "ERROR: pdftotext is required for ATS text validation." >&2; exit 1; }
	@for variant in $(if $(VARIANT),$(VARIANT),$(VARIANTS)); do \
		pdf=$(BUILD_DIR)/$(PDF_PREFIX)$$variant.pdf; \
		test -f "$$pdf" || { echo "ERROR: missing $$pdf. Run 'make build'." >&2; exit 1; }; \
		tests/validate-text.sh "$$pdf" tests/required-sections-$$variant.txt || exit $$?; \
	done

clean:
	@find $(BUILD_DIR) -maxdepth 1 -type f ! -name .gitkeep -delete 2>/dev/null || true
	@find $(BUILD_DIR) -mindepth 1 -maxdepth 1 -type d -empty -delete 2>/dev/null || true

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
