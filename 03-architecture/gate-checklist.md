# Gate 3: Architecture → Project Design

## Gate Purpose
Verify that the architecture is sound, complete, and ready to drive project planning. This is arguably the most critical gate — bad architecture produces bad projects, no matter how well managed.

## Checklist

### Volatility Analysis
- [ ] At least 5 volatility axes identified — *Most non-trivial systems have 8-15*
- [ ] Each volatility has evidence (not intuition) — *Can you point to historical changes or stakeholder confirmation?*
- [ ] Independence test applied to all volatilities — *Are truly independent axes separated?*
- [ ] Co-changing volatilities are merged — *No artificial separation?*

### Service Decomposition
- [ ] Every service has exactly one taxonomy role — *Manager, Engine, Resource Accessor, or Utility?*
- [ ] Every service encapsulates at least one volatility axis — *No purpose-free services?*
- [ ] No service encapsulates more than 3 axes — *No God services?*
- [ ] Service catalog is complete with names, roles, and responsibilities — *Could a developer understand each service's purpose?*

### Call Graph Compliance
- [ ] No Manager → Manager calls — *Managers orchestrate, not delegate to peers*
- [ ] No Engine → Resource Accessor calls — *Engines are pure logic*
- [ ] No Resource Accessor → Engine calls — *Resource Accessors are pure data access*
- [ ] No circular dependencies — *The graph is a DAG*
- [ ] All interactions are through interfaces — *No concrete dependencies*

### Interface Quality
- [ ] Every service has a defined interface — *No undefined interactions?*
- [ ] Every operation has inputs, outputs, and error conditions — *Contracts are complete?*
- [ ] No interface leaks implementation — *Could you swap the implementation?*
- [ ] Error taxonomy is defined — *How are different failure types handled?*

### Non-Functional Architecture
- [ ] Performance-critical paths identified — *Where is latency most important?*
- [ ] Scalability strategy defined — *How does the system grow?*
- [ ] Security boundaries defined — *Where are trust boundaries?*
- [ ] Data consistency model defined — *Strong, eventual, or compensating?*

### Documentation
- [ ] Architecture Decision Records exist for key decisions — *Why these choices?*
- [ ] Architecture review completed — *All six review areas covered?*
- [ ] No critical review issues remain unresolved — *Blockers addressed?*

## Gate Decision
- **PASS**: All items checked. Proceed to Project Design.
- **FAIL**: Return to Architecture to address gaps.

## Gate Owner
The human architect (or senior technical stakeholder) makes the final gate decision. The LLM agent presents the analysis and flags concerns.
