# Quality Philosophy

## Quality Is Designed In, Not Tested In

Testing finds defects. Architecture prevents them. This methodology treats quality as a **design concern** that begins at the earliest phase and is enforced at every transition.

## The Cost of Defects

The further a defect travels from its point of introduction, the more expensive it is to fix:

| Introduced In | Found In | Relative Cost |
|--------------|----------|---------------|
| Requirements | Requirements | 1x |
| Requirements | Architecture | 3x |
| Requirements | Implementation | 5-10x |
| Requirements | QA | 10-15x |
| Requirements | Production | 30-100x |
| Architecture | Architecture | 1x |
| Architecture | Implementation | 3-5x |
| Architecture | Production | 25-50x |

**Quality gates exist to catch defects at the cheapest possible point.**

## Quality Dimensions

Every artifact is evaluated against relevant quality dimensions:

### Architectural Quality
- **Volatility alignment** — Does the decomposition match actual axes of change?
- **Taxonomy compliance** — Does every service fit cleanly into the IDesign taxonomy?
- **Dependency discipline** — Are the call chain rules honored? (No Manager-to-Manager, no Engine-to-ResourceAccessor)
- **Contract completeness** — Is every service interaction defined through an interface?
- **Cohesion** — Does each service have a single, clear reason to exist?
- **Coupling** — Are services independent enough to change/deploy/test independently?

### Requirements Quality
- **Completeness** — Are all use cases covered?
- **Consistency** — Do requirements contradict each other?
- **Testability** — Can each requirement be verified?
- **Volatility awareness** — Are likely areas of change identified?

### Implementation Quality
- **Contract fidelity** — Does the implementation honor the interface contracts?
- **Error handling** — Are failure modes explicitly handled?
- **Testability** — Is the code structured for automated testing?
- **Readability** — Can another developer understand the code without the author?

### Project Design Quality
- **Architecture alignment** — Does the schedule reflect the dependency graph?
- **Risk identification** — Are technical and schedule risks explicitly called out?
- **Resource feasibility** — Can the team actually execute this plan?
- **Buffer adequacy** — Is there slack for the inevitable surprises?

## Gate Enforcement

Quality gates are **binary pass/fail**. There is no "partial pass" or "pass with exceptions."

- Each gate has a specific checklist of criteria
- Every criterion must be met
- If a gate fails, the team returns to the current phase to address gaps
- The Orchestrator enforces gate compliance before allowing phase transition

## Anti-Patterns to Reject

1. **"We'll refactor later"** — If the architecture is wrong, fix it now. Later never comes.
2. **"It works, ship it"** — Working code with bad architecture is technical debt with interest.
3. **"Tests will catch it"** — Tests validate behavior, not architecture. Bad architecture passes tests.
4. **"The deadline requires shortcuts"** — Shortcuts in architecture create longer timelines, not shorter ones.
5. **"We can't afford quality"** — You can't afford the cost of *not* having quality. It's always more expensive.
