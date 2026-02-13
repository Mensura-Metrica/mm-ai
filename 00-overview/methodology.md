# Methodology Overview

## The Problem This Solves

Software projects fail at predictable points:
- **Bad architecture** — The system's structure doesn't match how it needs to change
- **Bad project design** — The schedule doesn't match the architecture's dependency graph
- **Bad requirements** — Building the wrong thing, or building the right thing badly
- **Quality as afterthought** — Testing bolted on at the end instead of designed in from the start

This methodology addresses all four failure modes by applying **IDesign principles** through **LLM-guided phases** with **quality gates** at every transition.

## Core Concepts

### Volatility-Based Decomposition
Traditional decomposition breaks systems along functional lines (OrderService, CustomerService, PaymentService). This creates **fragile architectures** because business functions cut across multiple axes of change.

IDesign decomposes along **axes of volatility** — the things most likely to change independently:
- What changes together, lives together
- What changes independently, is separated
- Services encapsulate volatility, not functionality

### The Service Taxonomy
Every service in an IDesign architecture falls into one of these categories:

| Layer | Role | Depends On | Example |
|-------|------|-----------|---------|
| **Client** | UI / API consumer | Managers | Web app, mobile app, API gateway |
| **Manager** | Workflow orchestration | Engines, Resource Accessors | OrderManager, CheckoutManager |
| **Engine** | Business logic (stateless, pure) | Utilities | PricingEngine, ValidationEngine |
| **Resource Accessor** | Data access abstraction | Utilities | CustomerAccessor, InventoryAccessor |
| **Utility** | Cross-cutting concerns | Nothing | LoggingUtility, ConfigUtility |

**Rules:**
- Managers never call other Managers
- Engines never call Resource Accessors (and vice versa)
- Resource Accessors never call Engines
- Utilities are called by anyone but call no one (except other Utilities)
- Every service interaction is through a **contract (interface)**

### Project Design as Architecture
IDesign treats the **project plan as a design artifact**. The architecture's dependency graph directly determines:
- What can be built in parallel
- What must be built sequentially
- Where the critical path lies
- What the real schedule pressure points are

### Quality Gates
Each phase transition requires passing a quality gate — a checklist of specific, verifiable criteria. No phase is entered until the previous gate passes. This prevents the cascade of problems that comes from building on a shaky foundation.

## Phase Flow

```
Discovery → Product Definition → Architecture → Project Design → Implementation → QA → Deployment → Maintenance
    │              │                  │              │               │            │         │           │
    └── Gate 1 ────└── Gate 2 ────────└── Gate 3 ───└── Gate 4 ─────└── Gate 5 ──└─ Gate 6─└── Gate 7──┘
```

Each phase produces specific artifacts that feed the next phase. The gates ensure those artifacts meet quality standards before proceeding.

## How the LLM Agents Work

Each phase has a specialized **agent persona** — an LLM instruction set that gives the AI:
- A specific **role and expertise** (e.g., Architect, QA Lead)
- **Behavioral guidelines** (e.g., "Challenge assumptions, don't just agree")
- **Phase-specific instructions** (what to produce, how to validate it)
- **Quality criteria** to self-check against

The **Orchestrator** agent manages transitions between phases and enforces quality gates.

## What This Is Not

- **Not a code generator** — This guides *thinking* and *decisions*, not just output
- **Not a rigid waterfall** — Phases can iterate, but gates must still pass
- **Not framework-specific** — The principles apply regardless of tech stack
- **Not a replacement for human judgment** — The human validates all critical decisions
