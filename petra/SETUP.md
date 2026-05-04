# Petra Setup Guide

## Overview

Petra lives in your project repository at `petra/`. It integrates with your existing tools.

## Step 1: Complete Intake

1. Open `petra/intake/intake-form.md`
2. Answer all questions for your project
3. This defines your project context

## Step 2: Configure Your LLM

Copy the relevant persona prompt to your LLM context:

| Persona | Copy From |
|---------|-----------|
| Architect | `petra/personas/architect.md` |
| Developer | `petra/personas/developer.md` |
| PM | `petra/personas/pm.md` |
| QA | `petra/personas/qa.md` |
| Sponsor | `petra/personas/sponsor.md` |

**Tip:** Save as a custom instruction in your LLM for persistent context.

## Step 3: IDE Integration

Copy `petra/ide/ai-rules.md` to your IDE's rules file:

| IDE | Filename |
|-----|----------|
| Cursor | `.cursorrules` |
| Windsurf | `.windsurfrules` |
| Claude Code | `CLAUDE.md` |
| Copilot | `.github/copilot-instructions.md` |
| Other | Add to AI assistant instructions |

## Step 4: PM Tool Integration

Choose your tool:

- **Jira**: Import from `petra/pm-tools/jira-templates.md`
- **Azure DevOps**: Import from `petra/pm-tools/azure-devops.md`
- **Linear**: Import from `petra/pm-tools/linear.md`

Or adapt templates to your tool's format.

## Step 5: Begin Phase 0

Start at `petra/phases/0-incubation.md`.

Follow the phase workflow. Produce artefacts using templates in `petra/artefacts/templates/`.

## Gate Review

After each phase:
1. Review gate checklist in the phase prompt
2. Ensure all criteria met
3. Get explicit sign-off
4. Proceed to next phase

## Tips

- **Start fresh**: Use Petra from project inception
- **Brownfield**: Adapt intake to existing context
- **Solo**: Play all personas yourself
- **Team**: Assign personas to team members

## Team Workflow

### Role Assignment

| Phase | Lead | Participants |
|-------|------|--------------|
| 0-1 | Sponsor | PM, Architect |
| 2 | PM | Sponsor, Architect |
| 3 | Architect | Developer, PM |
| 4 | PM | Sponsor, Architect |
| 5 | Lead Developer | Architect, QA |
| 6 | QA | Lead Developer |
| 7 | DevOps / Architect | Lead Developer |
| 8 | PM | Sponsor, Developer |

### Team Rituals

- **Weekly sync**: Phase status + blocker review (15 min)
- **Phase handoff**: Artifacts reviewed, sign-off recorded
- **Gate review**: Automated pass + manual checklist (async or scheduled)
- **Retrospective**: Post-phase lessons captured in `docs/retrospectives/`

### Scaling Options

| Team Size | Approach |
|-----------|----------|
| 2-5 | All roles assigned, daily sync |
| 5-10 | Phase leads + dedicated PM/Architect |
| 10+ | Feature teams with phase guardians |

**Phase guardian**: One person ensures phase artifacts meet gate criteria before advancing. Rotates each phase.

## Fast Track (Solo/Small Projects)

For projects under 2 weeks or solo builders, skip the heavy process:

| Skip | Use Instead |
|------|-------------|
| Phase 0-1 Socratic loops | 1-paragraph problem statement |
| Phase 2 detailed PRD | Requirements in issue tracker |
| Phase 3 full architecture doc | 1-page architecture notes |
| Phase 4 detailed project plan | Sprint board with tasks |
| Full gate checklists | CI pass = gate pass |

**Minimal path**: Intake → Architecture → Build → Deploy

## Gate Automation

Manual gate checklists don't scale. Automate where possible:

| Gate Item | Automation |
|-----------|------------|
| Tests pass | CI pipeline |
| Code lint/format | Pre-commit hooks |
| Coverage >80% | Coverage report in CI |
| No layer violations | Architecture lint rule |
| No lateral calls | Static analysis |
| PR reviewed | GitHub/GitLab protected branch |

**Gate = CI pass** for automated items. Manual review only for:
- Architectural decisions
- Trade-off documentation
- Stakeholder sign-offs

## Troubleshooting

| Issue | Solution |
|-------|----------|
| LLM not following method | Re-paste persona prompt |
| Artefacts not matching | Adapt templates in `artefacts/templates/` |
| Need more detail | Extend phase iterations |
| Tool integration issues | Adapt PM tool templates manually |