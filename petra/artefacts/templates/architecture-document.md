# Architecture Document

## Document Control
| Field | Value |
|-------|-------|
| **Project** | [Name] |
| **Version** | [X.Y] |
| **Date** | [Date] |
| **Architect** | [Name] |
| **Status** | [Draft / Review / Approved] |

---

## 1. Executive Summary

[2-3 paragraphs summarising the solution architecture]

## 2. Volatility Analysis

### 2.1 Identified Volatilities

| ID | Volatility | Category | Likelihood | Impact | Priority |
|----|-----------|----------|----------|---------|----------|
| V-001 | [Description] | [Bus/Tech/Dom/Int] | [H/M/L] | [H/M/L] | [Priority] |

### 2.2 Volatility Groups

| Group | Volatilities | Service Mapping |
|-------|------------|-------------|
| [Group 1] | V-001, V-002 | [Service Name] |

## 3. Service Decomposition

### 3.1 Services

| Service | Type | Responsibility | Dependencies |
|---------|------|--------------|--------------|
| [Name]Manager | Manager | [What it orchestrates] | [Dependencies] |
| [Name]Engine | Engine | [What logic] | [Dependencies] |
| [Name]ResourceAccessor | Resource Accessor | [What data] | [Dependencies] |
| [Name]Utility | Utility | [What cross-cutting] | [Dependencies] |

### 3.2 Taxonomy Validation

- [ ] No Manager contains domain logic
- [ ] No Engine touches data stores
- [ ] No Engine calls Resource Accessors
- [ ] No lateral calls between same-type services

## 4. Interface Contracts

### 4.1 [ServiceName]Manager

| Operation | Input | Output | Errors |
|----------|-------|--------|--------|
| [Operation] | [Type] | [Type] | [Errors] |

### 4.2 [ServiceName]Engine

| Operation | Input | Output | Errors |
|----------|-------|--------|--------|
| [Operation] | [Type] | [Type] | [Errors] |

## 5. Call Graph

[Diagram or description of service interactions]

### 5.1 Call Paths

| Path | Services | Description |
|------|----------|-------------|
| [Path 1] | Client→Manager→Engine→RA | [Workflow] |

### 5.2 Forbidden Paths

Verify none of these exist:
- Client → Engine
- Manager → Manager
- Engine → Engine

## 6. Non-Functional Requirements

| NFR | Requirement | Validation |
|-----|------------|-------------|
| Performance | [Target] | [Test] |
| Scalability | [Target] | [Test] |
| Security | [Target] | [Test] |
| Availability | [Target] | [Test] |

## 7. Architecture Decisions

| ADR ID | Decision | Rationale | Status |
|-------|----------|-----------|--------|
| ADR-001 | [What] | [Why] | [Accepted] |

## 8. Unresolved Questions

| ID | Question | Impact | Owner | Due Date |
|----|----------|--------|-------|--------|
| UQ-001 | [What] | [Impact] | [Name] | [Date] |

## 9. Gate 3 Evidence

| Criterion | Evidence | Status |
|-----------|----------|--------|
| Volatility analysis complete | Section 2 | [✓/✗] |
| Services decomposed | Section 3 | [✓/✗] |
| Interfaces designed | Section 4 | [✓/✗] |
| Call graph valid | Section 5 | [✓/✗] |
| NFRs addressed | Section 6 | [✓/✗] |

---

## Sign-off

| Role | Name | Signature | Date |
|------|------|----------|------|
| Architect | | | |