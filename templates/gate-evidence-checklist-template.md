# Gate Evidence Checklist Template

Use this template at the end of each phase to prove gate readiness with objective evidence.

## Document Control
**Project**: [Project Name]  
**Phase**: [1-8]  
**Gate**: [Gate 1-8]  
**Date**: [Date]  
**Owner**: [Name]  
**Status**: [Draft / Review / Approved / Rejected]

## 1. Gate Decision
**Decision**: [Pass / Fail]  
**Rationale**: [One paragraph summary with key risks and confidence]

## 2. Required Criteria Verification

| Criterion ID | Criterion Description | Evidence Artifact | Evidence Location | Verifier | Result |
|--------------|-----------------------|-------------------|-------------------|----------|--------|
| Gx-001 | [Criterion from gate checklist] | [Doc/Test/Report] | [Path/URL] | [Name] | [Pass/Fail] |
| Gx-002 | [Criterion from gate checklist] | [Doc/Test/Report] | [Path/URL] | [Name] | [Pass/Fail] |

## 3. Artifact Inventory

| Artifact Type | Required | Produced | Location | Version |
|---------------|----------|----------|----------|---------|
| Product Brief / PRD / Architecture / Plan / Test Plan | [Yes/No] | [Yes/No] | [Path] | [vX.Y] |
| GitHub Issues Register (IDs, status, links) | [Yes/No] | [Yes/No] | [Path/URL] | [Date] |
| Traceability Matrix | [Yes/No] | [Yes/No] | [Path] | [vX.Y] |
| Test Results | [Yes/No] | [Yes/No] | [Path] | [Run ID] |
| Risk Register Update | [Yes/No] | [Yes/No] | [Path] | [Date] |

## 4. Quantitative Quality Signals

| Signal | Target | Actual | Status | Notes |
|--------|--------|--------|--------|-------|
| Requirements discovery/refinement iteration cycles completed | [>=2 for Gate 1/2] | [#] | [Pass/Fail] | |
| Critical unresolved requirement questions | [0 or approved exceptions] | [#] | [Pass/Fail] | |
| Work items with traceable GitHub Issue IDs and status | 100% | [%] | [Pass/Fail] | |
| Requirements traceability completeness | 100% | [%] | [Pass/Fail] | |
| Open Critical defects | 0 | [#] | [Pass/Fail] | |
| Open High defects | [Threshold] | [#] | [Pass/Fail] | |
| Unit test coverage (logic) | [>=80% or policy] | [%] | [Pass/Fail] | |
| Architecture rule violations | 0 | [#] | [Pass/Fail] | |

## 5. Exceptions and Risk Acceptance

| Exception ID | Criterion Impacted | Reason | Risk | Approved By | Expiry |
|--------------|--------------------|--------|------|-------------|--------|
| EX-001 | [Gx-###] | [Why exception requested] | [Low/Med/High] | [Role/Name] | [Date] |

## 6. Corrective Actions (if gate failed)

| Action ID | Issue | Owner | Due Date | Exit Condition |
|-----------|-------|-------|----------|----------------|
| CA-001 | [What failed] | [Name] | [Date] | [Objective proof of fix] |

## 7. Sign-off

| Role | Name | Decision | Date |
|------|------|----------|------|
| Phase Owner | | [Pass/Fail] | |
| Architect / Tech Lead | | [Pass/Fail] | |
| Product Owner | | [Pass/Fail] | |
| QA Lead (where applicable) | | [Pass/Fail] | |

## 8. Attachments
- [Link to primary artifacts]
- [Link to test reports]
- [Link to risk register]
