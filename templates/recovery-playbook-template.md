# Recovery Playbook Template

Use this when execution quality degrades, drift is detected, or delivery is blocked.

## Incident Metadata
- Incident ID: [ID]
- Date/Time Opened: [Timestamp]
- Opened By: [Role/Name]
- Affected Phase/Step: [Phase/Step]
- Severity: [Critical/High/Medium/Low]

## 1) Diagnosis
- Symptom summary: [What failed]
- Detection method: [How discovered]
- Scope of impact: [Artifacts/code/schedule/risk]
- Initial root cause hypothesis: [Hypothesis]

## 2) Failure Classification
- Type: [Process Drift / Architecture Violation / Contract Mismatch / Tooling Failure / Data Defect / Other]
- Containment status: [Contained/Uncontained]

## 3) Decision: Salvage or Rollback
- Option A (Salvage): [plan + risks]
- Option B (Rollback): [plan + risks]
- Recommended option: [A/B]
- Architect decision: [Approved option]

## 4) Recovery Execution Plan

| Action ID | Action | Owner | Due | Success Criterion | Status |
|-----------|--------|-------|-----|-------------------|--------|
| RC-001 | [action] | [name] | [date] | [objective condition] | [Open/Done] |

## 5) Verification
- Post-recovery checks run: [list]
- Standards/gate re-validation complete: [yes/no]
- Residual risks: [list]

## 6) Post-Mortem Learning
- Root cause confirmed: [final cause]
- What guardrail failed: [control gap]
- Preventive improvement: [change to process/tooling]
- Update required in templates/prompts: [yes/no + details]

## Closure
- Closed By: [Role/Name]
- Date/Time Closed: [Timestamp]
- Linked evidence artifacts: [paths]
