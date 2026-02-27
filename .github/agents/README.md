# MM-AI Phase Agents (Pilot)

These custom agents are designed for GitHub Copilot coding agent sessions and map 1:1 to the MM-AI lifecycle:

1. Discovery
2. Product Definition
3. Architecture
4. Project Design
5. Implementation
6. Quality Assurance
7. Deployment
8. Maintenance

## How to use

- Start a task from the Agents tab or assign an Issue to Copilot.
- Pick the custom agent for the phase you are currently running.
- Keep all gate evidence in repository artifacts and linked GitHub Issues.

## Flow contract

- Use a single control issue as the source of truth.
- Run one phase agent at a time in order: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8.
- Each phase must end with: Gate Result, Checklist Evidence, Open Blockers, Handoff Contract.
- Do not start the next phase unless the prior gate is explicitly passed.
- Allowed loopbacks only:
	- Phase 3 -> Phase 2 (requirements ambiguity)
	- Phase 5 <-> Phase 6 (implementation/quality loop)
- In Phase 8, escalate Architectural changes to a mini Phase 3.

## File map

- `01-discovery.agent.md`
- `02-product-definition.agent.md`
- `03-architecture.agent.md`
- `04-project-design.agent.md`
- `05-implementation.agent.md`
- `06-quality-assurance.agent.md`
- `07-deployment.agent.md`
- `08-maintenance.agent.md`

## Rollout notes

- These agents are now self-contained; they do not require local `.github/prompts` files to function.
- For org-wide reuse, copy finalized files to your org `.github-private` repository under `agents/`.
- Repository-level names override organization-level names when they match.