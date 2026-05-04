# Phase Iteration & Artefact Matrix (Reference)

Cross-reference of which artefacts each persona produces and consumes in each phase iteration.

---

## Legend

| Symbol | Meaning |
|--------|---------|
| ● | Primary owner/responsible |
| ◐ | Contributor |
| ○ | Consumer (receives output) |

---

## Quick Reference by Persona

### Architect → See [`architect/README.md`](../architect/README.md)
- Owns: Architecture Document, Service Decomposition, Interfaces, ADRs
- Consumes: Requirements, Non-functional requirements
- Gate: Gate 3 (Architecture)

### Sponsor → See [`sponsor/README.md`](../sponsor/README.md)
- Owns: Business Case, Budget Approval, Release Sign-off
- Consumes: All phase status reports
- Gate: Gates 0, 2, 4, 7

### Project Manager → See [`pm/README.md`](../pm/README.md)
- Owns: Project Plan, Status Reports, Risk Register, Stakeholder Register
- Consumes: All phase outputs
- Gate: Contributes to all gates

### Developer → See [`developer/README.md`](../developer/README.md)
- Owns: Implementation, Tests, Code Review
- Consumes: Interface Contracts, Sprint Plans
- Gate: Gate 5 (Implementation)

### QA → See [`qa/README.md`](../qa/README.md)
- Owns: Test Plan, Test Results, QA Sign-off
- Consumes: Architecture, Requirements
- Gate: Gate 6 (QA)

---

## Phase Summary

| Phase | Primary Owner | Gate | Key Artefact |
|-------|----------------|------|------------|
| 0 | Sponsor | 0 | Concept Brief |
| 1 | Architect/PM | 1 | Discovery Brief |
| 2 | PM | 2 | Requirements |
| 3 | Architect | 3 | Architecture Document |
| 4 | PM | 4 | Project Plan |
| 5 | Developer | 5 | Implementation |
| 6 | QA | 6 | Test Results |
| 7 | Sponsor/PM | 7 | Release |
| 8 | PM | 8 | Retrospective |

For full iteration breakdown, see methodology reference.