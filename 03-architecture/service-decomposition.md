# Service Decomposition

## Purpose
Transform the volatility analysis into a concrete service architecture using the IDesign service taxonomy. Every service encapsulates volatility, has a clear taxonomy role, and interacts with other services through defined contracts.

## Instructions

### Step 1: Initial Service Identification
From the volatility-to-service mapping, define each service:

For each service, specify:
- **Name** — Descriptive, reflecting its responsibility (not its technology)
- **Taxonomy Role** — Manager, Engine, Resource Accessor, or Utility
- **Responsibility** — One sentence: what this service does and why it exists
- **Encapsulated Volatility** — Which axes of change this service owns
- **Interface** — The contract this service exposes

### Step 2: Apply the IDesign Taxonomy

#### Managers
- **Orchestrate workflows** across Engines and Resource Accessors
- Contain **no business logic** — they coordinate, not compute
- Contain **no data access** — they delegate, not query
- Represent **use case workflows** — each Manager maps to a coherent user journey
- Call Engines and Resource Accessors, never other Managers

*Test: If you remove all Managers, the Engines and Resource Accessors should still make sense independently.*

#### Engines
- Contain **pure business logic** — algorithms, calculations, rules, validations
- Are **stateless** — they receive data, process it, and return results
- **Never access data stores** — they don't know where data comes from or where it goes
- **Never call Resource Accessors** — Managers provide them with the data they need
- Can call other Engines and Utilities

*Test: Can you unit test this Engine with no mocking of data sources? If not, it's not a true Engine.*

#### Resource Accessors
- **Abstract data access** — databases, APIs, file systems, caches
- Encapsulate **data volatility** — when the data source changes, only this service changes
- **Contain no business logic** — they store and retrieve, not decide
- **Never call Engines** — they don't know about business rules
- Can call Utilities

*Test: If you swap the underlying database, does the service's interface remain unchanged? If not, the abstraction is wrong.*

#### Utilities
- Handle **cross-cutting concerns** — logging, configuration, security, caching, serialization
- **Called by anyone** — Managers, Engines, Resource Accessors all depend on Utilities
- **Call no one** — except other Utilities
- **Stateless or with shared state** — configuration, connection pools, etc.

*Test: Is this concern relevant regardless of the business domain? If so, it's a Utility.*

### Step 3: Define the Call Graph
Map every service-to-service interaction:

```
Client → Manager → Engine
                 → Resource Accessor
Engine → Utility
Resource Accessor → Utility
Utility → Utility (only)
```

**Validate against IDesign rules:**
- [ ] No Manager calls another Manager
- [ ] No Engine calls a Resource Accessor
- [ ] No Resource Accessor calls an Engine
- [ ] No Utility calls a Manager, Engine, or Resource Accessor
- [ ] All interactions are through interfaces (contracts)
- [ ] No circular dependencies exist

### Step 4: Service Validation

For each service, verify:

| Check | Question |
|-------|----------|
| Single Responsibility | Does this service have exactly one reason to exist? |
| Volatility Encapsulation | When its volatility axis changes, is this service the only one affected? |
| Taxonomy Fit | Does it cleanly fit one taxonomy role, or is it trying to be two things? |
| Interface Sufficiency | Does its contract expose everything needed without leaking implementation? |
| Independence | Can this service be developed, tested, and deployed independently? |

**If any check fails**, refactor the decomposition. Common fixes:
- Split a service that has multiple reasons to change
- Merge services that always change together
- Reclassify a service that doesn't fit its taxonomy role
- Extract logic from a Manager into an Engine
- Extract data access from an Engine into a Resource Accessor

## Inputs
- Volatility Matrix (from volatility analysis)
- Volatility-to-Service Mapping (from volatility analysis)
- PRD (for use case context)

## Outputs
- **Service Catalog** — All services with taxonomy, responsibility, and volatility mapping
- **Call Graph** — Visual and textual representation of service interactions
- **Interface Definitions** — Contract for each service (methods, inputs, outputs, errors)
- **Validation Report** — Results of Step 4 checks

## Quality Criteria
- [ ] Every service has exactly one taxonomy role
- [ ] Every service encapsulates at least one volatility axis
- [ ] No service encapsulates more than 3 volatility axes
- [ ] Call graph passes all IDesign rule checks
- [ ] No circular dependencies exist
- [ ] Every service can be tested independently
- [ ] Every service interaction is through a defined interface
