# Test Plan Template

## Document Control
**Product**: [Product Name]  
**Version**: [Version]  
**Date**: [Date]  
**Author**: [QA Lead]  
**Status**: [Draft / Review / Approved]  

## 1. Test Scope

### 1.1 In Scope
| Area | Test Level | Approach |
|------|-----------|----------|
| [Service/Feature] | [Unit/Integration/System] | [Manual/Automated] |

### 1.2 Out of Scope
| Area | Reason |
|------|--------|
| [Area] | [Why not tested] |

## 2. Test Strategy Summary
[Reference to the full Test Strategy document. Summary of key testing approaches for this release.]

## 2.1 Automation Strategy
| Test Layer | Automation Target | Pipeline Trigger | Owner | Notes |
|-----------|-------------------|------------------|-------|-------|
| Unit | [e.g., >=90% automated] | [PR/CI] | [Name/Role] | |
| Integration | [e.g., 100% repeatable scenarios automated] | [PR/CI] | [Name/Role] | |
| System / Smoke | [Critical journeys automated] | [Deploy pipeline] | [Name/Role] | |
| Regression | [Critical/High defect coverage automated] | [PR + pre-release] | [Name/Role] | |

## 2.2 Manual Test Exception Register
| Test ID | Reason Manual | Automation Plan | Owner | Target Date |
|--------|----------------|-----------------|-------|-------------|
| [ID] | [Why not yet automated] | [How/when it will be automated] | [Name/Role] | [Date] |

## 3. Architecture Compliance Tests

### 3.1 Taxonomy Verification
| Service | Expected Role | Verified | Notes |
|---------|--------------|----------|-------|
| [Service] | [Manager/Engine/RA/Utility] | [ ] | |

### 3.2 Call Graph Verification
| Rule | Verified | Notes |
|------|----------|-------|
| No Manager → Manager | [ ] | |
| No Engine → Resource Accessor | [ ] | |
| No Resource Accessor → Engine | [ ] | |
| No circular dependencies | [ ] | |
| All calls through interfaces | [ ] | |

## 4. Test Cases

### 4.1 Unit Tests

#### [Service Name] — [Engine/Utility]
| ID | Description | Input | Expected Output | Error Case | Status |
|----|-------------|-------|----------------|------------|--------|
| UT-001 | [What's tested] | [Input data] | [Expected] | [N/A or error type] | [Pass/Fail/Blocked] |

### 4.2 Integration Tests

#### [Service Interaction] — [Manager → Engine + RA]
| ID | Description | Setup | Steps | Expected Result | Status |
|----|-------------|-------|-------|----------------|--------|
| IT-001 | [What's tested] | [Test data/config] | [Steps] | [Expected] | [Pass/Fail/Blocked] |

### 4.2.1 Integration Automation Details
| Suite | Execution | Environment | Trigger | Report Location |
|------|-----------|-------------|---------|-----------------|
| [Suite name] | [Automated/Manual] | [Env] | [PR/Nightly/Release] | [Path/URL] |

### 4.3 System / End-to-End Tests

#### [Use Case: UC-XXX]
| ID | Description | Pre-conditions | Steps | Expected Result | Status |
|----|-------------|---------------|-------|----------------|--------|
| ST-001 | [Happy path] | [Setup] | [Steps] | [Expected] | [Pass/Fail/Blocked] |
| ST-002 | [Error path] | [Setup] | [Steps] | [Expected error handling] | [Pass/Fail/Blocked] |

### 4.3.1 Smoke Suite
| Smoke ID | Critical Journey | Automated | Trigger | Result Location |
|---------|-------------------|-----------|---------|-----------------|
| SM-001 | [Journey] | [Yes/No] | [Post-deploy/Release] | [Path/URL] |

### 4.4 Non-Functional Tests

#### Performance
| ID | Scenario | Load | Threshold | Actual | Status |
|----|----------|------|-----------|--------|--------|
| PT-001 | [Scenario] | [Users/Requests] | [Target] | [Measured] | [Pass/Fail] |

#### Security
| ID | Test | Expected | Status |
|----|------|----------|--------|
| SEC-001 | [Security test] | [Expected behavior] | [Pass/Fail] |

## 5. Test Environment
| Environment | Purpose | Configuration |
|------------|---------|---------------|
| [Name] | [What it's for] | [Key config details] |

## 6. Test Data
| Test Level | Data Source | Reset Strategy |
|-----------|------------|---------------|
| Unit | [Deterministic fixtures] | [Per test] |
| Integration | [Test database/API] | [Per suite] |
| System | [Production-like] | [Per run] |

## 7. Defect Summary
| Severity | Count | Open | Resolved | Deferred |
|----------|-------|------|----------|----------|
| Critical | | | | |
| High | | | | |
| Medium | | | | |
| Low | | | | |

## 8. Test Coverage Summary
| Level | Total Cases | Passed | Failed | Blocked | Coverage |
|-------|------------|--------|--------|---------|----------|
| Unit | | | | | [%] |
| Integration | | | | | [%] |
| System | | | | | [%] |
| Non-Functional | | | | | [%] |

## 8.1 Automation Coverage Summary
| Level | Automated Cases | Manual Cases | Automation % | Target % | Status |
|------|------------------|--------------|--------------|----------|--------|
| Unit | | | [%] | [%] | [Pass/Fail] |
| Integration | | | [%] | [%] | [Pass/Fail] |
| Smoke | | | [%] | [%] | [Pass/Fail] |
| Regression | | | [%] | [%] | [Pass/Fail] |

## 8.2 Pipeline Execution Evidence
| Pipeline Run | Trigger | Suites Executed | Outcome | Evidence Link |
|-------------|---------|-----------------|---------|---------------|
| [Run ID] | [PR/Deploy/Release] | [Suites] | [Pass/Fail] | [URL/Path] |

## 9. Sign-Off
| Role | Name | Decision | Date |
|------|------|----------|------|
| QA Lead | | | |
| Product Owner | | | |
| Technical Lead | | | |
