# MM-AI: IDesign-Driven Software Development Methodology

An LLM-guided methodology for taking software products from inception through project completion, grounded in **IDesign principles** (Juval Löwy / *Righting Software*) with a relentless focus on quality.

## Philosophy

Most software projects fail not because of bad code, but because of **bad architecture and bad project design**. This methodology addresses root causes:

- **Volatility-based decomposition** over functional decomposition
- **Architecture-first** approach — get the design right before writing code
- **Project Design as a discipline** — not just "we'll figure out the schedule later"
- **Quality gates** at every phase transition — no phase is entered without validation
- **LLM agents as specialized roles** — each phase has a purpose-built agent persona

## Phases

| # | Phase | Purpose | Key IDesign Concept |
|---|-------|---------|-------------------|
| 0 | [Overview](00-overview/methodology.md) | Methodology foundation | Core principles |
| 1 | [Discovery](01-discovery/discovery-session.md) | Ideation & feasibility | Problem framing |
| 2 | [Product Definition](02-product-definition/requirements-gathering.md) | Requirements & PRD | Use case analysis |
| 3 | [Architecture](03-architecture/volatility-analysis.md) | System design | Volatility decomposition, Service taxonomy |
| 4 | [Project Design](04-project-design/activity-breakdown.md) | Planning & scheduling | The Design of the project itself |
| 5 | [Implementation](05-implementation/sprint-planning.md) | Building | Guided by architecture |
| 6 | [Quality Assurance](06-quality-assurance/test-strategy.md) | Verification & validation | Architecture-aligned testing |
| 7 | [Deployment](07-deployment/release-planning.md) | Release | Controlled rollout |
| 8 | [Maintenance](08-maintenance/evolution-planning.md) | Sustain & evolve | Volatility-aware evolution |

## How to Use

1. **Load the system prompt** — Give your LLM [prompts/system-prompt.md](prompts/system-prompt.md)
2. **Load the phase prompt** — Start with [prompts/phase-1-discovery.md](prompts/phase-1-discovery.md)
3. **Work through the phase** — Each prompt has the agent persona, instructions, and gate checklist built in
4. **Pass the gate** — Check all items at the bottom of the prompt before advancing
5. **Load the next phase prompt** — Feed artifacts forward as context
6. **Templates** — Use reusable document templates in [templates/](templates/)
7. **Never skip the architecture phase** — This is the hill we die on

See [How to Use](00-overview/how-to-use.md) for full details.

## Project Structure

```
mm-ai/
├── 00-overview/           # Methodology foundation & principles
├── 01-discovery/          # Ideation, feasibility, problem framing
├── 02-product-definition/ # Requirements, product brief, PRD
├── 03-architecture/       # IDesign volatility analysis, service decomposition
├── 04-project-design/     # Activity breakdown, scheduling, risk
├── 05-implementation/     # Sprint execution, coding standards, reviews
├── 06-quality-assurance/  # Test strategy, execution, validation
├── 07-deployment/         # Release planning, deployment execution
├── 08-maintenance/        # Monitoring, evolution, technical debt
├── agents/                # LLM agent personas and orchestrator
├── prompts/               # Ready-to-use combined phase prompts (start here)
└── templates/             # Reusable document templates
```

## Key Principles

1. **Architecture is not optional** — Every system gets a proper volatility analysis and service decomposition
2. **Quality is designed in, not tested in** — Quality gates prevent phase transitions until criteria are met
3. **Project Design is a first-class discipline** — Scheduling, risk, and cost are architectural concerns
4. **Volatility drives decomposition** — Services encapsulate axes of change, not business functions
5. **The LLM is a tool, not the architect** — Human judgment validates all architectural decisions

## Influenced By

- **IDesign Method** — Juval Löwy, *Righting Software*
- **BMAD Method** — For LLM agent workflow patterns
- **Software engineering fundamentals** — SOLID, separation of concerns, design by contract
