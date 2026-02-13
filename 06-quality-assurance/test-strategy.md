# Test Strategy

## Purpose
Define a comprehensive test strategy that verifies both functional correctness and architectural integrity. Testing in an IDesign architecture follows the service structure — each layer requires different testing approaches.

## Agent Persona
[QA Agent](qa-agent.md)

## Instructions

### Step 1: Test Architecture Alignment

The IDesign taxonomy directly determines the testing approach:

| Service Type | Primary Test Type | What to Verify |
|-------------|------------------|----------------|
| **Utility** | Unit tests | Correct behavior, edge cases, thread safety |
| **Engine** | Unit tests | Business logic correctness, statelessness, no side effects |
| **Resource Accessor** | Integration tests | Data access correctness, abstraction integrity |
| **Manager** | Integration tests | Workflow orchestration, service coordination |
| **Client** | System/E2E tests | User workflows, UI correctness |

### Step 2: Test Levels

#### Level 1: Unit Tests (Services in Isolation)
**Scope**: Individual service logic  
**Who writes**: Developers during implementation  
**When**: Continuously during development  

**Engines** (most testable):
- Pure function testing — input → expected output
- No mocking needed (Engines have no dependencies except Utilities)
- Boundary value analysis for all parameters
- Error condition testing for all contract-defined errors

**Utilities**:
- Standard unit testing
- Thread safety testing if concurrent use is expected
- Configuration variation testing

**Key Principle**: If you need complex mocking to unit test a service, the architecture might be wrong. Engines should be testable with no mocks.

#### Level 2: Integration Tests (Service Interactions)
**Scope**: Service-to-service communication through contracts  
**Who writes**: Developers + QA  
**When**: As services are integrated  

**Resource Accessors**:
- Test against real (or realistic) data sources
- Verify CRUD operations
- Test concurrent access scenarios
- Verify abstraction — same tests should pass if data source is swapped

**Managers**:
- Test workflow orchestration with real Engines and Resource Accessors
- Verify error propagation across service boundaries
- Test compensation/rollback scenarios

**Contract Tests**:
- Verify each service honors its interface contract
- Compare actual behavior against interface specification
- These tests are the architectural safety net

#### Level 3: System Tests (End-to-End)
**Scope**: Complete user workflows across all services  
**Who writes**: QA  
**When**: After integration  

- Map directly to use cases from the PRD
- Test the entire flow from Client through Manager through Engine/ResourceAccessor
- Include error scenarios and recovery paths
- Test with realistic data volumes

#### Level 4: Non-Functional Tests
**Scope**: Quality attributes defined in the architecture  
**Who writes**: QA + DevOps  
**When**: After functional testing  

**Performance Testing**:
- Response time against the defined thresholds
- Throughput at expected load
- Resource consumption (CPU, memory, connections)
- Identify bottlenecks in the service call chain

**Security Testing**:
- Authentication and authorization at service boundaries
- Input validation at all entry points
- Data protection (encryption, masking)
- Dependency vulnerability scanning

**Resilience Testing**:
- Service failure scenarios (what happens when an Engine is down?)
- Data source unavailability
- Network partition behavior
- Recovery time validation

### Step 3: Architecture Compliance Tests

These are unique to IDesign-informed testing:

- [ ] **Taxonomy verification** — Static analysis or code review to verify services match their taxonomy role
- [ ] **Call graph verification** — Verify no forbidden cross-layer calls exist
- [ ] **Interface compliance** — Every service implements its defined interface completely
- [ ] **Dependency direction** — All dependencies flow in the correct direction
- [ ] **No circular dependencies** — Verified through dependency analysis tools

### Step 4: Test Data Strategy
- **Unit tests**: Use deterministic test data, no external dependencies
- **Integration tests**: Use dedicated test data sets, reset between runs
- **System tests**: Use production-like data (anonymized if necessary)
- **Performance tests**: Use production-scale data volumes

### Step 5: Defect Management
When defects are found, classify by:

| Severity | Description | Response |
|----------|-------------|----------|
| **Critical** | Architecture violation or security vulnerability | Fix immediately, block release |
| **High** | Functional defect in core workflow | Fix before release |
| **Medium** | Functional defect in secondary workflow | Fix in next iteration |
| **Low** | Cosmetic or minor usability issue | Fix when convenient |

**Root Cause Analysis**: For every Critical and High defect, identify:
- Where was the defect introduced? (Requirements? Architecture? Implementation?)
- What gate should have caught it?
- What needs to change to prevent similar defects?

## Inputs
- Service Catalog and Call Graph (from Phase 3)
- Interface Specifications (from Phase 3)
- PRD with acceptance criteria (from Phase 2)
- Implementation (from Phase 5)

## Outputs
- **Test Strategy Document** — What's tested, at what level, with what approach
- **Test Plan** — Specific test cases organized by level and service
- **Architecture Compliance Report** — Results of taxonomy and call graph verification
- **Defect Register** — All defects found with classification and status
- **Test Coverage Report** — Coverage across test levels

## Quality Criteria
- [ ] All four test levels are covered in the strategy
- [ ] Architecture compliance tests are included
- [ ] Every acceptance criterion has at least one test case
- [ ] Non-functional requirements have corresponding tests
- [ ] Defect management process is defined with severity classifications
- [ ] Test data strategy addresses all test levels
