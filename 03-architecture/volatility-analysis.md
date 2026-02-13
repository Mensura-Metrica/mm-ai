# Volatility Analysis

## Purpose
Identify the axes of change in the system — the things most likely to change independently — and use them as the foundation for service decomposition. This is the **most critical step** in the entire methodology. Get this right, and everything else follows. Get this wrong, and no amount of clean code will save you.

## Agent Persona
[Architect Agent](architect-agent.md)

## Instructions

### Step 1: Identify Candidate Volatilities
Review the PRD and volatility tags from Phase 2. For each area of the system, ask:

**Business Volatility**
- What business rules are likely to change?
- What policies are driven by regulation that may evolve?
- What pricing/billing models might change?
- What workflows might be added, modified, or removed?

**Technology Volatility**
- What data sources might change? (APIs, databases, file formats)
- What communication protocols might evolve?
- What UI technologies might change?
- What infrastructure might change? (cloud provider, deployment model)

**Domain Volatility**
- What domain concepts are still being defined?
- What domain logic varies by geography, customer segment, or time?
- What business processes are being actively optimized?

**Integration Volatility**
- What external systems do we depend on?
- What external systems might be swapped? (payment providers, CRM, etc.)
- What APIs might change versions or providers?

### Step 2: Validate Volatilities
For each candidate volatility, assess:

| Question | Purpose |
|----------|---------|
| Has this actually changed in the past? | Historical evidence |
| Is there pressure for this to change soon? | Near-term relevance |
| Would this change independently of other things? | Independence test |
| If this changed, how many other things would be affected? | Impact assessment |
| How frequently might this change? | Cadence estimation |

**Discard** volatilities that are purely hypothetical with no evidence or pressure.
**Combine** volatilities that always change together (they're really one axis).
**Split** volatilities that appear as one thing but actually change independently.

### Step 3: Rank Volatilities
Rank each validated volatility axis by:
- **Likelihood of change** (Low / Medium / High)
- **Frequency of change** (Rare / Occasional / Frequent)
- **Impact of change** (Localized / Moderate / Systemic)
- **Independence** (Changes alone / Sometimes co-changes / Always co-changes)

The highest-ranked volatilities become the primary drivers for service decomposition.

### Step 4: Map Volatilities to Services
Each significant volatility axis should be encapsulated by exactly one service (or a small cluster of closely-related services). The principle:

> **When this axis changes, only this service (and its internals) should need to change.**

This is the input to the [Service Decomposition](service-decomposition.md) step.

### Step 5: Document the Analysis
For each volatility axis:
```
Axis: [Name]
Description: [What changes and why]
Evidence: [Historical changes, stakeholder input, regulatory trends]
Likelihood: [Low/Medium/High]
Frequency: [Rare/Occasional/Frequent]
Impact: [Localized/Moderate/Systemic]
Encapsulating Service: [Which service will own this volatility]
```

## Inputs
- Product Requirements Document (from Phase 2)
- Volatility Tags on requirements (from Phase 2)
- Volatility Signals (from Phase 1)
- Domain expertise (stakeholder access)

## Outputs
- **Volatility Matrix** — All identified axes with rankings
- **Volatility-to-Service Mapping** — Which service encapsulates which volatility
- **Rejected Volatilities** — Candidates that were considered and discarded, with reasoning

## Quality Criteria
- [ ] At least 5 volatility axes identified (most systems have 8-15)
- [ ] Each volatility has evidence (not just gut feeling)
- [ ] Each volatility has been validated with the independence test
- [ ] Volatilities that always co-change are merged
- [ ] Every high-likelihood volatility maps to a service
- [ ] No service encapsulates more than 2-3 volatility axes
