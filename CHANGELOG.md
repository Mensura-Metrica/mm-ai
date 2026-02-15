# Changelog

All notable changes to this project template are documented in this file.

The format is based on Keep a Changelog and this project follows Semantic Versioning.

## [1.0.7] - 2026-02-15

### Added
- Deployment portability and platform-agnostic constraints in Phase 7, including open standards preference and IaC-driven reproducibility.
- Explicit requirement to document vendor-specific dependencies with portability impact and migration/fallback planning.

### Changed
- Gate 7 now verifies portability/agnostic infrastructure documentation and justification of any vendor lock-in decisions.
- Operational readiness guidance now includes migration/failover considerations for critical services.

### Notes
- This update reduces infrastructure lock-in risk and improves long-term deployment flexibility.

## [1.0.6] - 2026-02-15

### Added
- Automation-first QA policy in Phase 6, prioritizing automated integration, smoke, and regression testing.
- Test plan sections for automation strategy, manual-test exception tracking, automation coverage, and pipeline execution evidence.

### Changed
- Gate 6 now requires automated integration, smoke, and regression coverage with explicit handling for manual-only exceptions.
- Deployment guidance and Gate 7 now require pipeline-executed automated smoke validation before release sign-off.

### Notes
- This update increases release confidence by shifting QA evidence toward repeatable, CI/CD-executed automation.

## [1.0.5] - 2026-02-15

### Added
- Technology Selection Matrix requirement in Phase 4 to compare viable implementation stacks objectively.
- Project plan template section for scoring options against industry prevalence, cost to build, cost to run, and portability.

### Changed
- Gate 4 now requires technology decision rationale documentation before implementation.
- Methodology reference updated to treat preferred stacks (for example C#) as valid options but not automatic defaults.

### Notes
- This update formalizes technology choice as an evidence-based decision with transparent tradeoff documentation.

## [1.0.4] - 2026-02-15

### Added
- Phase 5 implementation controls for TDD-first execution, atomic delivery cadence, quality-first expectations, and explicit SOLID enforcement.
- Definition of Ready (DoR) and Definition of Done (DoD) checks in implementation guidance.
- Explicit GitHub Issues traceability requirement for implementation work, commits, and pull requests.

### Changed
- Gate 5 checklist expanded to include TDD evidence, atomic delivery behavior, SOLID conformance review, and GitHub Issue linkage/update requirements.
- Gate evidence template updated to include a GitHub Issues register and ticket traceability quality signal.
- Methodology reference updated with GitHub-Issue-based work tracking discipline.

### Notes
- This update strengthens implementation governance without changing architecture or phase sequencing.

## [1.0.3] - 2026-02-15

### Added
- Universal Tone Contract added to all phase prompts (`phase-1` through `phase-8`) to enforce consistent facilitation behavior.

### Changed
- Standardized prompt tone expectations across the full lifecycle around: facilitation, structured output, evidence-based decisions, explicit keep/change/defer decisions, transparent uncertainty handling, and gate-discipline.

### Notes
- This update improves cross-phase consistency in AI/user collaboration without changing the underlying phase workflow.

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

