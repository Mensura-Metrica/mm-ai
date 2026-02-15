# Day 1 Runbook (MM-AI)

Use this runbook to start a new project from the template in one working session.

## 0) Pick Your Operating Mode

Choose one:
- **solo-lean**: faster, lower overhead, single-review default.
- **solo-strict**: more control, dual-review at critical steps, strict handoffs/manifests.

If unsure, start with **solo-lean** and switch to **solo-strict** when architecture risk or change cost rises.

## 1) Bootstrap Project Workspace (30-60 min)

- Create repo from template.
- Open project in VS Code Agent Mode.
- Confirm prompt files are present in `.github/prompts/`.
- Confirm instruction file is present in `.github/instructions/mm-ai.instructions.md`.

## 2) Set Governance Baseline (45-90 min)

- Create project-specific standards declaration from:
  - `templates/adopted-standards-checklist-template.md`
- Create standards traceability matrix from:
  - `templates/standards-traceability-matrix-template.md`
- Confirm mandatory rules and ownership (architect/reviewer/CI).

Strict mode only:
- Create execution control protocol from:
  - `templates/execution-control-protocol-template.md`
- Create handoff contract template instance from:
  - `templates/agent-handoff-contract-template.md`
- Prepare recovery playbook from:
  - `templates/recovery-playbook-template.md`

## 3) Run Phase 1 and Phase 2 (90-180 min)

Using prompts in `.github/prompts/`:
- Run Phase 1 Discovery and complete gate checklist.
- Run Phase 2 Product Definition and complete gate checklist.

Artifacts to produce:
- Product brief
- PRD
- Initial user stories
- Initial risk assumptions

## 4) Compliance Gate Setup (30-60 min)

- Copy `templates/compliance-check-config.template.json` to `.mm-ai/compliance-check-config.json`.
- Adjust policy thresholds and required rule IDs for your project.
- Ensure CI will generate `.mm-ai/out/compliance-report.json`.
- Confirm `.github/workflows/compliance-check.yml` is active.

## 5) Start Architecture Work (Phase 3 kickoff)

- Run `.github/prompts/phase-3-architecture.prompt.md`.
- Enforce volatility-based decomposition and taxonomy call rules.
- Complete architecture gate with evidence.

Stop condition for Day 1:
- Discovery and Product Definition passed.
- Compliance gate configured.
- Architecture phase started with standards/governance constraints in place.

## Day 1 Exit Checklist

- [ ] Operating mode selected and documented.
- [ ] Standards checklist created and assigned.
- [ ] Standards traceability matrix created.
- [ ] Phase 1 gate passed.
- [ ] Phase 2 gate passed.
- [ ] CI compliance policy configured.
- [ ] Architecture phase initiated with gate criteria visible.

## Escalation Rules (Recommended)

Pause and escalate to architect when:
- A required artifact is missing for the current phase.
- A mandatory standards rule cannot be satisfied.
- A design decision crosses service boundaries unexpectedly.
- Planned file edits exceed approved scope in strict mode.

## Git Handoff Mode (When Agent Cannot Commit/Push)

If your tool environment restricts direct `git commit`/`git push`:
- Keep using the phase prompts normally; implementation and QA work still proceeds.
- For each completed change set, require a handoff packet containing:
  - proposed commit message,
  - list of changed files,
  - verification/test evidence,
  - linked GitHub Issue.
- Human executes `git add/commit/push` and records resulting SHA/PR in the AI interaction log and gate evidence.
- Do not close Phase 5/6/7/8 gates without SHA-linked evidence.
