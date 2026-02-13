# Requirements Gathering

## Purpose
Transform the Discovery Brief into structured, unambiguous requirements that the architecture phase can act on. This phase produces the Product Brief and the detailed Product Requirements Document (PRD).

## Agent Persona
[Product Owner Agent](product-owner-agent.md)

## Instructions

### Step 1: Product Brief
Create a concise product brief from the discovery outputs:
- **Product name** and one-line description
- **Problem statement** (refined from discovery)
- **Target users** with personas
- **Core value proposition** — Why would someone use this?
- **Key workflows** — The 3-5 most important things users do
- **Success metrics** — Measurable outcomes
- **Constraints** — Budget, timeline, technology, regulatory

Use template: [Product Brief Template](../templates/product-brief-template.md)

### Step 2: Use Case Analysis
For each key workflow identified in the Product Brief:
1. **Primary use case** — The happy path
2. **Alternative flows** — Valid variations
3. **Exception flows** — What goes wrong and how the system responds
4. **Pre-conditions** — What must be true before this use case starts
5. **Post-conditions** — What must be true after this use case completes
6. **Actors** — Who/what participates

### Step 3: Requirements Specification
Convert use cases into structured requirements:

**Functional Requirements (FR)**
- What the system must do
- Organized by domain area, not by UI screen
- Each requirement: ID, description, priority (MoSCoW), source use case, acceptance criteria

**Non-Functional Requirements (NFR)**
- **Performance** — Response times, throughput, concurrent users
- **Scalability** — Growth expectations and load patterns
- **Security** — Authentication, authorization, data protection, compliance
- **Availability** — Uptime requirements, recovery time objectives
- **Usability** — Accessibility standards, device support
- **Maintainability** — Logging, monitoring, debugging requirements

**Constraints**
- Technology constraints (mandated platforms, languages, integrations)
- Business constraints (budget, timeline, team size)
- Regulatory constraints (compliance requirements)

### Step 4: Volatility Tagging
For each requirement, assess its **stability**:
- **Stable** — Unlikely to change within the product's lifecycle
- **Volatile** — Likely to change based on feedback, market, regulation, or business evolution
- **Uncertain** — Not enough information to assess; needs validation

This tagging is critical input to the Architecture phase's volatility analysis.

### Step 5: PRD Compilation
Compile all the above into a formal PRD using: [PRD Template](../templates/prd-template.md)

## Inputs
- Discovery Brief (from Phase 1)
- Stakeholder Map (from Phase 1)
- Volatility Signals (from Phase 1)
- Direct stakeholder access for clarification

## Outputs
- **Product Brief** — Executive summary of the product
- **Use Case Document** — Detailed use case analysis
- **Product Requirements Document (PRD)** — Complete requirements specification
- **Requirements Traceability** — Map from stakeholder needs → requirements
- **Volatility Tags** — Stability assessment for each requirement

## Quality Criteria
- Every functional requirement has acceptance criteria
- Non-functional requirements are quantified (not "fast" but "< 200ms")
- No requirement contradicts another requirement
- Every requirement traces back to a stakeholder need or discovery finding
- Volatility tags are assigned to all requirements
- MoSCoW priority is assigned to all requirements
- Edge cases and error scenarios are addressed
