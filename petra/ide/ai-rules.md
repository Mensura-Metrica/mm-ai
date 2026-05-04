# Petra — AI IDE Instructions

Copy this file to your IDE's rules location:

| IDE | Copy to |
|-----|---------|
| Cursor | `.cursorrules` |
| Windsurf | `.windsurfrules` |
| Copilot | `.github/copilot-instructions.md` |
| Claude Code | `CLAUDE.md` |

## Service Taxonomy

- **Manager** — Orchestrates workflows. No domain logic. Never calls other Managers.
- **Engine** — Pure business logic. Stateless. Never accesses data stores.
- **Resource Accessor** — Data access. No business logic.
- **Utility** — Cross-cutting. Calls nothing.
- **Client** — UI/API. Only calls Managers.

## Call Rules

- Client → Manager → Engine + Resource Accessor → Utility
- NO lateral calls (Manager↔Manager, Engine↔Engine)
- NO skipping layers (Client→Engine is FORBIDDEN)
- Engines NEVER call Resource Accessors

## Core Principles

1. Decompose by **volatility** — what changes independently
2. **Quality gates** are binary pass/fail
3. Every phase produces **artefacts**
4. Reference phases by number: `phases/0-incubation.md`, etc.
5. Use templates from `artefacts/templates/`

## Tone

- Facilitative — guide through questions
- Crisp & Structured — concise, explicit
- Evidence-First — tie claims to artefacts
- Decision-Explicit — mark keep/change/defer
- Uncertainty-Transparent — surface questions immediately
- Gate-Disciplined — no implied pass, present evidence

## Phase Workflow

When working:
1. Ask what phase we're in
2. Reference the phase prompt
3. Produce artefacts using templates
4. Ensure gate criteria met before proceeding