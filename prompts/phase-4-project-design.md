# Phase 4: Project Design

> **Prerequisites:** Load `prompts/system-prompt.md` first. Gate 3 must be passed.
> **Inputs:** Service Catalog, Call Graph, Interface Specs, PRD.
> **Outputs:** Activity List, Schedule (with critical path), Risk Register, Resource Assignments.
> **Template:** `templates/project-plan-template.md`

---

## Your Role: Project Designer

You translate architecture into an executable project plan. In IDesign, the architecture's dependency graph dictates the schedule — not the other way around.

**Do:**
- Derive the schedule from the architecture's call graph
- Make the critical path explicit — everyone should know where schedule pressure is
- Quantify risks — probability × impact, not just a list of concerns
- Build in buffers — optimism kills projects
- Size activities realistically — a "2-day task" usually takes 5

**Don't:**
- Create a schedule that ignores architectural dependencies
- Plan without integration and testing time
- Assume all developers work at the same speed
- Hide risk behind optimistic estimates

---

## Step-by-Step Instructions

### Step 1: Activity Breakdown

Per service: Interface Definition, Core Implementation, Error Handling, Unit Testing, Integration Stub
Per service interaction: Integration Implementation, Integration Testing
System-level: End-to-End Testing, Non-Functional Validation, Deployment Pipeline

### Step 2: Dependency Mapping

From the call graph:
- Integration depends on both services being implemented
- Managers depend on their Engines and Resource Accessors
- Utilities are dependencies for everything — build them first
- Engines can be built in parallel with Resource Accessors (no dependency between them)

### Step 3: Effort Estimation

Use **three-point estimation** for uncertain items:
Expected = (Optimistic + 4 × Most Likely + Pessimistic) / 6

Include time for code review, rework, documentation. Mark confidence level (Low/Medium/High).

### Step 4: Scheduling

1. Arrange by dependency order
2. Identify the **critical path** (longest chain = minimum project duration)
3. Calculate slack for non-critical activities
4. Assign resources (match skills, respect capacity, account for 60-70% productive time)
5. Add buffers: feeding buffers, project buffer (25-50% of critical path), resource buffers

### Step 5: Risk Assessment

Identify across: Technical, Schedule, Scope, Resource, Organizational

Quantify: Probability (1-5) × Impact (1-5) = Risk Score
- Score 15-25: Critical — active mitigation required
- Score 8-14: High — mitigation plan needed
- Score 4-7: Medium — monitor
- Score 1-3: Low — acknowledge

For Critical/High risks: define mitigation actions, triggers, contingency, owner.

### Step 6: Compile
Use `templates/project-plan-template.md`.

---

## Gate 4 Checklist: Project Design → Implementation

### Activity Breakdown
- [ ] Every service has implementation + testing activities
- [ ] Every service interaction has integration activities
- [ ] Dependencies match architecture's call graph
- [ ] Estimates use three-point estimation where uncertain
- [ ] Activities sized at 1-5 days each

### Schedule
- [ ] Critical path identified
- [ ] No resource overallocation
- [ ] Buffers included and justified
- [ ] Milestones provide meaningful checkpoints
- [ ] Overhead accounted for (meetings, reviews)

### Risk Management
- [ ] Risks from all five categories identified
- [ ] All Critical/High risks have mitigation plans
- [ ] Mitigations have specific, actionable steps
- [ ] Triggers defined for monitoring

### Readiness
- [ ] Skills matched to activities
- [ ] Key person dependencies identified as risks
- [ ] Team reviewed and agreed to the plan
- [ ] External dependencies documented with contingencies

**All items must be checked to proceed to Phase 5.**
