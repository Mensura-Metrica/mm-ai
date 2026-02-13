# Sprint Planning

## Purpose
Break the project schedule into manageable iterations (sprints) and plan each sprint's work to deliver incremental, integrated, working software.

## Agent Persona
[Developer Agent](developer-agent.md)

## Instructions

### Step 1: Sprint Strategy
Determine the sprint structure:

- **Sprint duration** — Typically 1-2 weeks (shorter for higher uncertainty)
- **Sprint goal** — Each sprint should have a clear, demonstrable outcome
- **Build order** — Follow the architecture's dependency graph:
  1. **Sprint 0**: Utilities + development infrastructure (CI/CD, testing framework)
  2. **Early sprints**: Engines and Resource Accessors (independent, parallelizable)
  3. **Middle sprints**: Managers + integration (wire the services together)
  4. **Later sprints**: Client layer + end-to-end workflows
  5. **Final sprints**: Polish, performance, edge cases

### Step 2: Sprint Composition
For each sprint, select activities from the project schedule that:

1. **Have all dependencies met** — No starting work that's blocked
2. **Fit within the sprint capacity** — Account for overhead (meetings, reviews, support)
3. **Form a coherent goal** — The sprint delivers something meaningful, not random fragments
4. **Include integration work** — Don't just build services; wire them together each sprint
5. **Include testing** — Tests are not separate sprints; they're part of every sprint

### Step 3: Implementation Approach Per Service Type

**Implementing Utilities (First)**
1. Define the interface
2. Implement core functionality
3. Write unit tests
4. Document usage patterns
5. Make available to all other service tracks

**Implementing Engines**
1. Review the interface contract
2. Implement the pure logic (no side effects, no data access)
3. Write unit tests (should be straightforward — no mocking needed for pure logic)
4. Validate against acceptance criteria from the PRD

**Implementing Resource Accessors**
1. Review the interface contract
2. Implement the data access logic
3. Write integration tests with the actual data source (or a realistic test instance)
4. Verify the abstraction — could you swap the data source without changing the interface?

**Implementing Managers**
1. Review the interface contract and the use case workflow
2. Start with stubs for Engines and Resource Accessors (if not yet available)
3. Implement the orchestration logic
4. Replace stubs with real service calls as services become available
5. Write integration tests for the complete workflow

**Implementing Clients**
1. Review the Manager interfaces (Clients only talk to Managers)
2. Implement the UI/API layer
3. Test end-to-end workflows
4. Validate against user stories and acceptance criteria

### Step 4: Definition of Done
Every activity is complete when:

- [ ] Implementation matches the interface contract
- [ ] All acceptance criteria from the PRD are met
- [ ] Unit tests pass (90%+ coverage for business logic)
- [ ] Integration tests pass (where applicable)
- [ ] Code review is completed
- [ ] No compiler warnings or linting errors
- [ ] Documentation is updated
- [ ] Committed to version control with meaningful commit message

### Step 5: Sprint Tracking
During each sprint, track:
- **Velocity** — How much work is actually completed vs. planned
- **Blockers** — What's preventing progress (resolve aggressively)
- **Risks** — Any risk triggers materializing? Update the risk register
- **Architecture compliance** — Is the implementation honoring the architecture?

## Inputs
- Project Schedule with activity assignments (from Phase 4)
- Service Catalog and Call Graph (from Phase 3)
- Interface Specifications (from Phase 3)
- PRD with acceptance criteria (from Phase 2)

## Outputs
- **Sprint Plans** — Ordered list of sprints with goals and activities
- **Definition of Done** — Clear completion criteria
- **Sprint Progress Reports** — Velocity, blockers, risks per sprint
- **Working Software Increments** — Deliverable at each sprint's end

## Quality Criteria
- [ ] Sprint order respects architectural dependencies
- [ ] Every sprint has a clear, demonstrable goal
- [ ] Testing is included in every sprint (not deferred)
- [ ] Integration work is included throughout (not a "big bang" at the end)
- [ ] Definition of Done is applied to every completed activity
