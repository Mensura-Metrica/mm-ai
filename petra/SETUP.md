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

## Troubleshooting

| Issue | Solution |
|-------|----------|
| LLM not following method | Re-paste persona prompt |
| Artefacts not matching | Adapt templates in `artefacts/templates/` |
| Need more detail | Extend phase iterations |
| Tool integration issues | Adapt PM tool templates manually |