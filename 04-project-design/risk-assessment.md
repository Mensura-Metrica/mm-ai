# Risk Assessment

## Purpose
Identify, quantify, and plan mitigations for risks that could derail the project. Risk management is proactive (prevent problems) not reactive (fight fires).

## Instructions

### Step 1: Risk Identification
Systematically identify risks across categories:

**Technical Risks**
- Architecture assumptions that might be wrong
- Technology choices with limited team experience
- Integration complexity with external systems
- Performance requirements that push limits
- Security requirements that constrain design

**Schedule Risks**
- Activities on the critical path with low-confidence estimates
- External dependencies with uncertain timelines
- Resource availability conflicts
- Sequential dependencies that prevent recovery from delays

**Scope Risks**
- Requirements that are volatile or uncertain
- Stakeholder disagreements not yet resolved
- Feature creep pressure
- Undiscovered requirements (regulated domains are notorious for this)

**Resource Risks**
- Key person dependencies (bus factor = 1)
- Skill gaps requiring ramp-up time
- Team members shared with other projects
- Vendor or contractor reliability

**Organizational Risks**
- Changing priorities or funding
- Stakeholder availability for decisions
- Organizational change during the project
- Compliance or legal review timelines

### Step 2: Risk Quantification
For each risk, assess:

| Factor | Scale | Description |
|--------|-------|-------------|
| **Probability** | 1-5 | 1=Rare, 2=Unlikely, 3=Possible, 4=Likely, 5=Almost Certain |
| **Impact** | 1-5 | 1=Negligible, 2=Minor, 3=Moderate, 4=Major, 5=Severe |
| **Risk Score** | P × I | 1-25, used for prioritization |
| **Detectability** | 1-5 | 1=Obvious, 5=Hidden until too late |

**Risk Priority:**
- Score 15-25: **Critical** — Must have active mitigation
- Score 8-14: **High** — Should have mitigation plan
- Score 4-7: **Medium** — Monitor and accept
- Score 1-3: **Low** — Acknowledge and move on

### Step 3: Mitigation Planning
For each Critical and High risk, define:

```
Risk: [Description]
Probability: [1-5]
Impact: [1-5]
Score: [P × I]
Category: [Technical / Schedule / Scope / Resource / Organizational]

Mitigation Strategy: [Avoid | Reduce | Transfer | Accept]
Mitigation Actions:
  - [Specific action to reduce probability or impact]
  - [Specific action...]
Trigger: [What observable event indicates this risk is materializing?]
Contingency: [What do we do if the risk materializes despite mitigation?]
Owner: [Who is responsible for monitoring this risk?]
```

**Mitigation Strategies:**
- **Avoid** — Change the plan to eliminate the risk entirely
- **Reduce** — Take action to lower probability or impact
- **Transfer** — Shift the risk to someone else (insurance, contracts, outsourcing)
- **Accept** — Acknowledge the risk and prepare to deal with it if it happens

### Step 4: Risk-Architecture Alignment
Cross-reference risks against the architecture:

- Which services are affected by each risk?
- Does the architecture's encapsulation limit the blast radius?
- Are there architectural changes that would reduce risk?
- Does the architecture create risks (e.g., single points of failure)?

### Step 5: Risk Monitoring Plan
Define how risks will be monitored during execution:

- **Review cadence** — How often are risks reviewed? (weekly minimum)
- **Triggers** — What observable events indicate a risk is materializing?
- **Escalation path** — Who needs to know when a risk materializes?
- **Status tracking** — How is risk status communicated to stakeholders?

## Inputs
- Activity List and Schedule (from activity breakdown and scheduling)
- Architecture artifacts (service catalog, call graph)
- Team and resource information
- External dependency information

## Outputs
- **Risk Register** — All identified risks with quantification
- **Mitigation Plans** — Actions for Critical and High risks
- **Risk-Architecture Map** — Which architectural components each risk affects
- **Monitoring Plan** — How risks will be tracked during execution

## Quality Criteria
- [ ] Risks from all five categories are considered
- [ ] Every risk has probability, impact, and score
- [ ] All Critical and High risks have mitigation plans
- [ ] Mitigation plans have specific, actionable steps (not "be careful")
- [ ] Triggers are defined for high-priority risks
- [ ] Risk-architecture alignment is documented
