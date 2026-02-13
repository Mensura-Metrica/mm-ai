# MM-AI: IDesign-Driven Software Development Methodology

LLM-guided methodology for taking software products from inception through completion, grounded in **IDesign principles** (Juval Löwy / *Righting Software*).

## What This Is

A **template repo** for new projects + **VS Code prompt files** that guide you through 8 phases:

1. **Discovery** — Problem framing, feasibility
2. **Product Definition** — Requirements, user stories, volatility tagging
3. **Architecture** — IDesign volatility decomposition (the heart of it)
4. **Project Design** — Architecture-driven scheduling & risk
5. **Implementation** — Contract-first, bottom-up development
6. **Quality Assurance** — Architecture-aligned testing
7. **Deployment** — Architecture-ordered release
8. **Maintenance** — Volatility-driven evolution

## Setup

**The prompt files live at user-level** (not in this repo). Install once:

```powershell
# Copy prompts and instructions to VS Code user directory
Copy-Item "<mm-ai-clone>\user-level\instructions\*" "$env:APPDATA\Code\User\instructions\" -Recurse
Copy-Item "<mm-ai-clone>\user-level\prompts\*" "$env:APPDATA\Code\User\prompts\" -Recurse
```

Then in any project: **Agent Mode → `/` → pick a phase**.

## Using the Template

Click **"Use this template"** on GitHub to start a new project. You get:
- `templates/` — Document templates (product brief, PRD, architecture doc, project plan, test plan, user stories)
- `methodology-reference.md` — Deep reference for all 8 phases and IDesign concepts
- This README

## Key Principles

1. **Volatility drives decomposition** — services encapsulate axes of change, not business functions
2. **Architecture is not optional** — every system gets a proper volatility analysis
3. **Quality is designed in, not tested in** — gates prevent phase transitions until criteria met
4. **The LLM is a tool, not the architect** — human judgment validates all decisions

## Influenced By

- **IDesign Method** — Juval Löwy, *Righting Software*
