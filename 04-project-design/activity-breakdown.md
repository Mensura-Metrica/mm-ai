# Activity Breakdown

## Purpose
Decompose the architecture into buildable activities — the work items that will be scheduled, assigned, and tracked. The architecture's service catalog and call graph directly determine the activity structure.

## Agent Persona
[Project Designer Agent](project-designer-agent.md)

## Instructions

### Step 1: Service-to-Activity Decomposition
For each service in the architecture's Service Catalog, define activities:

**Per Service:**
1. **Interface Definition** — Define the contract (often done during architecture, but may need refinement)
2. **Core Implementation** — Build the primary logic/data access/workflow
3. **Error Handling** — Implement error conditions from the interface contract
4. **Unit Testing** — Tests for the service in isolation
5. **Integration Stub** — Create stubs/mocks for services this one depends on

**Per Service Interaction (from the call graph):**
6. **Integration Implementation** — Wire the actual service-to-service call
7. **Integration Testing** — Test the interaction between services

**System-Level Activities:**
8. **End-to-End Testing** — Test complete user workflows across services
9. **Non-Functional Validation** — Performance, security, scalability testing
10. **Deployment Pipeline** — CI/CD setup and configuration

### Step 2: Dependency Mapping
From the architecture's call graph, determine activity dependencies:

**Architecture-Driven Dependencies:**
- An integration activity depends on both services being implemented
- A Manager's integration depends on its Engines and Resource Accessors
- End-to-end testing depends on all participating services being integrated
- Utility services are dependencies for almost everything — build them first

**Development Dependencies:**
- Implementation depends on interface being defined
- Testing depends on implementation
- Integration testing depends on both sides being implemented
- Deployment depends on all tests passing

**External Dependencies:**
- Third-party API access or documentation
- Infrastructure provisioning
- Security review or compliance approval
- Stakeholder decisions or feedback

### Step 3: Effort Estimation
For each activity, estimate:

| Property | Description |
|----------|------------|
| **Effort** | Person-hours to complete |
| **Duration** | Calendar time (accounting for meetings, context-switching, etc.) |
| **Complexity** | Low / Medium / High / Unknown |
| **Skills Required** | Specific expertise needed |
| **Confidence** | How confident is this estimate (Low / Medium / High) |

**Estimation Guidelines:**
- Use **three-point estimation**: Optimistic, Most Likely, Pessimistic
- Expected = (Optimistic + 4 × Most Likely + Pessimistic) / 6
- Low-confidence estimates should have wider ranges
- Include time for code review, rework, and documentation
- "Unknown" complexity items need a spike/prototype activity first

### Step 4: Identify Parallel Tracks
Using the dependency map, identify which activities can proceed in parallel:

- **Independent services** with no dependency between them → parallel tracks
- **Utility services** should be on the shortest track (everyone depends on them)
- **Engines** can often be built in parallel with Resource Accessors (they don't depend on each other)
- **Managers** must wait for their dependencies but can scaffold with stubs early

### Step 5: Activity Documentation
For each activity:
```
ID: [Unique identifier, e.g., SVC-001-IMPL]
Service: [Service name]
Activity: [What's being built]
Dependencies: [List of activity IDs this depends on]
Effort: [Person-hours, three-point estimate]
Duration: [Calendar days]
Skills: [Required expertise]
Complexity: [Low/Medium/High/Unknown]
Confidence: [Low/Medium/High]
```

## Inputs
- Service Catalog (from architecture)
- Call Graph (from architecture)
- Interface Specifications (from architecture)
- Team capabilities and availability

## Outputs
- **Activity List** — All activities with estimates and dependencies
- **Dependency Graph** — Visual and textual representation
- **Parallel Track Map** — Which activities can proceed simultaneously
- **Skills Matrix** — Required skills mapped to activities

## Quality Criteria
- [ ] Every service has at least implementation + testing activities
- [ ] Every service interaction has integration activities
- [ ] All dependencies are validated against the architecture's call graph
- [ ] Estimates use three-point estimation for uncertain items
- [ ] Parallel tracks are identified and validated for independence
- [ ] Skills requirements are explicit for specialized activities
