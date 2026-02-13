# Architecture Review

## Purpose
Validate the architecture before committing to implementation. This is the most important review in the entire project — architectural mistakes are the most expensive to fix.

## Instructions

### Review 1: Volatility Alignment Review
Verify that the architecture actually encapsulates the identified volatilities:

For each volatility axis:
1. Which service(s) encapsulate this axis?
2. If this axis changes, how many services are affected?
3. Is the answer "exactly one"? If not, the decomposition is wrong.

**Red Flags:**
- A volatility axis that affects multiple services → missed encapsulation
- A service with no volatility axis → unnecessary service or missed analysis
- A change scenario that requires modifying 3+ services → structural problem

### Review 2: Taxonomy Compliance Review
Verify that every service fits its taxonomy role:

**For Managers:**
- Does it contain business logic? → Extract to Engine
- Does it access data directly? → Extract to Resource Accessor
- Does it call another Manager? → Restructure workflow

**For Engines:**
- Does it access a database or external system? → Extract to Resource Accessor
- Does it maintain state between calls? → Rethink design
- Does it orchestrate workflow? → That's a Manager's job

**For Resource Accessors:**
- Does it contain business rules? → Extract to Engine
- Does it orchestrate multiple operations? → That's a Manager's job
- If the data source changed, would the interface change? → Abstraction is leaking

**For Utilities:**
- Is it domain-specific? → It's probably not a Utility
- Does it depend on Managers, Engines, or Resource Accessors? → Architecture violation

### Review 3: Call Graph Review
Validate all service interactions:

- [ ] No Manager → Manager calls
- [ ] No Engine → Resource Accessor calls
- [ ] No Resource Accessor → Engine calls
- [ ] No bidirectional dependencies
- [ ] No circular dependency chains (A → B → C → A)
- [ ] All calls are through interfaces, not concrete types
- [ ] The call graph forms a proper DAG (Directed Acyclic Graph)

### Review 4: Interface Quality Review
For each interface:
- [ ] Caller has everything it needs from the contract
- [ ] Implementation details are hidden
- [ ] Error conditions are explicit
- [ ] Interface could survive an implementation swap
- [ ] Interface is testable with simple mocks

### Review 5: Non-Functional Architecture Review
- [ ] Performance-critical paths are identified
- [ ] Scalability strategy is defined (horizontal, vertical, partitioning)
- [ ] Failure modes are identified with recovery strategies
- [ ] Security boundaries are defined
- [ ] Data consistency model is defined (strong, eventual, compensating)
- [ ] Observability is designed (tracing, metrics, logging)

### Review 6: Architecture Decision Records
Verify that key decisions are documented as ADRs:
- Each ADR records: Decision, Context, Options Considered, Rationale, Consequences
- Focus on decisions where the alternatives were non-obvious
- Include decisions and their *rejection rationale* — why you didn't do the other thing

## Inputs
- All architecture outputs: Volatility Matrix, Service Catalog, Call Graph, Interface Specs
- PRD (for cross-reference)

## Outputs
- **Architecture Review Report** — Findings from all six review areas
- **Issues List** — Problems found, ranked by severity
- **Recommendations** — Specific actions to address issues
- **Architecture Decision Records** — Documented key decisions

## Quality Criteria
- [ ] All six review areas are completed
- [ ] Every issue found has a severity rating and recommendation
- [ ] No critical issues remain unresolved
- [ ] ADRs exist for all significant architectural decisions
