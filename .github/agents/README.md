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