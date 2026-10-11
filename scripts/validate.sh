#!/usr/bin/env bash
# Cheap gate that stands in for lint/test. Fails the PR check when violated.
set -euo pipefail

f=src/index.html

[ -s "$f" ] || { echo "::error file=$f::index.html is missing or empty"; exit 1; }
grep -q "<title>" "$f" || { echo "::error file=$f::missing <title>"; exit 1; }

if grep -rn "FIXME" src; then
  echo "::error::FIXME found in src/ - resolve before merging"
  exit 1
fi

echo "validate: ok"
