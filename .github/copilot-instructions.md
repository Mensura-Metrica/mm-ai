# Copilot Instructions for MM-AI Methodology Project

## Project Context
This is a **methodology project**, not a code application. It contains markdown files that serve as LLM instructions to guide software development from inception through completion.

## Key Principles (IDesign Method)
- Architecture decisions are based on **volatility-based decomposition**, not functional decomposition
- Services follow the **IDesign taxonomy**: Managers, Engines, Resource Accessors, Utilities, Clients
- **Quality gates** guard every phase transition
- **Project Design** (scheduling, risk, cost) is a formal discipline, not an afterthought

## When Editing Files
- Maintain consistent markdown structure across all phase documents
- Every phase file should include: Purpose, Instructions (for the LLM agent), Inputs, Outputs, Quality Criteria
- Agent persona files define the role, expertise, and behavioral guidelines for that phase's LLM agent
- Gate checklists are binary pass/fail — no "partial" passes

## Tone & Style
- Authoritative but practical — prescriptive where it matters, flexible where it doesn't
- Instructions should be actionable by an LLM — clear, specific, with examples where helpful
- Avoid vague guidance like "consider quality" — instead specify what quality means in context
