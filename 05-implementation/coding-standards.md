# Coding Standards

## Purpose
Define the coding standards that ensure consistency, readability, and architectural compliance across the codebase. These standards apply regardless of programming language.

## Architecture Compliance Standards

### Taxonomy Enforcement
- **Managers** must not contain business logic or data access code
- **Engines** must be stateless and must not reference data access APIs
- **Resource Accessors** must not contain business rules
- **Utilities** must not depend on Manager, Engine, or Resource Accessor types
- Every service implementation must implement its defined interface

### Dependency Rules
- **Import/reference only interface types** — Never depend on concrete implementations across service boundaries
- **Inject dependencies** — Use constructor injection for service dependencies
- **No hidden dependencies** — If a service needs something, it's in the constructor, not a static reference
- **No circular references** — If A depends on B, B must not depend on A (directly or transitively)

### Contract Fidelity
- Method signatures must match the interface specification exactly
- Error handling must implement all error conditions defined in the contract
- Pre-conditions from the interface must be validated
- Post-conditions from the interface must be guaranteed

## Code Quality Standards

### Naming
- **Classes/Services** — Noun or noun phrase describing what it is (`PricingEngine`, `OrderManager`)
- **Methods** — Verb or verb phrase describing what it does (`calculateTotal`, `findByEmail`)
- **Variables** — Descriptive names; no abbreviations unless universally understood (`idx` is okay, `c` for customer is not)
- **Constants** — UPPER_SNAKE_CASE with clear meaning
- **Boolean variables/methods** — Should read as a question (`isValid`, `hasPermission`, `canExecute`)

### Structure
- **One class per file** — With the file named after the class
- **Short methods** — Each method does one thing (target: ≤ 20 lines)
- **Low nesting** — Maximum 3 levels of nesting (use early returns, extract methods)
- **Consistent formatting** — Use the project's formatter; debates about tabs vs. spaces are closed
- **No magic numbers/strings** — Use named constants

### Error Handling
- **Fail fast** — Validate inputs at the boundary; don't pass bad data deeper
- **Be specific** — Catch specific exceptions, not generic "catch all"
- **Don't swallow errors** — Every catch block must either handle, log, or re-throw
- **Error messages are for developers** — Include context: what happened, what was expected, what was actual
- **User-facing errors are separate** — Don't expose implementation details to users

### Testing
- **Test behavior, not implementation** — Tests should survive refactoring
- **One assertion per concept** — A test should verify one thing
- **Descriptive test names** — `shouldRejectNegativeQuantity` not `test3`
- **Arrange-Act-Assert pattern** — Clear structure in every test
- **No test-to-test dependencies** — Each test is independent
- **Mock at service boundaries** — Mock the interface, not internal details

### Documentation
- **Public APIs** — Document purpose, parameters, return values, errors, and examples
- **Complex logic** — Explain *why*, not *what* (the code shows what; the comment shows why)
- **Architecture decisions** — Reference the relevant ADR
- **No obvious comments** — `// increment counter` above `counter++` adds clutter, not clarity

## Version Control Standards

### Commit Messages
- **Format**: `<type>(<scope>): <description>`
- **Types**: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`
- **Scope**: Service name or component
- **Description**: What and why (imperative mood)
- **Examples**: 
  - `feat(PricingEngine): implement tiered pricing calculation`
  - `fix(OrderManager): handle null customer in checkout flow`
  - `test(CustomerAccessor): add integration tests for search`

### Branch Strategy
- Feature branches from `main`/`develop`
- Branch name format: `<type>/<description>` (e.g., `feat/pricing-engine`, `fix/null-customer`)
- Short-lived branches — merge within days, not weeks
- No direct commits to `main`

### Code Review Requirements
- See [Code Review](code-review.md) for details
