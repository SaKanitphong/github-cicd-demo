# GitHub CI/CD Demo

Static site deployed to GitHub Pages via GitHub Actions.

- `src/` source, `scripts/` validate + build, `dist/` build output (generated)
- Workflow: `.github/workflows/pages.yml`
- Local run: `bash scripts/validate.sh && bash scripts/build.sh && open dist/index.html`
