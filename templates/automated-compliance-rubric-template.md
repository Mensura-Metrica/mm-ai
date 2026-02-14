# Automated Compliance Rubric Template

Use this rubric to score architecture/process compliance at each gate. This is designed for automated or semi-automated checks.

## Document Control
**Project**: [Project Name]  
**Assessment Scope**: [Phase / Release / Sprint]  
**Assessor**: [Name or Tool]  
**Date**: [Date]  
**Version**: [vX.Y]

## 1. Scoring Model
- **Score per rule**: 0 (Fail), 0.5 (Partial), 1 (Pass)
- **Weighted score** = Sum(Rule Score × Weight) / Sum(Weights) × 100
- **Compliance bands**:
  - **Green**: >= 90
  - **Yellow**: 75-89
  - **Red**: < 75
- **Release policy**: [e.g., Production requires Green and no Critical failures]

## 2. Rule Catalog

| Rule ID | Category | Rule | Evidence Source | Check Method | Weight | Severity |
|---------|----------|------|-----------------|--------------|--------|----------|
| ARC-001 | Architecture | No forbidden layer skipping | Static dependency graph | Automated | 10 | Critical |
| ARC-002 | Architecture | No lateral same-type service calls where forbidden | Static dependency graph | Automated | 8 | High |
| ARC-003 | Architecture | No circular dependencies | Dependency graph | Automated | 10 | Critical |
| ARC-004 | Architecture | Interfaces exist for service boundaries | Code + contracts module | Automated | 6 | High |
| REQ-001 | Requirements | All Must requirements mapped to tests | Traceability matrix | Semi-automated | 9 | Critical |
| TST-001 | Testing | Business logic coverage meets threshold | Coverage report | Automated | 8 | High |
| TST-002 | Testing | Critical/High defects below policy threshold | Defect tracker | Automated | 9 | Critical |
| OPS-001 | Operations | Health checks defined for deployed services | Deployment config | Semi-automated | 5 | Medium |
| OPS-002 | Operations | Rollback runbook exists and is current | Runbook repo | Semi-automated | 5 | High |

## 3. Evaluation Output

| Rule ID | Result (0/0.5/1) | Raw Evidence | Notes |
|---------|------------------|--------------|-------|
| ARC-001 | [0/0.5/1] | [Tool/report path] | |
| ARC-002 | [0/0.5/1] | [Tool/report path] | |

## 4. Summary Metrics

| Metric | Value |
|--------|-------|
| Weighted compliance score | [%] |
| Critical rules failed | [#] |
| High rules failed | [#] |
| Trend vs previous assessment | [Up/Flat/Down] |

## 5. Gate Decision Recommendation
**Recommended Gate Decision**: [Pass / Conditional Pass / Fail]  
**Blocking Conditions**: [List any failed Critical conditions]  
**Required Remediation**: [List actions with owners and due dates]

## 6. Remediation Tracker

| Item ID | Failed Rule | Action | Owner | Due Date | Status |
|---------|-------------|--------|-------|----------|--------|
| RM-001 | [ARC-###] | [Fix action] | [Name] | [Date] | [Open/Done] |

## 7. Automation Hooks (Optional)
- CI job name: [e.g., architecture-compliance]
- Output format: [JSON/SARIF/Markdown]
- Report location: [path]
- Pull request check name: [status check label]

Recommended companion artifacts in this repository:
- `templates/compliance-check-config.template.json`
- `templates/compliance-check-report.schema.json`
- `templates/compliance-check-report.example.json`
- `scripts/evaluate-compliance.ps1`
- `docs/compliance-ci-setup.md`
