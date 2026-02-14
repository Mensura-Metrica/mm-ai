# Changelog

All notable changes to this project template are documented in this file.

The format is based on Keep a Changelog and this project follows Semantic Versioning.

## [1.0.0] - 2026-02-14

### Added
- Project-level prompt system under `.github/prompts/` with all 8 phase prompt files.
- Project-level methodology instructions under `.github/instructions/mm-ai.instructions.md`.
- CI compliance workflow at `.github/workflows/compliance-check.yml`.
- Compliance evaluator script at `scripts/evaluate-compliance.ps1`.
- Compliance policy/config template at `templates/compliance-check-config.template.json`.
- Compliance config schema at `templates/compliance-check-config.schema.json`.
- Compliance report schema at `templates/compliance-check-report.schema.json`.
- Compliance report example payload at `templates/compliance-check-report.example.json`.
- Gate evidence checklist template at `templates/gate-evidence-checklist-template.md`.
- Automated compliance rubric template at `templates/automated-compliance-rubric-template.md`.
- CI setup guide at `docs/compliance-ci-setup.md`.
- README quick-start section for template consumers.
- README template release checklist section.

### Changed
- Standardized prompt and methodology references to project-level `.github/prompts/` paths.
- Unified Manager-role terminology to “orchestrates workflows and sequencing, no domain logic, no data access.”
- Standardized volatility labels to `Stable / Volatile / Uncertain`.
- Added volatility prioritization guidance in architecture phase content.
- Standardized project buffer guidance to `25-50% of critical path duration, adjusted by confidence`.
- Updated documentation to include governance and CI compliance assets.

### Removed
- Removed legacy `user-level/prompts` and `user-level/instructions` folders to enforce a single source of truth.

### Notes
- Compliance workflow bootstraps `.mm-ai/compliance-check-config.json` from template when missing.
- Compliance workflow still fails fast when `.mm-ai/out/compliance-report.json` is missing.

