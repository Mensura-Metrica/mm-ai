# Adopted Standards Checklist Template

Use this checklist to declare and enforce standards for a specific project created from this template.

## Project
- Project Name: [Name]
- Date: [Date]
- Owner: [Architect]

## 1) Rule Selection

| Rule ID | Rule Summary | Category | Level (Advisory/Mandatory) | Owner |
|---------|--------------|----------|-----------------------------|-------|
| STD-ARC-001 | Volatility-based decomposition required | Architecture | Mandatory | Architect |
| STD-TAX-001 | No forbidden layer calls | Taxonomy | Mandatory | Architect |
| STD-API-001 | Explicit operation contracts and error taxonomy | Contracts | Mandatory | Tech Lead |
| STD-IMP-001 | Build order follows dependency graph | Implementation | Mandatory | Tech Lead |
| STD-TST-001 | Must requirements trace to tests | QA | Mandatory | QA Lead |

## 2) Evidence Mapping

| Rule ID | Evidence Artifact | Path | Verification Method |
|---------|-------------------|------|---------------------|
| STD-ARC-001 | Architecture document | [path] | Review + call graph check |
| STD-TAX-001 | Dependency report | [path] | Automated rule check |
| STD-API-001 | Interface spec | [path] | Contract review |
| STD-IMP-001 | Build plan + commit history | [path] | Sequencing audit |
| STD-TST-001 | Traceability matrix | [path] | Coverage + mapping check |

## 3) Exception Register

| Exception ID | Rule ID | Reason | Risk | Approved By | Expiry |
|--------------|---------|--------|------|-------------|--------|
| EX-001 | [STD-###] | [Reason] | [Low/Med/High] | [Name] | [Date] |

## 4) Gate Usage

- [ ] Referenced in Phase 3 Architecture gate
- [ ] Referenced in Phase 5 Implementation gate
- [ ] Referenced in Phase 6 QA gate
- [ ] Included in compliance rubric input

## 5) Sign-off

| Role | Name | Decision | Date |
|------|------|----------|------|
| Architect | | [Approved/Rejected] | |
| Tech Lead | | [Approved/Rejected] | |
| QA Lead | | [Approved/Rejected] | |
