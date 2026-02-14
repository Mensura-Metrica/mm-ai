# Compliance CI Setup

This guide wires MM-AI compliance scoring into pull request checks.

A ready-to-use workflow is included at `.github/workflows/compliance-check.yml`.

## 1) Create project-level compliance files

Copy templates into your project repository and customize thresholds/rules:

- `templates/compliance-check-config.template.json` -> `.mm-ai/compliance-check-config.json`
- `templates/compliance-check-report.schema.json` -> `.mm-ai/compliance-check-report.schema.json`

## 2) Produce a compliance report in CI

Your pipeline should generate a JSON file that matches `.mm-ai/compliance-check-report.schema.json`.

Example report path:
- `.mm-ai/out/compliance-report.json`

Minimum required fields:
- `project`
- `assessment_scope`
- `date`
- `rules[]` with `rule_id`, `result`, `weight`, `severity`

## 3) Evaluate and fail PRs when policy is violated

Run the evaluator script:

```powershell
pwsh ./scripts/evaluate-compliance.ps1 `
  -ReportPath ./.mm-ai/out/compliance-report.json `
  -ConfigPath ./.mm-ai/compliance-check-config.json
```

Exit code behavior:
- `0` = pass
- `1` = fail (PR should be blocked)

The included workflow expects these paths:
- `./.mm-ai/compliance-check-config.json`
- `./.mm-ai/out/compliance-report.json`

If your pipeline writes to different locations, update `.github/workflows/compliance-check.yml` accordingly.

## 4) GitHub Actions example

```yaml
name: Compliance Check

on:
  pull_request:
    branches: [ main ]

jobs:
  compliance:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Generate compliance report
        run: |
          mkdir -p .mm-ai/out
          echo '{"project":"sample","assessment_scope":"PR","date":"2026-02-14","rules":[{"rule_id":"ARC-001","result":1,"weight":10,"severity":"Critical"}]}' > .mm-ai/out/compliance-report.json

      - name: Ensure compliance config exists
        run: |
          mkdir -p .mm-ai
          if [ ! -f .mm-ai/compliance-check-config.json ]; then
            cp templates/compliance-check-config.template.json .mm-ai/compliance-check-config.json
          fi

      - name: Evaluate compliance
        shell: pwsh
        run: |
          ./scripts/evaluate-compliance.ps1 -ReportPath ./.mm-ai/out/compliance-report.json -ConfigPath ./.mm-ai/compliance-check-config.json
```

## 5) Recommended policy defaults

- Production merge requires:
  - weighted score >= 90
  - 0 critical failures
  - 0 high failures
  - no blocking conditions

## 6) Operating model

- Run on every PR
- Store report artifact for audit
- Track trend of weighted score over time
- Treat repeated yellow/red results as process debt
