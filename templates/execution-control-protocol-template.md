# Execution Control Protocol Template

Define how execution is controlled and when work must stop, continue, or escalate.

## 1) State Model

Allowed states:
- `ready`
- `running`
- `paused-awaiting-architect`
- `blocked`
- `completed`
- `aborted`

## 2) Control Actions

| Action | Description | Allowed From | Resulting State | Requires Architect |
|--------|-------------|--------------|-----------------|--------------------|
| feed | Continue step with approved context | ready, paused-awaiting-architect | running | optional |
| pause | Stop step pending clarification/decision | running | paused-awaiting-architect | no |
| kill | Terminate current step run | running, blocked | aborted | yes |
| retry | Re-run step in same scope | blocked, paused-awaiting-architect | running | optional |
| escalate | Request architect decision on risk/ambiguity | running, blocked, paused-awaiting-architect | paused-awaiting-architect | yes |

## 3) Mandatory Pause/Escalate Triggers

- Out-of-scope file change detected.
- New architecture boundary introduced without approval.
- Missing prerequisite artifact for current step.
- Conflicting reviewer results on mandatory rule.
- Critical policy/standards violation.

## 4) Decision Log

| Timestamp | Step ID | Interaction ID | Event | Trigger | Action Taken | Decision By | Evidence Ref | Replay Sequence |
|-----------|---------|----------------|-------|---------|--------------|-------------|--------------|-----------------|
| [time] | [step] | [AI-0001] | [pause/escalate/etc.] | [reason] | [what happened] | [name/role] | [log/path/url] | [order index or range] |

## 5) Exit Criteria

A step can move to `completed` only when:
- completion criteria are met,
- required reviews pass,
- evidence artifacts are linked,
- diff is within approved change manifest.
