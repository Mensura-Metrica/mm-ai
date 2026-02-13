# Gate 2: Product Definition → Architecture

## Gate Purpose
Verify that requirements are complete, consistent, and specific enough to drive architectural decisions. Poor requirements produce poor architecture — this gate prevents that.

## Checklist

### Product Brief
- [ ] Product name and description exist — *Can you explain the product in one sentence?*
- [ ] Target users are identified with personas — *Do we know who we're building for?*
- [ ] Core value proposition is clear — *Why would someone choose this over alternatives?*
- [ ] Key workflows (3-5) are identified — *Do we know the most important user journeys?*
- [ ] Success metrics are measurable — *Can we objectively determine success?*

### Requirements Completeness
- [ ] All key workflows have use cases — *Is every workflow analyzed with happy path, alternatives, and exceptions?*
- [ ] Functional requirements cover all use cases — *Is there a requirements gap?*
- [ ] Non-functional requirements are specified — *Performance, security, scalability, availability addressed?*
- [ ] Non-functional requirements are quantified — *"< 200ms" not "fast"?*
- [ ] Constraints are documented — *Technology, budget, regulatory limitations?*

### Requirements Quality
- [ ] Every functional requirement has acceptance criteria — *Can each be verified?*
- [ ] No two requirements contradict each other — *Has cross-reference been done?*
- [ ] Every requirement traces to a stakeholder need — *No orphan requirements?*
- [ ] Edge cases and error scenarios are addressed — *What happens when things go wrong?*

### Architecture Readiness
- [ ] Volatility tags are assigned to all requirements — *Stable / Volatile / Uncertain?*
- [ ] MoSCoW priority is assigned — *Must / Should / Could / Won't?*
- [ ] Integration requirements are identified — *What systems must this connect to?*
- [ ] Data requirements are understood — *What data does the system handle?*

## Gate Decision
- **PASS**: All items checked. Proceed to Architecture.
- **FAIL**: Return to Product Definition to address gaps.

## Gate Owner
The human stakeholder validates requirements accuracy. The LLM agent validates completeness and consistency.
