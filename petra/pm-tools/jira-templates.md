# Jira Templates for Petra

Import these into your Jira project.

## Issue Types

### Epic: Phase

| Field | Value |
|-------|-------|
| Name | Petra Phase [N] - [Name] |
| Description | Phase gate for Petra methodology |

### Story: Artefact

| Field | Value |
|-------|-------|
| Name | [Artefact Name] |
| Description | Petra artefact. Template: `petra/artefacts/templates/[template].md` |

### Task: Phase Task

| Field | Value |
|-------|-------|
| Name | Phase [N] - [Task] |
| Description | Task from Petra phase workflow |

## Workflow States

```
To Do → In Progress → Blocked / Done
                    ↓
              Gate Review → Pass / Fail
```

## Custom Fields

| Field | Type | Purpose |
|-------|------|---------|
| Petra Phase | Select (0-8) | Current phase |
| Petra Persona | Multi-select | Role |
| Gate Status | Select | Not Started / In Review / Passed / Failed |

## Example Board Columns

1. Backlog (Future phases)
2. To Do (Current phase tasks)
3. In Progress
4. Blocked
5. Gate Review
6. Done

## Automation Rules

- When Phase changes → Move card to appropriate column
- When Gate Status = Failed → Send notification
- When all tasks done in phase → Create Gate Review task