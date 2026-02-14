# Adopted Standards (MM-AI)

This document defines the enforceable standards used by this template.

Source context: derived from MM-AI methodology and IDesign principles. Keep this document in your own wording and update it for each project.

## 1) Architecture Standards

- Decompose by volatility, not by business function names.
- Every service has exactly one primary volatility justification.
- Interfaces are defined before implementation and are treated as architecture artifacts.
- All service interactions occur through interfaces/contracts.
- No circular dependencies in service call graph.

## 2) Taxonomy and Dependency Standards

- Client calls Managers only.
- Manager orchestrates sequencing only; no domain logic and no data access logic.
- Engine contains pure/stateless business logic; no direct data-store access.
- Resource Accessor encapsulates data/integration access only; no business rules.
- Utility contains cross-cutting concerns and may call only Utilities.
- Forbidden calls are release blockers.

## 3) Contract and API Standards

- Each operation defines: purpose, inputs, outputs, preconditions, postconditions, and errors.
- Error taxonomy uses explicit categories (Validation, NotFound, Conflict, Authorization, Infrastructure).
- Contracts are versioned and backward-compatibility strategy is documented.
- DTOs are explicit; no hidden side-effects across boundaries.

## 4) Implementation Standards

- Build order follows dependency graph bottom-up.
- Constructor/explicit dependency injection for service dependencies.
- No magic values in logic paths.
- Logging/telemetry at service boundaries and error boundaries.
- Architecture deviations require documented approval and remediation plan.

## 5) Testing and Quality Standards

- Must-have requirements have full traceability to tests.
- Engine/Utility logic has coverage at or above policy threshold.
- Integration tests exist at every declared service boundary.
- Critical and High defects at release gate must satisfy policy thresholds.
- Regression tests are added for all fixed Critical/High defects.

## 6) Governance Standards

- Every phase gate is evidence-backed (no assertion-only pass).
- Human architect approval is required at gate transitions.
- Exception handling requires explicit risk acceptance, approver, and expiry date.
- Change manifests are required for implementation steps that edit files.
- Gate status, evidence links, and decisions are auditable.

## 7) Enforcement Model

- Advisory: guidance that informs design decisions.
- Mandatory: gate-blocking rules; violation fails the gate.
- Default mandatory rules are tracked in CI policy (`.mm-ai/compliance-check-config.json`).

## 8) Local Overrides

Projects may add stricter standards. Any relaxation must include:
- reason,
- risk impact,
- approved by,
- expiry/review date.
