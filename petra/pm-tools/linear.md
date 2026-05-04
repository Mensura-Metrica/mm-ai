# Linear Templates for Petra

## Team Structure

Create a Petra team with these states:

## States

```
backlog:     Backlog
triage:      To Do
in_progress: In Progress
blocked:     Blocked
review:      Gate Review
done:        Done
canceled:   Cancelled
```

## Projects (One per Phase)

Create projects:
- Petra Phase 0 - Incubation
- Petra Phase 1 - Discovery
- Petra Phase 2 - Product Definition
- Petra Phase 3 - Architecture
- Petra Phase 4 - Project Design
- Petra Phase 5 - Implementation
- Petra Phase 6 - Quality Assurance
- Petra Phase 7 - Deployment
- Petra Phase 8 - Maintenance

## Labels

| Label | Color | Purpose |
|-------|-------|---------|
| architect | Purple | Persona |
| sponsor | Blue | Persona |
| pm | Green | Persona |
| developer | Yellow | Persona |
| qa | Red | Persona |
| gate-passed | Green | Gate status |
| gate-failed | Red | Gate status |
| artefact | Orange | Work type |

## Custom Fields

| Field | Type | Options |
|-------|------|---------|
| Petra Phase | Single select | 0-8 |
| Petra Persona | Multi-select | Architect, Sponsor, PM, Developer, QA |
| Gate Status | Single select | Not Started, In Review, Passed, Failed |

## Workflow

1. Create issue in appropriate Phase project
2. Assign Persona label
3. Set Petra Phase field
4. Move through states
5. When all done → Gate Review state