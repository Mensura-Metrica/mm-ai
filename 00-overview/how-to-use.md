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

## Reference Material

The phase folders (`01-discovery/` through `08-maintenance/`) contain deeper reference material — detailed processes, frameworks, and checklists beyond what's in the prompt files. The prompts reference this material when needed.

### Key Decisions That Require Human Judgment
- Validation of volatility axes (only you know your business domain)
- Final approval on architecture decomposition
- Schedule and resource allocation trade-offs
- Risk acceptance decisions
- Scope negotiations

## Reuse

**Template repo**: Use "Use this template" on GitHub to start a new project with the full methodology.

**User-level install**: Copy `.github/instructions/` and `.github/prompts/` to `%APPDATA%\Code\User\` to have the prompts available in every VS Code workspace.
