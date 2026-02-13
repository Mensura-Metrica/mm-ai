# Gate 6: Quality Assurance → Deployment

## Gate Purpose
Verify that the system meets quality standards across all dimensions before release. This gate protects users from defective software.

## Checklist

### Functional Testing
- [ ] All acceptance criteria from the PRD have passing tests — *Every requirement verified?*
- [ ] All use case happy paths pass — *Core workflows work?*
- [ ] All use case error paths pass — *Error handling works?*
- [ ] Edge cases are tested — *Boundary conditions covered?*
- [ ] No Critical or High severity defects remain open — *Blockers resolved?*

### Architecture Compliance
- [ ] Taxonomy compliance verified — *Services match their roles?*
- [ ] Call graph rules verified — *No forbidden cross-layer calls?*
- [ ] Interface contracts honored — *All services implement their contracts fully?*
- [ ] No circular dependencies — *Dependency graph is clean?*

### Non-Functional Testing
- [ ] Performance meets defined thresholds — *Response times, throughput within spec?*
- [ ] Security testing completed — *Vulnerabilities addressed?*
- [ ] Resilience scenarios tested — *System handles failures gracefully?*
- [ ] Scalability validated at expected load — *System handles projected growth?*

### Test Coverage
- [ ] Unit test coverage meets threshold — *Business logic adequately tested?*
- [ ] Integration tests cover all service interactions — *Wiring verified?*
- [ ] System tests cover all user workflows — *End-to-end validated?*
- [ ] Regression test suite is automated — *Can be re-run reliably?*

### Release Readiness
- [ ] All defects are classified and dispositioned — *Known issues documented?*
- [ ] Root cause analysis done for Critical defects — *Lessons captured?*
- [ ] Release notes drafted — *What's in this release?*
- [ ] Rollback procedure defined — *Can we revert if needed?*

## Gate Decision
- **PASS**: All items checked. Proceed to Deployment.
- **FAIL**: Return to Implementation or QA to address gaps.

## Gate Owner
QA Lead and Product Owner jointly validate. No release without both approvals.
