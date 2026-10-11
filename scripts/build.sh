#!/usr/bin/env bash
# Copies src/ -> dist/ and stamps build metadata so a deploy is visible on the page.
set -euo pipefail

SHA="${GITHUB_SHA:-local}"
SHORT="${SHA:0:7}"
RUN="${GITHUB_RUN_NUMBER:-0}"
NOW="$(date -u +'%Y-%m-%d %H:%M UTC')"

rm -rf dist && mkdir -p dist
cp -r src/. dist/

# -i.bak works on both GNU sed (CI) and BSD sed (macOS local runs)
sed -i.bak \
  -e "s/{{COMMIT_SHA}}/${SHORT}/g" \
  -e "s/{{RUN_NUMBER}}/${RUN}/g" \
  -e "s/{{BUILD_TIME}}/${NOW}/g" \
  dist/index.html
rm -f dist/index.html.bak

echo "build: ok -> dist/ (${SHORT}, run #${RUN})"
