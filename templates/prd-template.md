# Product Requirements Document (PRD) Template

## Document Control
**Product**: [Product Name]  
**Version**: [Version]  
**Date**: [Date]  
**Author**: [Author]  
**Status**: [Draft / Review / Approved]  

## 1. Introduction
### 1.1 Purpose
[What this document covers and who it's for]

### 1.2 Product Overview
[Brief summary — reference the Product Brief]

### 1.3 Definitions & Acronyms
| Term | Definition |
|------|-----------|
| [Term] | [Definition] |

## 2. Use Cases

### UC-001: [Use Case Name]
**Actor**: [Who initiates this]  
**Pre-conditions**: [What must be true before]  
**Post-conditions**: [What is true after]  
**Priority**: [Must / Should / Could / Won't]  
**Volatility**: [Stable / Volatile / Uncertain]  

**Primary Flow:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Alternative Flows:**
- **A1**: [Variation description]
  1. [Step]
  2. [Step]

**Exception Flows:**
- **E1**: [Error condition]
  1. [How the system responds]

**Acceptance Criteria:**
- [ ] [Criterion 1 — specific, testable]
- [ ] [Criterion 2]

---

### UC-002: [Use Case Name]
[Repeat structure]

## 3. Functional Requirements

### FR-001: [Requirement Name]
**Description**: [What the system must do]  
**Source Use Case**: [UC-XXX]  
**Priority**: [Must / Should / Could / Won't]  
**Volatility**: [Stable / Volatile / Uncertain]  
**Acceptance Criteria**:
- [ ] [Criterion]

[Repeat for each requirement]

## 4. Non-Functional Requirements

### 4.1 Performance
| Requirement | Specification | Measurement Method |
|------------|--------------|-------------------|
| NFR-P001: Response Time | [e.g., < 200ms for 95th percentile] | [How to measure] |
| NFR-P002: Throughput | [e.g., 1000 requests/second] | [How to measure] |
| NFR-P003: Concurrent Users | [e.g., 500 concurrent sessions] | [How to measure] |

### 4.2 Security
| Requirement | Specification |
|------------|--------------|
| NFR-S001: Authentication | [e.g., OAuth 2.0 / OIDC] |
| NFR-S002: Authorization | [e.g., Role-based access control] |
| NFR-S003: Data Protection | [e.g., AES-256 encryption at rest] |

### 4.3 Scalability
| Requirement | Specification |
|------------|--------------|
| NFR-SC001: Growth | [e.g., Handle 10x current load within 2 years] |
| NFR-SC002: Data Volume | [e.g., Support 10TB of data] |

### 4.4 Availability
| Requirement | Specification |
|------------|--------------|
| NFR-A001: Uptime | [e.g., 99.9% monthly uptime] |
| NFR-A002: Recovery | [e.g., RTO < 1 hour, RPO < 15 minutes] |

### 4.5 Usability
| Requirement | Specification |
|------------|--------------|
| NFR-U001: Accessibility | [e.g., WCAG 2.1 AA compliance] |
| NFR-U002: Devices | [e.g., Desktop and mobile responsive] |

## 5. Constraints
| ID | Type | Constraint | Rationale |
|----|------|-----------|-----------|
| C-001 | Technology | [e.g., Must use PostgreSQL] | [Why] |
| C-002 | Business | [e.g., Must launch by Q3] | [Why] |
| C-003 | Regulatory | [e.g., GDPR compliance] | [Why] |

## 6. Integration Requirements
| System | Direction | Protocol | Data Exchanged |
|--------|-----------|----------|---------------|
| [System name] | [Inbound/Outbound/Both] | [REST/GraphQL/Event] | [What data] |

## 7. Data Requirements
### 7.1 Data Entities
| Entity | Description | Volume | Growth Rate |
|--------|------------|--------|-------------|
| [Entity] | [What it represents] | [Current] | [Monthly/Yearly growth] |

### 7.2 Data Retention
| Data Type | Retention Period | Archive Policy |
|-----------|-----------------|---------------|
| [Type] | [Duration] | [Archive/Delete] |

## 8. Requirements Traceability
| Requirement | Source (Discovery/Stakeholder) | Use Case | Test Case |
|------------|-------------------------------|----------|-----------|
| FR-001 | [Source] | UC-001 | TC-001 |
| NFR-P001 | [Source] | — | TC-P001 |

## 9. Glossary
[Domain-specific terms with precise definitions]

## 10. Approval
| Role | Name | Sign-off | Date |
|------|------|----------|------|
| Product Owner | | | |
| Architect | | | |
| Technical Lead | | | |
