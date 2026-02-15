# AI Interaction Log Template

Record all material AI interactions for auditability, traceability, and replayability.

## Usage Rules
- Log every material instruction and decision event.
- Use UTC timestamps in ISO-8601 format.
- Link each interaction to the relevant phase, artifact, and GitHub Issue (when applicable).
- Preserve execution order with a monotonic sequence number.
- Capture enough context to replay outcomes (inputs, references, outputs, and decisions).
- Do not rewrite history; append corrections as new entries.

## Clarity Requirements
- `Instruction (What)` must be explicit and action-oriented.
- `Context (Where)` must reference exact file/prompt/section or environment scope.
- `Trigger/Reason (Why)` must explain business/technical rationale.
- `Action Taken` must summarize the concrete action and resulting state.
- Avoid vague text such as "updated docs"; specify what changed.

## Replay Requirements
- Include a reproducible input snapshot reference (prompt/context source).
- Include output/artifact references and resulting commit SHA where relevant.
- Include tool/command evidence sufficient to reconstruct the action path.
- Record whether replay was validated and by whom.

## Interaction Entries

| Seq | Interaction ID | Timestamp (UTC) | Phase | Instructed By | AI Agent | Instruction (What) | Context (Where) | Trigger/Reason (Why) | Input Snapshot Ref | Action Taken | Tool/Command Evidence | Output/Artifact Links | Resulting Commit SHA | GitHub Issue | Replay Ready | Replay Verified By | Status |
|-----|----------------|-----------------|-------|---------------|----------|--------------------|-----------------|----------------------|--------------------|--------------|-----------------------|-----------------------|----------------------|--------------|-------------|--------------------|--------|
| 0001 | AI-0001 | [2026-02-15T10:30:00Z] | [Phase-#] | [Name/Role] | [Agent Name/Model] | [Instruction summary] | [Prompt/File/Section] | [Why requested] | [Path/URL to prompt/context snapshot] | [What AI did] | [Command/tool log ref] | [Path/URL] | [abc1234] | [#123] | [Yes/No] | [Name/Role] | [Logged/Verified] |

## Replay Procedure (Per Scope)
1. Identify interaction range by `Seq` or time window.
2. Retrieve input snapshot references and tool/command evidence.
3. Re-run commands/actions in original order.
4. Compare resulting artifacts and commit hashes (or diff-equivalent output) to expected outputs.
5. Record replay outcome and any divergence as a new log entry.

## Change Log
| Timestamp (UTC) | Changed By | Change Description |
|-----------------|------------|--------------------|
| [2026-02-15T10:35:00Z] | [Name/Role] | [Updated AI-0001 with verification link] |
