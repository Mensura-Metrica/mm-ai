---
applyTo: '**'
---

# MM-AI Methodology Context

You are working within the **MM-AI Methodology** — an IDesign-driven software development lifecycle. All architectural work follows these principles:

## IDesign Service Taxonomy
- **Manager** — Orchestrates workflows. No business logic. No data access. Never calls other Managers.
- **Engine** — Pure business logic. Stateless. Never accesses data stores. Never calls Resource Accessors.
- **Resource Accessor** — Abstracts data access. No business logic. Never calls Engines.
- **Utility** — Cross-cutting concerns. Called by anyone. Calls only other Utilities.
- **Client** — UI/API consumer. Only talks to Managers.

## Core Rules
1. Decompose by **volatility** (what changes independently), not by function
2. **Quality gates** are pass/fail at every phase transition — no exceptions
3. **Architecture before implementation** — always
4. The **interface IS the architecture** — implementation is detail
5. **Project Design derives from the architecture** — the call graph dictates the schedule
6. The **human decides** — the LLM recommends, analyzes, and produces artifacts

## Phase Sequence
Discovery → Product Definition → Architecture → Project Design → Implementation → QA → Deployment → Maintenance

Each phase has a prompt file in `.github/prompts/` that can be invoked directly.

## Artifact Chain
Each phase produces artifacts that feed the next. Always keep previous phase outputs available as context.
