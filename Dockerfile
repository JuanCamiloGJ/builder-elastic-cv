FROM debian:bookworm-slim

# Toolchain-only image: source files are supplied by the runtime bind mount.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends --yes \
        make \
        latexmk \
        texlive-latex-base \
        texlive-latex-extra \
        lmodern \
        poppler-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
