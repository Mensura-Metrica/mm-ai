# Interface Design

## Purpose
Define the contracts between services. In IDesign, **the interface IS the architecture**. Implementation is detail — the contracts define how the system works.

## Instructions

### Step 1: Contract Design Principles

Every interface contract follows these rules:

1. **Semantic, not syntactic** — The interface describes *meaning*, not just method signatures
2. **Stable** — Interfaces change rarely; implementations change often
3. **Complete** — Everything a caller needs is exposed; nothing extra is leaked
4. **Error-aware** — Failure modes are part of the contract, not an afterthought
5. **Versionable** — The contract can evolve without breaking existing callers

### Step 2: Define Each Service Interface

For each service in the catalog, define:

```
Service: [Name]
Taxonomy: [Manager | Engine | Resource Accessor | Utility]

Operations:
  - Name: [OperationName]
    Purpose: [What this operation does]
    Input: [Parameters with types and constraints]
    Output: [Return value with type and structure]
    Errors: [Possible error conditions and how they're signaled]
    Pre-conditions: [What must be true before calling]
    Post-conditions: [What is guaranteed after successful execution]
    Idempotency: [Yes | No | Conditional]
```

### Step 3: Error Contract Design

Errors are first-class citizens in interface design:

- **Expected errors** (validation failures, not-found) — Part of the normal interface contract
- **Unexpected errors** (infrastructure failures, bugs) — Handled through error propagation policy
- **Error semantics** — The caller should understand *what went wrong* without knowing *how*

Define error categories:
| Category | Examples | Handling Strategy |
|----------|----------|------------------|
| Validation | Invalid input, business rule violation | Return specific error with details |
| Not Found | Resource doesn't exist | Return absence indicator (null, Option, 404) |
| Conflict | Concurrent modification, duplicate | Return conflict details for resolution |
| Authorization | Insufficient permissions | Return authorization error |
| Infrastructure | Database unavailable, timeout | Propagate with retry/circuit-breaker guidance |

### Step 4: Cross-Cutting Contract Concerns

Define standards that apply across all interfaces:

- **Naming conventions** — How operations, parameters, and errors are named
- **Data transfer format** — How complex data crosses service boundaries
- **Pagination** — How large result sets are handled
- **Versioning strategy** — How interfaces evolve over time
- **Observability** — How operations are traced, metered, and logged
- **Security** — How authentication and authorization flow through service calls

### Step 5: Contract Validation

Verify each interface against:
- [ ] Does it expose everything the callers need (check the call graph)?
- [ ] Does it hide implementation details completely?
- [ ] Are error conditions explicit and categorized?
- [ ] Could the implementation be swapped without changing the interface?
- [ ] Is the interface testable with a simple mock/stub?

## Inputs
- Service Catalog (from service decomposition)
- Call Graph (from service decomposition)
- PRD (for behavior details)

## Outputs
- **Interface Specification** — Complete contracts for all services
- **Error Taxonomy** — Categorized error types with handling strategies
- **Cross-Cutting Standards** — Conventions that apply to all interfaces
- **Contract Test Cases** — Key scenarios that verify interface compliance

## Quality Criteria
- [ ] Every service has a defined interface
- [ ] Every operation has documented inputs, outputs, errors, pre/post-conditions
- [ ] Error conditions are categorized, not just "throws exception"
- [ ] No interface leaks implementation details
- [ ] Cross-cutting concerns are standardized
- [ ] Interface can be mocked for testing without complexity
