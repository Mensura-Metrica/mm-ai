# Architecture Document Template

## Document Control
**Product**: [Product Name]  
**Version**: [Version]  
**Date**: [Date]  
**Author**: [Architect]  
**Status**: [Draft / Review / Approved]  

## 1. Architecture Overview
[High-level description of the system architecture and the guiding principles (IDesign, volatility-based decomposition)]

### 1.1 Architecture Goals
- [Goal 1 — e.g., Encapsulate business rule volatility]
- [Goal 2 — e.g., Enable independent service deployment]
- [Goal 3 — e.g., Meet performance requirements under load]

### 1.2 Architecture Constraints
| Constraint | Impact on Architecture |
|-----------|----------------------|
| [Constraint] | [How it shapes the design] |

## 2. Volatility Analysis

### 2.1 Identified Volatility Axes
| ID | Axis | Description | Evidence | Likelihood | Frequency | Impact |
|----|------|-------------|----------|-----------|-----------|--------|
| VA-001 | [Name] | [What changes] | [Why we believe this] | [H/M/L] | [Rare/Occ./Freq.] | [Local/Mod./Sys.] |
| VA-002 | [Name] | [What changes] | [Evidence] | [H/M/L] | [Rare/Occ./Freq.] | [Local/Mod./Sys.] |

### 2.2 Rejected Volatilities
| Candidate | Reason for Rejection |
|-----------|---------------------|
| [Name] | [Why it was not considered a true axis of change] |

## 3. Service Catalog

### 3.1 Service Overview Diagram
[Service map showing all services and their taxonomy classification]

### 3.2 Service Details

#### SVC-001: [Service Name]
**Taxonomy**: [Manager | Engine | Resource Accessor | Utility]  
**Responsibility**: [One sentence — what this service does]  
**Encapsulated Volatility**: [VA-XXX]  
**Depends On**: [List of services this one calls]  
**Called By**: [List of services that call this one]  

**Interface:**
```
Operations:
  - [OperationName](inputs) → output
    Errors: [error conditions]
  - [OperationName](inputs) → output
    Errors: [error conditions]
```

[Repeat for each service]

## 4. Call Graph

### 4.1 Call Graph Diagram
[Visual representation of service-to-service calls]

### 4.2 Call Graph Validation
- [ ] No Manager → Manager calls
- [ ] No Engine → Resource Accessor calls
- [ ] No Resource Accessor → Engine calls
- [ ] No Utility → Manager/Engine/Resource Accessor calls
- [ ] No circular dependencies
- [ ] All calls through interfaces

## 5. Interface Specifications
[Detailed interface contracts — or reference to separate interface specification document]

### 5.1 Error Taxonomy
| Category | Meaning | Handling |
|----------|---------|---------|
| Validation | [Invalid input] | [Return error details] |
| NotFound | [Resource not found] | [Return absence] |
| Conflict | [Concurrent modification] | [Return conflict info] |
| Authorization | [Insufficient permissions] | [Return auth error] |
| Infrastructure | [System failure] | [Retry/circuit-break] |

### 5.2 Cross-Cutting Standards
- **Naming**: [Convention]
- **Data Transfer**: [Format]
- **Versioning**: [Strategy]
- **Observability**: [Approach]

## 6. Non-Functional Architecture

### 6.1 Performance Architecture
[How the architecture meets performance requirements — critical paths, caching, async processing]

### 6.2 Scalability Architecture
[How the system scales — horizontal, vertical, partitioning strategies]

### 6.3 Security Architecture
[Trust boundaries, authentication flow, authorization model, data protection]

### 6.4 Resilience Architecture
[Failure modes, recovery strategies, circuit breakers, fallbacks]

### 6.5 Data Architecture
[Data storage strategy, consistency model, replication, backup]

## 7. Architecture Decision Records

### ADR-001: [Decision Title]
**Date**: [Date]  
**Status**: [Proposed / Accepted / Deprecated / Superseded]  
**Context**: [What is the situation that requires a decision?]  
**Decision**: [What was decided]  
**Alternatives Considered**:
- [Option A] — [Pros / Cons] — [Why rejected]
- [Option B] — [Pros / Cons] — [Why rejected]

**Consequences**: [What are the results of this decision?]

[Repeat for each significant decision]

## 7.1 Architecture Uncertainty Log
All architecture-relevant uncertainties must be tracked and closed before Gate 3 pass.

| ID | Uncertainty | Why It Matters | Impact if Wrong | Status | Owner | Target Decision Date |
|----|-------------|----------------|-----------------|--------|-------|----------------------|
| UQ-001 | [Question/uncertainty] | [Boundary/interface/call-graph impact] | [What breaks or changes] | [Resolved/Deferred] | [Name/Role] | [Date] |

Closure rules:
- No unresolved **critical** uncertainties at Gate 3
- Deferred items must include owner + target decision date
- If a deferred item impacts service boundaries, interfaces, or call-graph rules, Gate 3 fails

## 8. Deployment Architecture
[How services are deployed — containers, cloud services, network topology]

## 9. Approval
| Role | Name | Sign-off | Date |
|------|------|----------|------|
| Lead Architect | | | |
| Product Owner | | | |
| Technical Lead | | | |
