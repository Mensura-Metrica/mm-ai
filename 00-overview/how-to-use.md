# How to Use This Methodology

## Quick Start — VS Code Agent Mode (Recommended)

This workspace includes **VS Code prompt files** that integrate directly into Copilot's prompt picker. No manual copy-pasting needed.

### How It Works
- **Auto-loaded context**: `.github/instructions/mm-ai.instructions.md` provides IDesign methodology context automatically in every Copilot conversation.
- **Phase prompts**: `.github/prompts/phase-*.prompt.md` files appear in VS Code's prompt picker — select the phase you need.

### Starting a New Project
1. Open VS Code with this workspace folder on your search path
2. Start an **Agent Mode** chat session
3. Type `/` and pick `phase-1-discovery` from the prompt list
4. Work through the phase interactively
5. When the gate checklist passes, pick the next phase prompt

### Resuming Work
1. Open Agent Mode, pick your current phase prompt
2. Provide any existing artifacts as context
3. Continue from where you left off

### Phase Prompt Files
| Prompt | Purpose |
|--------|---------|
| `phase-1-discovery` | Explore problem space, validate feasibility |
| `phase-2-product-definition` | Requirements, user stories, volatility tagging |
| `phase-3-architecture` | IDesign volatility decomposition |
| `phase-4-project-design` | Architecture-driven scheduling & risk |
| `phase-5-implementation` | Contract-first development |
| `phase-6-quality-assurance` | Architecture-aligned testing |
| `phase-7-deployment` | Architecture-ordered release |
| `phase-8-maintenance` | Evolution & change classification |

---

## Alternative: Manual Prompt Loading

The `prompts/` folder also contains **combined prompt files** for use with any LLM (not just VS Code).

1. Load `prompts/system-prompt.md` into your LLM
2. Load the phase file (e.g., `prompts/phase-1-discovery.md`)
3. Work through the phase, check the gate, advance

## Reference Material

The full source material lives in the phase folders (`01-discovery/`, `02-product-definition/`, etc.) with more detailed guidance, and in `agents/` for the orchestrator.

### Key Decisions That Require Human Judgment
- Validation of volatility axes (only you know your business domain)
- Final approval on architecture decomposition
- Schedule and resource allocation trade-offs
- Risk acceptance decisions
- Scope negotiations

## For LLMs

### Loading a Phase
When working with a phase, load these files in order:
1. The **agent persona** (e.g., `03-architecture/architect-agent.md`)
2. The **phase instructions** (e.g., `03-architecture/volatility-analysis.md`)
3. Any **inputs from previous phases** (e.g., the PRD from Phase 2)
4. Relevant **templates** (e.g., `templates/architecture-document-template.md`)

### Maintaining Context
- Each phase file specifies its **Inputs** (what it needs) and **Outputs** (what it produces)
- Outputs from one phase become inputs to the next
- The Orchestrator manages the dependency chain between phases
- All artifacts should be kept in the project workspace for reference

### Quality Self-Check
Before presenting outputs to the human, the LLM should:
1. Review the gate checklist for the current phase
2. Verify each criterion is met
3. Flag any criteria that cannot be verified without human input
4. Present both the outputs and the gate compliance status

## Document Conventions

### Phase Document Structure
Every phase document follows this structure:
- **Purpose** — Why this phase exists
- **Agent Persona** — Link to the specialized LLM instructions
- **Instructions** — Step-by-step guidance for the LLM
- **Inputs** — What artifacts are required from previous phases
- **Outputs** — What artifacts this phase produces
- **Quality Criteria** — How to validate the outputs

### Gate Checklist Format
Every gate checklist uses this format:
```markdown
- [ ] Criterion description — *How to verify*
```
All items must be checked before the gate passes. No exceptions.
