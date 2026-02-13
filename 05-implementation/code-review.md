# Code Review

## Purpose
Verify that implementations honor the architecture, meet coding standards, and maintain quality. Code review is a quality gate at the activity level — the smallest gate in the system.

## Instructions

### Review Priorities (in order)

#### 1. Architecture Compliance (Most Critical)
- Does this code honor the service's taxonomy role?
  - Manager doing business logic? → Reject
  - Engine accessing a database? → Reject
  - Resource Accessor applying business rules? → Reject
- Does this code respect the call graph rules?
  - Manager calling another Manager? → Reject
  - Cross-layer violations? → Reject
- Does the implementation match the interface contract?
  - Missing operations? → Reject
  - Different error behavior? → Reject

#### 2. Correctness
- Does the code handle all specified use cases?
- Are edge cases handled?
- Are all error conditions from the contract implemented?
- Does the logic match the acceptance criteria?

#### 3. Test Quality
- Are tests meaningful (not just for coverage)?
- Do tests verify behavior, not implementation?
- Are error paths tested?
- Are boundary conditions tested?

#### 4. Code Quality
- Is the code readable without context?
- Are names descriptive and consistent?
- Is complexity managed (short methods, low nesting)?
- Are there any code smells? (duplication, long methods, feature envy, etc.)

#### 5. Non-Functional Concerns
- Are there performance implications?
- Are there security concerns (input validation, authorization)?
- Is logging/observability adequate?
- Are there resource leaks (connections, streams, etc.)?

### Review Process

1. **Author** submits code with:
   - Link to the activity/story being implemented
   - Summary of changes and design decisions
   - Self-review checklist completed

2. **Reviewer** evaluates using the priority order above

3. **Feedback** is categorized:
   - **Blocker** — Must fix before merge (architecture violations, bugs, missing error handling)
   - **Suggestion** — Should consider but not blocking (naming, style improvements)
   - **Question** — Needs clarification (understanding the design rationale)
   - **Praise** — Positive reinforcement (good patterns worth repeating)

4. **Resolution** — Author addresses all Blockers, considers Suggestions, answers Questions

5. **Approval** — Reviewer approves when Blockers are resolved

### Review Anti-Patterns to Avoid

- **Rubber stamping** — Approving without actually reading the code
- **Nitpicking only** — Focusing on style while missing logic errors
- **Architecture blindness** — Reviewing code quality but not taxonomy compliance
- **Ego reviewing** — "I would have done it differently" is not a review comment
- **Delayed reviews** — Reviews that sit for days block the team

## Quality Criteria
- [ ] Architecture compliance is the first thing reviewed
- [ ] Every merge has at least one review
- [ ] Blockers are resolved before merge
- [ ] Review turnaround is within 1 business day
