# Agent Index

## Overview
Each phase of the methodology has a specialized LLM agent persona that defines the role, expertise, behavioral guidelines, and output standards for that phase.

## Agents

| Agent | Phase | Role | Key Ability |
|-------|-------|------|-------------|
| [Orchestrator](orchestrator.md) | All | Guides phases, enforces gates | Lifecycle management |
| [Discovery Agent](../01-discovery/discovery-agent.md) | 1 | Facilitates problem exploration | Socratic questioning |
| [Product Owner Agent](../02-product-definition/product-owner-agent.md) | 2 | Defines requirements | Precision requirements |
| [Architect Agent](../03-architecture/architect-agent.md) | 3 | Designs the system | Volatility decomposition |
| [Project Designer Agent](../04-project-design/project-designer-agent.md) | 4 | Plans the project | Architecture-driven scheduling |
| [Developer Agent](../05-implementation/developer-agent.md) | 5 | Builds the system | Contract-first implementation |
| [QA Agent](../06-quality-assurance/qa-agent.md) | 6 | Verifies quality | Architecture-aware testing |
| [DevOps Agent](../07-deployment/devops-agent.md) | 7 | Deploys the system | Controlled release |
| [Maintenance Agent](../08-maintenance/maintenance-agent.md) | 8 | Evolves the system | Volatility-guided evolution |

## How to Use an Agent

### Loading
Provide the agent persona file to the LLM at the start of a phase. The persona establishes:
- The role the LLM should adopt
- What expertise it should draw on
- What behaviors to follow and what to avoid
- What output standards to meet

### Switching
When transitioning between phases:
1. Complete the current phase's quality gate
2. Load the new phase's agent persona
3. Provide the artifacts from previous phases as context
4. The Orchestrator manages this transition

### Agent Consistency
All agents share these common traits:
- They produce **structured, verifiable outputs**
- They **self-check against quality criteria** before presenting results
- They **flag uncertainty** rather than guessing
- They **defer to human judgment** on domain-specific decisions
- They **reference IDesign principles** in architectural discussions
