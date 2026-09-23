# Artifacts

This folder stores evidence and references, not canonical guidance.

Examples include sanitized logs, API samples, reports, exported configuration, diagrams, and source
snapshots needed by a task.

## Rules

- Record provenance, capture time, scope, and known limitations near each retained artifact.
- Prefer links to live authoritative sources when a snapshot adds no lasting value.
- Never store credentials, tokens, private keys, unrestricted sensitive data, or proprietary
  material that cannot be shared.
- Keep generated or bulky evidence under ignored `generated/` or `logs/` folders unless there is a
  deliberate reason to version it.
- Link artifacts from their owning task note or durable document.
- Reverify freshness before using an artifact to make a current claim.
