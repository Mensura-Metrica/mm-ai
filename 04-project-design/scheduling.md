# Scheduling

## Purpose
Arrange activities into a timeline that respects dependencies, optimizes parallel execution, and produces a realistic schedule with a clearly identified critical path.

## Instructions

### Step 1: Build the Schedule Network
Using the Activity List and Dependency Graph:

1. **Arrange activities by dependency order** — No activity starts before its dependencies complete
2. **Identify the Critical Path** — The longest chain of dependent activities determines the minimum project duration
3. **Calculate slack (float)** — For non-critical activities, how much delay is acceptable before they affect the critical path?
4. **Mark milestone points** — Key points where progress can be verified

### Step 2: Critical Path Analysis

The critical path is **non-negotiable** — it determines the shortest possible project timeline.

**To shorten the critical path, you can only:**
- **Reduce effort** — Simplify scope, use better tools, or accept less polish
- **Add parallelism** — Break critical-path activities into independent sub-activities
- **Fast-track** — Overlap activities that have soft dependencies (with added risk)
- **Crash** — Add resources (with diminishing returns and communication overhead)

**You CANNOT shorten the critical path by:**
- Ignoring dependencies
- Removing testing
- Working overtime (sustained overtime reduces productivity)
- "Being optimistic"

### Step 3: Resource Allocation
Assign resources (people) to activities:

- **Match skills to activities** — Don't assign a front-end developer to database optimization
- **Respect capacity** — No one should be assigned to overlapping activities at 100%
- **Account for overhead** — Meetings, reviews, support, context-switching (typically 60-70% productive)
- **Identify resource bottlenecks** — Is there a single person on the critical path? That's a risk.
- **Cross-training opportunities** — Where possible, pair to build redundancy

### Step 4: Buffer Strategy

**Project buffers absorb uncertainty.** In IDesign-informed project design:

- **Feeding buffers** — Placed where non-critical paths merge into the critical path
- **Project buffer** — Placed at the end of the critical path (typically 25-50% of critical path duration)
- **Resource buffers** — Alerts when critical-path resources are needed soon

**Buffer sizing:**
- Low confidence estimates → larger buffers
- Many external dependencies → larger buffers
- Experienced team → smaller buffers
- Well-understood domain → smaller buffers

### Step 5: Milestone Definition

Define milestones that provide meaningful checkpoints:

| Milestone Type | Purpose | Example |
|---------------|---------|---------|
| Architecture Complete | All interfaces defined and reviewed | Gate 3 passed |
| Foundation Ready | Utilities and shared infrastructure built | Framework available |
| Service Integration | First end-to-end workflow works | Happy path works |
| Feature Complete | All features implemented | All use cases pass |
| Release Candidate | Ready for final validation | QA signed off |

### Step 6: Schedule Visualization

Present the schedule as:
- **Gantt chart** (or textual equivalent) showing activities, dependencies, and critical path
- **Milestone timeline** showing key checkpoints
- **Resource calendar** showing who does what when
- **Risk overlay** showing where schedule risk is concentrated

## Inputs
- Activity List with estimates and dependencies (from activity breakdown)
- Skills Matrix (from activity breakdown)
- Team availability and capabilities
- External dependency timelines

## Outputs
- **Project Schedule** — Activities arranged on a timeline
- **Critical Path** — Identified and marked
- **Resource Assignments** — Who does what, when
- **Buffer Plan** — Where buffers are placed and why
- **Milestone Plan** — Key checkpoints with dates

## Quality Criteria
- [ ] Every activity dependency is respected in the schedule
- [ ] Critical path is identified and documented
- [ ] No resource is allocated beyond capacity
- [ ] Buffers are included and sized based on confidence levels
- [ ] Milestones provide meaningful progress checkpoints
- [ ] Schedule accounts for overhead (meetings, reviews, etc.)
