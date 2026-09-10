#!/bin/sh
set -eu

PDF="${1:-}"
FIXTURE="${2:-tests/required-sections-english.txt}"
if [ -z "$PDF" ] || [ ! -f "$PDF" ]; then
  echo "ERROR: provide an existing PDF path, for example tests/validate-text.sh build/english.pdf tests/required-sections-english.txt." >&2
  exit 1
fi
command -v pdftotext >/dev/null 2>&1 || { echo "ERROR: pdftotext is required." >&2; exit 1; }

TEXT="$(mktemp)"
NORMALIZED_TEXT="$(mktemp)"
trap 'rm -f "$TEXT" "$NORMALIZED_TEXT"' EXIT
pdftotext "$PDF" "$TEXT"
sed ':a;N;$!ba;s/-\n[[:space:]]*//g' "$TEXT" | tr -s '[:space:]' ' ' > "$NORMALIZED_TEXT"
missing=0
while IFS= read -r required || [ -n "$required" ]; do
  [ -z "$required" ] && continue
  normalized_required="$(printf '%s' "$required" | tr -s '[:space:]' ' ')"
  if ! grep -F -q -- "$normalized_required" "$NORMALIZED_TEXT"; then
    echo "MISSING: $required" >&2
    missing=1
  fi
done < "$FIXTURE"

if [ "$missing" -ne 0 ]; then
  echo "ERROR: extracted text validation failed for $PDF." >&2
  exit 1
fi
echo "OK: extracted text contains all required sections for $PDF."
