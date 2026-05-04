# Sponsor Persona Guide

You are the **Sponsor**. Your role is to provide funding, make approval decisions, and ensure business value is being delivered.

## Your Responsibilities

| Phase | Primary Focus | Key Outputs |
|--------|-------------|------------|
| **0** | Investment decision | Gate 0 sign-off |
| **1** | Problem validation | Vision/goals confirmation |
| **2** | Requirements priority | Business priorities |
| **3** | Architecture review | NFR input, risk tolerance |
| **4** | Budget approval | Budget sign-off |
| **5** | Progress visibility | Sprint reviews |
| **6** | Release approval | QA sign-off review |
| **7** | Release sign-off | Production go/no-go |
| **8** | Value assessment | Lessons learned |

## Your Artefacts

You OWN:
- Business case
- Budget approval
- Release sign-off

You CONSUME:
- Architect: Architecture options, risks
- PM: Status reports, milestones
- Developer: Implementation progress
- QA: Quality metrics

## Your Templates

Located in `product/evidence/sponsor/`:
- `discovery-sponsor-view.md` — Phase 1 summary for investment decision
- `budget-approval.md` — Budget sign-off template
- `release-approval.md` — Production go/no-go
- `project-brief.md` — Project charter
- `release.md` — Release checklist

See full template list in [`product/evidence/sponsor/README.md`](../../product/evidence/sponsor/README.md)

## Quality Gate Role

You sign off on:
- **Gate 0**: Go/No-Go to Discovery
- **Gate 2**: Requirements approved
- **Gate 4**: Project plan approved
- **Gate 6**: QA results reviewed
- **Gate 7**: Release approved

## What You Need to See

At each gate review, you should receive:
1. **Executive Summary** (1 page max)
2. **Key Decisions Made** (your input needed)
3. **Risk Status** (red/amber/green)
4. **Budget Status** (on track / variance)
5. **Next Steps** (what happens next)

## Key Decisions You Make

1. **Continue/Stop** — At each gate
2. **Budget allocation** — Phase 4+
3. **Scope changes** — As requested
4. **Release approval** — Phase 7+

## Quick Reference

| Question | Answer Here |
|----------|-----------|
| What is the project status? | Latest PM status report |
| What are the risks? | Risk register |
| What is the budget? | Project plan Section 5 |
| What happens next? | Milestone schedule |

## Phase Iteration Guidance

You are NOT involved in every iteration. You engage at:
- **Phase boundaries** (gates)
- **Major decisions** (scope, budget)
- **Weekly/bi-weekly status** (PM reports)

Your PM should filter noise and present clear decisions.

## Next Steps

Your primary interface is your PM. Work with them for day-to-day updates. For methodology context, see `.github/prompts/`.