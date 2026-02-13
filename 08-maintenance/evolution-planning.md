# Evolution Planning

## Purpose
Guide the ongoing evolution of the system while preserving architectural integrity. This is where the IDesign investment pays off — when change arrives, a well-decomposed architecture absorbs it gracefully.

## Agent Persona
[Maintenance Agent](maintenance-agent.md)

## Instructions

### Step 1: Change Classification
When a change request arrives, classify it:

| Type | Description | Architectural Impact |
|------|-------------|---------------------|
| **Bug Fix** | Corrects incorrect behavior | Within a single service (usually) |
| **Enhancement** | Extends existing functionality | Within a service or its interface |
| **New Feature** | Adds new capability | May require new services or interfaces |
| **Refactoring** | Improves structure without changing behavior | Service internals or service boundaries |
| **Infrastructure** | Changes deployment, scaling, or operations | Utilities or operational configuration |

### Step 2: Volatility Validation
Check the original volatility analysis:

- **Was this change predicted?** If the volatility analysis identified this axis of change, the architecture should absorb it within a single service. Verify.
- **Is this a new axis?** If this change cuts across multiple services, it may represent a volatility axis that was missed. Consider updating the volatility analysis.
- **Is the architecture drifting?** If "simple changes" keep requiring modifications to multiple services, the decomposition may be degrading. Time for an architecture review.

### Step 3: Impact Analysis
For the proposed change:

1. **Which services are affected?** List every service that must change
2. **Which interfaces change?** Any contract modifications?
3. **What tests must be updated?** Test impact assessment
4. **What's the dependency cascade?** If service A changes, who depends on A?
5. **Is the taxonomy violated?** Does this change introduce cross-layer concerns?

**Health Check**: If a change affects more than 2-3 services, something is wrong — either the change is too large (break it up) or the architecture isn't encapsulating volatility properly.

### Step 4: Technical Debt Management

Maintain a **Technical Debt Register**:

```
ID: [Unique identifier]
Description: [What the debt is]
Origin: [When and why was it introduced]
Impact: [What's the cost of carrying this debt]
Interest: [How much worse does it get over time]
Payoff Cost: [Estimated effort to resolve]
Priority: [Based on Impact × Interest ÷ Payoff Cost]
```

**Technical Debt Categories:**
- **Architecture debt** — Violations of the taxonomy or call graph rules (highest priority)
- **Design debt** — Poor abstractions, leaky interfaces
- **Code debt** — Duplicated code, poor naming, missing tests
- **Infrastructure debt** — Manual processes, missing monitoring, outdated dependencies

### Step 5: Architecture Compliance Audit
Periodically (every release or quarterly), verify:

- [ ] All services still fit their taxonomy roles
- [ ] No forbidden cross-layer calls have crept in
- [ ] Interfaces are still clean and implementation-agnostic
- [ ] Dependency graph is still a DAG (no cycles)
- [ ] New code follows the established patterns
- [ ] Technical debt is being paid down, not just accumulated

### Step 6: When to Re-Architect
Sometimes, evolution isn't enough. Re-architecture is warranted when:

- The volatility analysis is fundamentally wrong (axes of change don't match services)
- The system has accumulated architecture debt that makes every change painful
- Business requirements have shifted so dramatically that the current structure is a constraint
- Technology platform is at end-of-life

**Re-architecture is not "start over."** It means returning to the Architecture phase (Phase 3) with the current system as input, performing a fresh volatility analysis, and designing a migration path from current to target architecture.

## Inputs
- Change requests (bugs, enhancements, features)
- Production monitoring data
- Architecture documentation (service catalog, call graph, volatility analysis)
- Technical debt register

## Outputs
- **Change Impact Analysis** — For significant changes
- **Technical Debt Register** — Maintained and prioritized
- **Architecture Compliance Report** — Periodic audit results
- **Evolution Roadmap** — Planned improvements and debt payoff

## Quality Criteria
- [ ] Every significant change has an impact analysis
- [ ] Volatility validation is performed for new kinds of change
- [ ] Technical debt is tracked, not ignored
- [ ] Architecture compliance is audited periodically
- [ ] Re-architecture triggers are monitored
