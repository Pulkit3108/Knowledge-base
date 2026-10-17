# Contributing

Contributions should keep this knowledge-base starter small, portable, and useful across projects
and AI agents.

## Before Changing The Repository

1. Read `AGENTS.md`, `index.md`, and `quick-start.md`.
2. Check whether an existing note, runbook, template, or script already owns the topic.
3. Keep organization-specific knowledge out of the generic starter.
4. Never include credentials, private keys, tokens, proprietary evidence, or personal machine state.

## Placement

- reusable understanding: `knowledge/`;
- repeatable procedure: `runbooks/`;
- evidence: `artifacts/`;
- deterministic repeated maintenance: `scripts/`;
- standard document shape: `templates/`;
- new-system declarative setup: `bootstrap/`.

`AGENTS.md` is the only canonical instruction file. Do not commit agent-specific adapters by
default. If a consuming project requires one, follow `runbooks/bootstrap-knowledge-base.md`, keep
it as a minimal pointer to `AGENTS.md` and `index.md`, and verify the selected tool actually loads
it.

## Validation

Run before submitting a change:

```bash
./scripts/validate-kb.sh
git diff --check
```

For script changes, test the successful path and at least one relevant failure path without
mutating a real project or external system.

## Change Quality

- explain the problem and intended outcome;
- cite authoritative sources for claims that can drift;
- document permissions, stop conditions, and validation for risky procedures;
- avoid duplicate guidance and speculative abstractions;
- keep examples sanitized and reusable.
