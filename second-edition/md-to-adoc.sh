#!/bin/bash

source_path="src"
#source_path="${1}"
mkdir -p src-adoc && \
# ------------------------
# Dry run (1):
#
# -exec bash -c 'echo "$(basename -s ".md" "{}")"' \;
#
# Dry run (2):
#
# -exec bash -c 'echo "cp "{}" "$(realpath "${target_path}")"/"$(basename -s ".md" "{}")""' \;
# ------------------------
find "$(realpath "${source_path}")" \
-iname "*md" \
-exec bash -c '
pandoc \
-s \
-f markdown \
-t asciidoc \
--atx-headers \
--extract-media=media \
--wrap=none \
--reference-links \
--parse-raw \
--self-contained \
"{}" \
-o "src-adoc/$(basename -s ".md" "{}").adoc"' \;
