# MM-AI: IDesign-Driven Software Development Methodology

LLM-guided methodology for taking software products from inception through completion, grounded in **IDesign principles** (Juval Löwy / *Righting Software*).

## What This Is

A **template repo** for new projects + **VS Code prompt files** that guide you through 8 phases:

1. **Discovery** — Problem framing, feasibility
2. **Product Definition** — Requirements, user stories, volatility tagging
3. **Architecture** — IDesign volatility decomposition (the heart of it)
4. **Project Design** — Architecture-driven scheduling & risk
5. **Implementation** — Contract-first, bottom-up development
6. **Quality Assurance** — Architecture-aligned testing
7. **Deployment** — Architecture-ordered release
8. **Maintenance** — Volatility-driven evolution

## Setup

**Prompts and instructions are project-level in this template repo**:
- `.github/prompts/`
- `.github/instructions/`

In a project created from this template: **Agent Mode → `/` → pick a phase**.

## Standards Reference

This template can be aligned with IDesign standards for architecture and coding governance.

- Standards landing page: https://www.idesign.net/Resources/Standards
- Local guidance in this repo: `docs/idesign-standards-reference.md`
- Enforceable project standards baseline: `docs/adopted-standards.md`
- Project standards declaration template: `templates/adopted-standards-checklist-template.md`
- Standards-to-evidence mapping template: `templates/standards-traceability-matrix-template.md`

## Orchestration Profiles (Optional)

Use `docs/strict-orchestration-pack.md` when you need tighter multi-agent governance.

- `solo-lean` — lowest overhead, single-review default.
- `solo-strict` — dual-review at critical steps and orchestrator enforcement.
- `team-strict` — expanded role specialization with mandatory evidence at all key steps.

## Quick Start (Template Consumers)

For a practical first-session guide, use: `docs/day-1-runbook.md`.

1. **Create repo from template**
	- Click **Use this template** and create your new project repository.

2. **Start phase-driven planning**
	- In VS Code Agent Mode, run prompts from `.github/prompts/` in order (Phase 1 → Phase 8).

3. **Create compliance policy file**
	- Copy `templates/compliance-check-config.template.json` to `.mm-ai/compliance-check-config.json`.
	- Adjust thresholds and required rules for your team/release policy.

4. **Generate compliance report in CI**
	- Output `.mm-ai/out/compliance-report.json` using your pipeline/tooling.
	- Keep report shape aligned with `templates/compliance-check-report.schema.json`.

5. **Enable PR compliance gate**
	- Use `.github/workflows/compliance-check.yml`.
	- The workflow auto-bootstraps config if missing, then fails PRs when policy is violated.
	- See `docs/compliance-ci-setup.md` for end-to-end setup details.

6. **(Optional) Enable strict orchestration controls**
	- Adopt `docs/strict-orchestration-pack.md`.
	- Use `templates/execution-control-protocol-template.md` and `templates/agent-handoff-contract-template.md` for step execution.
	- Use `templates/recovery-playbook-template.md` for drift/failure recovery.

## Using the Template

Click **"Use this template"** on GitHub to start a new project. You get:
- `templates/` — Document templates (product brief, PRD, architecture doc, project plan, test plan, user stories)
- `templates/gate-evidence-checklist-template.md` — Objective evidence pack for pass/fail gate decisions
- `templates/automated-compliance-rubric-template.md` — Weighted compliance scoring rubric for automated checks
- `templates/adopted-standards-checklist-template.md` — Project-level declaration of mandatory/advisory standards
- `templates/standards-traceability-matrix-template.md` — Trace standards to phase gates, evidence, and CI checks
- `templates/agent-handoff-contract-template.md` — Standardized per-step handoff I/O and allowed scope contract
- `templates/execution-control-protocol-template.md` — Feed/pause/kill/escalate control model and triggers
- `templates/ai-interaction-log-template.md` — Audit log for AI interactions (who instructed what, where, and when)
- `templates/recovery-playbook-template.md` — Recovery workflow for drift, blockages, and execution failures
- `templates/compliance-check-config.template.json` — Policy thresholds and required rules for CI gating
- `templates/compliance-check-report.schema.json` — JSON schema for machine-readable compliance reports
- `templates/compliance-check-report.example.json` — Example report payload for tool/pipeline integration
- `scripts/evaluate-compliance.ps1` — CI evaluator script that returns non-zero on policy violations
- `docs/compliance-ci-setup.md` — Setup guide for running compliance checks on pull requests
- `docs/day-1-runbook.md` — One-session startup guide for new projects (solo-lean and solo-strict)
- `docs/idesign-standards-reference.md` — External standards links and adoption guidance
- `docs/adopted-standards.md` — Concrete enforceable standards baseline for template consumers
- `docs/strict-orchestration-pack.md` — Optional strict multi-agent governance profile and operating model
- `.github/workflows/compliance-check.yml` — Ready-to-use PR gate workflow for compliance evaluation
- `.github/prompts/` — Project-level phase prompts (Discovery through Maintenance)
- `.github/instructions/mm-ai.instructions.md` — Project-level methodology context instructions
- `methodology-reference.md` — Deep reference for all 8 phases and IDesign concepts
- This README

## Key Principles

1. **Volatility drives decomposition** — services encapsulate axes of change, not business functions
2. **Architecture is not optional** — every system gets a proper volatility analysis
3. **Requirements are iterative** — converge on clear Why/What through evidence-backed cycles before architecture
4. **Quality is designed in, not tested in** — gates prevent phase transitions until criteria met
5. **The LLM is a tool, not the architect** — human judgment validates all decisions

## Template Release Checklist

Use this checklist before tagging a new template release (for example, `v1.0.0`):

- [ ] All project-level prompt files exist in `.github/prompts/` (Phases 1-8)
- [ ] Methodology instruction file exists in `.github/instructions/mm-ai.instructions.md`
- [ ] README links and paths are valid (no stale `user-level` references)
- [ ] `templates/` includes core docs + gate evidence + compliance artifacts
- [ ] `.github/workflows/compliance-check.yml` runs with current repository paths
- [ ] `scripts/evaluate-compliance.ps1` passes both fail-case and pass-case smoke checks
- [ ] `docs/compliance-ci-setup.md` matches current workflow behavior
- [ ] Methodology terminology is consistent (volatility, manager role, buffer guidance)
- [ ] Repo has no duplicate source-of-truth folders for prompts/instructions
- [ ] Create release tag and changelog notes summarizing methodology + CI governance updates

## How to Cut a Release

1. Run through the **Template Release Checklist** above.
2. Update `CHANGELOG.md` with a new version section and date.
3. Commit all changes on `main` and ensure CI is green.
4. Create an annotated tag (example: `v1.0.1`).
5. Push the tag and publish a GitHub Release using the changelog section as release notes.
6. For breaking template changes, bump major version and call out migration notes explicitly.

## Influenced By

- **IDesign Method** — Juval Löwy, *Righting Software*
