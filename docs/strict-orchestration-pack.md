# Strict Orchestration Pack (Optional)

Use this pack when you want deterministic multi-agent execution with stronger governance controls.

## Purpose

This mode is designed for architect-led execution where automation speed is useful but uncontrolled drift is unacceptable.

## Core Elements

1. Agent Team Profile
2. Execution Control Protocol
3. Step Handoff Contract
4. Change Manifest Discipline
5. Recovery Workflow

## 1) Agent Team Profile

### Role Types

- Task Agents: perform phase and step work.
- Support Agents: provide validation, traceability, and quality checks.
- Orchestrator Agent: enforces step order, prerequisites, and transitions.
- Human Architect: final decision authority at gates and critical ambiguities.

### Suggested Profiles

- `solo-lean`: minimal agent count, single-review default.
- `solo-strict`: dual-review for critical steps, orchestrator enforcement.
- `team-strict`: expanded role segmentation and mandatory evidence at all steps.

## 2) Execution Control Protocol

Execution transitions must use explicit states:
- `ready`
- `running`
- `paused-awaiting-architect`
- `blocked`
- `completed`
- `aborted`

Control actions:
- `feed` (continue with approved context)
- `pause` (stop and await decision)
- `kill` (terminate current step execution)
- `retry` (rerun with same scope)
- `escalate` (route ambiguity/risk to architect)

## 3) Step Handoff Contract

Each step handoff must declare:
- approved inputs,
- expected outputs,
- allowed file scope,
- required evidence,
- review obligations,
- gate impact.

Use `templates/agent-handoff-contract-template.md`.

## 4) Change Manifest Discipline

Implementation-affecting steps must include a pre-declared change manifest:
- intended files to create/modify/delete,
- expected reason per file,
- disallowed paths,
- post-step diff verification.

Any out-of-manifest change must trigger pause/escalate.

## 5) Recovery Workflow

When execution degrades or drifts:
1. Diagnose
2. Classify failure type
3. Decide salvage vs rollback
4. Execute recovery plan
5. Capture post-mortem learning

Use `templates/recovery-playbook-template.md`.

## Adoption Guidance

- Default to `solo-lean` for low-risk projects.
- Use `solo-strict` for projects with high change cost or architectural risk.
- Use `team-strict` only when role overhead is justified by complexity.
