# MM-AI Methodology Reference

A single-file deep reference for the IDesign-driven SDLC. The `.github/prompts/` files contain everything you need for daily use — this document is for when you need more depth.

---

## Core Concepts

### Volatility-Based Decomposition
Traditional decomposition breaks systems along functional lines (OrderService, CustomerService). This creates fragile architectures. IDesign decomposes along **axes of volatility** — things most likely to change independently:
- What changes together, lives together
- What changes independently, is separated

### The Service Taxonomy

| Layer | Role | Depends On |
|-------|------|-----------|
| **Client** | UI / API consumer | Managers |
| **Manager** | Workflow orchestration (sequencing only, no domain logic, no data access) | Engines, Resource Accessors |
| **Engine** | Business logic (stateless, pure) | Utilities |
| **Resource Accessor** | Data access abstraction | Utilities |
| **Utility** | Cross-cutting concerns | Nothing (or other Utilities) |

**Rules**: Managers never call Managers. Engines never call Resource Accessors. Every interaction through an interface.

### Project Design as Architecture
The architecture's dependency graph directly determines what can be built in parallel, what must be sequential, and where the critical path lies.

### Quality Gates
Binary pass/fail at every phase transition. No exceptions, no "partial pass."

### AI Interaction Auditability
- Log all material AI interactions with: who instructed, what was instructed, where it applied, and when it occurred
- Link interaction records to affected artifacts and GitHub Issues where applicable
- Capture replay evidence so decisions/actions can be reconstructed in sequence
- Require clear, unambiguous log text for forensic traceability
- Treat missing interaction logs as missing gate evidence

Recommended enforcement artifacts:
- `templates/gate-evidence-checklist-template.md` — objective evidence for each gate criterion
- `templates/ai-interaction-log-template.md` — structured audit trail of AI interactions and decisions
- `templates/automated-compliance-rubric-template.md` — weighted compliance scoring and blocker rules
- `docs/idesign-standards-reference.md` — external standards references and adoption checklist
- `docs/adopted-standards.md` and `templates/adopted-standards-checklist-template.md` — enforceable project standards and selected-rule declaration
- `templates/standards-traceability-matrix-template.md` — standards-to-evidence and standards-to-CI-rule mapping
- `docs/strict-orchestration-pack.md` and related templates — optional strict controls for handoffs, execution state transitions, and recovery

### The Cost of Defects

| Introduced In | Found In | Relative Cost |
|--------------|----------|---------------|
| Requirements | Requirements | 1x |
| Requirements | Implementation | 5-10x |
| Requirements | Production | 30-100x |
| Architecture | Production | 25-50x |

---

## Phase 1: Discovery — Deep Reference

### Problem Framing
- What problem? (one sentence) | Who has it? | Current workaround? | Cost of status quo? (quantify) | Why now?

### Discovery Iteration Loop (Why Clarity)
- Run at least 2 discovery cycles before Gate 1
- In each cycle, refine problem statement, urgency, and assumptions using evidence (interviews, analytics, workshops)
- Record what changed and why; explicitly track unresolved unknowns with an owner and next validation step
- Exit only when Why is stable enough to support requirement drafting

### Feasibility Assessment

| Dimension | Key Questions |
|-----------|--------------|
| **Technical** | Proven tech? Integration complexity? Performance limits? Team capability? |
| **Economic** | ROM cost? Expected value? ROI timeline? Opportunity cost? |
| **Organizational** | Executive sponsorship? Team availability? Change readiness? |

Recommendation: **Go / Conditional Go / Pause / No-Go**

### Volatility Signals (feed Phase 3)
What's likely to evolve? What external factors could shift requirements? What assumptions might be wrong?

---

## Phase 2: Product Definition — Deep Reference

### Requirements Refinement Loop (What Clarity)
- Run at least 2 refinement cycles before Gate 2
- Each cycle resolves ambiguity, duplicates, and contradictions across requirements and user stories
- Track deltas (added/changed/removed requirements) and the rationale for each decision
- Maintain an open-questions log with owner and target decision date
- Exit when requirements are coherent, testable, prioritized, and traceable

### Requirements Structure
Each requirement gets: **ID**, **Description**, **Priority** (MoSCoW), **Volatility** (Stable/Volatile/Uncertain), **Acceptance Criteria**

### Use Case Analysis
For each workflow: primary flow, alternative flows, exception flows, pre/post conditions, actors.

### Volatility Tagging
- **Stable** — unlikely to change
- **Volatile** — likely to change (regulation, market, feedback)
- **Uncertain** — not enough info, needs validation

These tags are critical input to architecture.

Optional for prioritization: map tags to risk weighting during architecture analysis (Stable→Low, Volatile→High, Uncertain→Investigate first).

---

## Phase 3: Architecture — Deep Reference

### Volatility Analysis (The Most Critical Step)

**Identify candidate volatilities across four dimensions:**

| Dimension | Questions |
|-----------|-----------|
| **Business** | What rules, policies, pricing models, workflows might change? |
| **Technology** | What data sources, protocols, UI tech, infrastructure might change? |
| **Domain** | What concepts are still being defined? What varies by geography/segment? |
| **Integration** | What external systems might be swapped? What APIs might change versions? |

**Validate each candidate:**
- Has it actually changed before? (historical evidence)
- Is there pressure for change? (near-term relevance)
- Would it change independently? (independence test)
- How many things would be affected? (impact)

**Discard** hypothetical-only. **Combine** always-co-changing. **Split** falsely-grouped.

**Rank** by: Likelihood × Frequency × Impact × Independence

### Service Decomposition

**Manager tests**: Remove all Managers — do Engines and RAs still make sense independently?
**Engine tests**: Can you unit test with no data-source mocking? If not, it's not a true Engine.
**RA tests**: If you swap the database, does the interface stay unchanged?
**Utility tests**: Is this concern domain-agnostic?

### Interface Design
The interface IS the architecture. Define per operation:
- Purpose, Input, Output, Errors, Pre/Post conditions, Idempotency

**Error categories**: Validation | Not Found | Conflict | Authorization | Infrastructure

### Uncertainty Handling (Non-Optional)
- Any architecture uncertainty must be explicitly surfaced as a question to stakeholders
- Track open questions with impact and resolution status (Resolved/Deferred with owner/date)
- Do not pass Phase 3 with unresolved critical questions affecting service boundaries, interfaces, or call graph

### Architecture Visuals (C4)
- Produce **C1 System Context**, **C2 Container**, and **C3 Component** diagrams in Phase 3
- Produce focused **C4 Code** diagrams for high-risk/high-volatility components when code-level design affects architectural decisions
- Ensure naming and relationships are consistent across C4 levels and traceable to volatility axes

### Architecture Review (6 Areas)
1. **Volatility alignment** — each change affects exactly one service?
2. **Taxonomy compliance** — Manager doing logic? Engine touching DB?
3. **Call graph** — no forbidden calls, proper DAG?
4. **Interface quality** — hides implementation, explicit errors?
5. **Non-functional** — performance paths, scalability, failure modes?
6. **ADRs** — key decisions documented with rationale?

---

## Phase 4: Project Design — Deep Reference

### Activity Breakdown
Per service: Interface Definition → Core Implementation → Error Handling → Unit Tests → Integration Stub
Per interaction: Integration Implementation → Integration Testing
System-level: E2E Testing → Non-Functional Validation → Deployment Pipeline

### Estimation
Three-point: Optimistic, Most Likely, Pessimistic
PERT = (O + 4L + P) / 6

### Build Order (from call graph)
Utilities → Resource Accessors → Engines (parallel) → Managers → Clients

### Critical Path
Longest dependency chain = minimum project duration. Shorten only by: reducing scope, adding parallelism, fast-tracking, or crashing. NOT by ignoring dependencies or removing testing.

### Buffer Strategy
- **Feeding buffers** — where non-critical merges into critical path
- **Project buffer** — end of critical path (25-50% of CP duration)
- Low confidence → larger buffers

### Risk Framework
5 categories: Technical, Schedule, Scope, Resource, Organizational
Quantify: Probability (1-5) × Impact (1-5) = Risk Score
15-25: Critical (must mitigate) | 8-14: High (plan mitigation) | 4-7: Medium (monitor)

### Technology Selection Framework
When more than one stack is feasible, use a scored decision matrix before implementation.

Minimum required criteria:
- **Industry prevalence** — ecosystem maturity, talent availability, support horizon
- **Cost to build** — team productivity, learning curve, implementation effort
- **Cost to run** — runtime/infrastructure/license/operations cost profile
- **Portability** — ability to move across environments/vendors with low friction

Guidance:
- Compare at least two credible options
- Include preferred stack (for example C#) as an option, but do not auto-select it
- Use team preference only as a tie-breaker when objective scores are close
- Document decision rationale and assumptions in project artifacts

---

## Phase 5: Implementation — Deep Reference

### Sprint Strategy (Architecture-Ordered)
Sprint 0: Utilities + CI/CD → Early: Engines + RAs → Middle: Managers + integration → Late: Clients + E2E → Final: Polish

### Coding Standards

**Architecture compliance**:
- Import only interface types across boundaries
- Constructor injection for dependencies
- No hidden statics, no circular references

**Code quality**:
- Methods ≤ 20 lines, nesting ≤ 3 levels
- No magic numbers, descriptive names
- Fail fast at boundaries, specific error handling

**Commits**: `<type>(<scope>): <description>` — e.g., `feat(PricingEngine): implement tiered pricing`

### Code Review Priority Order
1. Architecture compliance (taxonomy, call graph — reject violations)
2. Correctness (use cases, edge cases, error conditions)
3. Test quality (meaningful, behavior-based, error paths)
4. Code quality (readability, complexity, smells)
5. Non-functional (performance, security, logging)

### Definition of Done
- [ ] Matches interface contract
- [ ] Acceptance criteria met
- [ ] Unit tests pass (90%+ on logic)
- [ ] Integration tests pass
- [ ] Code reviewed, no warnings
- [ ] Committed with meaningful message
- [ ] Linked GitHub Issue updated with evidence and final status

### Work Tracking Discipline
- Every implementation change must map to a GitHub Issue
- Commits and pull requests reference the GitHub Issue ID
- GitHub Issue status reflects real delivery state and links to evidence (tests, reviews, ADRs, docs)

---

## Phase 6: QA — Deep Reference

### Test Levels by Taxonomy

| Service Type | Primary Test Type | Key Verification |
|-------------|------------------|-----------------|
| Utility | Unit | Behavior, edge cases, thread safety |
| Engine | Unit | Logic correctness, statelessness (no mocking needed!) |
| Resource Accessor | Integration | Data access, abstraction integrity |
| Manager | Integration | Orchestration, error propagation |
| Client | System/E2E | User workflows |

### Architecture Compliance Tests (Unique to IDesign)
- Taxonomy verification — static analysis / code review
- Call graph verification — no forbidden cross-layer calls
- Interface compliance — every service implements its contract fully
- Dependency direction — all correct
- No circular dependencies

### Defect Severity
Critical (arch violation, security) → fix immediately | High (core workflow bug) → fix before release | Medium → next iteration | Low → when convenient

Root cause analysis for Critical/High: Where introduced? What gate should have caught it?

---

## Phase 7: Deployment — Deep Reference

### Deployment Order (mirrors build order)
Utilities → Resource Accessors → Engines → Managers → Clients
Each layer verified against already-deployed dependencies.

### Rollback Triggers
Error rate > 2x baseline | Response time > 2x baseline | Critical functionality broken | Data integrity compromised

Rollback in reverse order: Clients → Managers → Engines/RAs → Utilities

---

## Phase 8: Maintenance — Deep Reference

### Change Classification
- **Encapsulated**: fits in one service → implement normally
- **Cross-cutting**: touches multiple services → review architecture (missed volatility?)
- **Architectural**: requires new services → mini Phase 3

### Volatility Validation
Was this change predicted? → Architecture is working. Surprise? → Update volatility model.

### Technical Debt Categories (priority order)
1. **Architecture debt** — taxonomy/call-graph violations (highest)
2. **Design debt** — poor abstractions, leaky interfaces
3. **Code debt** — duplication, missing tests
4. **Infrastructure debt** — manual processes, outdated dependencies

### When to Re-Architect
- Volatility analysis fundamentally wrong
- Architecture debt makes every change painful
- Business requirements shifted dramatically
- Platform at end-of-life

Re-architecture ≠ start over. Return to Phase 3 with fresh volatility analysis + migration path.

---

## Anti-Patterns to Reject
1. "We'll refactor later" — if architecture is wrong, fix now
2. "It works, ship it" — working code with bad architecture = debt with interest
3. "Tests will catch it" — tests validate behavior, not architecture
4. "The deadline requires shortcuts" — architecture shortcuts create longer timelines
5. "We can't afford quality" — you can't afford not having it
