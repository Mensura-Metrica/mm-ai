# Standards Traceability Matrix Template

Use this matrix to connect adopted standards to implementation evidence and CI checks.

## Project Context
- Project: [Name]
- Version: [Version]
- Date: [Date]
- Owner: [Architect/Lead]

## Matrix

| Standard ID | Standard Statement | Level (Mandatory/Advisory) | Phase Gate(s) | Evidence Artifact | CI Rule ID | Status |
|-------------|--------------------|-----------------------------|---------------|-------------------|-----------|--------|
| STD-ARC-001 | Volatility-based decomposition required | Mandatory | Gate 3 | Architecture document | ARC-001 | [Pass/Fail] |
| STD-TAX-001 | No forbidden layer calls | Mandatory | Gate 3, Gate 5 | Dependency analysis report | ARC-001 | [Pass/Fail] |
| STD-API-001 | Explicit operation contracts and error taxonomy | Mandatory | Gate 3, Gate 5 | Interface specification | ARC-004 | [Pass/Fail] |
| STD-IMP-001 | Build order follows dependency graph | Mandatory | Gate 4, Gate 5 | Project plan + commit history | [Rule ID] | [Pass/Fail] |
| STD-TST-001 | Must requirements trace to tests | Mandatory | Gate 6 | Traceability matrix | REQ-001 | [Pass/Fail] |

## Exceptions

| Exception ID | Standard ID | Reason | Risk | Approved By | Expiry |
|--------------|-------------|--------|------|-------------|--------|
| EX-001 | [STD-###] | [Reason] | [Low/Med/High] | [Name] | [Date] |
