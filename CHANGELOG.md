# Changelog

All notable changes to this project template are documented in this file.

The format is based on Keep a Changelog and this project follows Semantic Versioning.

## [1.0.2] - 2026-02-15

### Added
- Mandatory C4 deliverable set in Phase 3 architecture workflow: C1 (System Context), C2 (Container), C3 (Component), and focused C4 Code diagrams for high-risk/high-volatility components.
- Dedicated C4 modeling sections and consistency checks in `templates/architecture-document-template.md`.

### Changed
- Strengthened Gate 3 to require C4 diagram completeness and explicit rationale when C4 Code diagrams are omitted.
- Updated Phase 3 methodology guidance to align architecture visuals with volatility analysis and cross-level naming consistency.

### Notes
- This update improves architecture communication fidelity and reduces ambiguity during Phase 3 handoff into project design.

## [1.0.1] - 2026-02-15

### Added
- Live facilitation cadence (`Synthesize -> Challenge -> Decide`) in phase prompts to increase human-in-the-loop interaction.
- Explicit iterative requirements loops for Discovery (Why clarity) and Product Definition (What clarity).
- Mandatory architecture uncertainty protocol with explicit `UQ-###` tracking and targeted clarifying questions.
- Architecture uncertainty log section in `templates/architecture-document-template.md` with closure rules.
- Iteration and open-question tracking sections in `templates/product-brief-template.md` and `templates/prd-template.md`.

### Changed
- Strengthened Gate 1/2/3 criteria to prevent progression with unresolved critical contradictions or architecture uncertainties.
- Updated phases 4-8 prompts to require section-level user confirmations and explicit uncertainty surfacing.
- Expanded gate evidence guidance to include iteration-cycle completion and unresolved-requirement checks.
- Updated methodology and README principles to emphasize iterative requirements convergence before architecture.

### Notes
- This release focuses on decision quality and interaction depth, while keeping the existing phase flow and artifact set intact.

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

