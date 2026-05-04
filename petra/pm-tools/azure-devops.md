# Azure DevOps Templates for Petra

## Work Item Types

### Epic: Phase

```
Title: Petra Phase [N] - [Name]
Description: Phase gate for Petra methodology
```

### User Story: Artefact

```
Title: [Artefact Name]
Description: Petra artefact
Template: petra/artefacts/templates/[template].md
```

### Task: Phase Task

```
Title: Phase [N] - [Task]
Description: Task from Petra phase workflow
```

## Fields

Add these to Work Items:

| Field | Type | Values |
|-------|------|--------|
| Petra Phase | Picklist | 0-8 |
| Petra Persona | Multi-select | Architect, Sponsor, PM, Developer, QA |
| Gate Status | Picklist | Not Started, In Review, Passed, Failed |

## Iteration Structure

```
Petra
├── Phase 0 - Incubation
├── Phase 1 - Discovery
├── Phase 2 - Product Definition
├── Phase 3 - Architecture
├── Phase 4 - Project Design
├── Phase 5 - Implementation
├── Phase 6 - Quality Assurance
├── Phase 7 - Deployment
└── Phase 8 - Maintenance
```

## Board Columns

- Backlog
- To Do
- In Progress
- Blocked
- Gate Review
- Done

## Automation

- When Petra Phase changes → Move to iteration
- When Gate Status = Failed → Create alert
- When all tasks done → Create Gate Review work item