# Agent Instructions

These are the canonical repository instructions. Agent-specific entry files must point here rather
than duplicate these rules.

## Start Here

For non-trivial work:

1. read `index.md`;
2. read `quick-start.md`;
3. read the relevant files under `knowledge/` and `runbooks/`;
4. create or resume exactly one task note under `tasks/active/`;
5. keep that note current at material checkpoints;
6. run `./scripts/validate-kb.sh` after structural or workflow changes.

Do not load the entire knowledge base by default. Follow the router and read only what the task
requires.

## Source And Confidence Rules

- Prefer current code, configuration, official documentation, and live system evidence over local
  summaries.
- Treat durable knowledge as a maintained pointer, not an excuse to skip freshness checks.
- Treat task notes as working context, not durable truth.
- Treat artifacts as evidence of what was captured, not proof of current behavior.
- Clearly separate confirmed facts, evidence-backed inferences, assumptions, and unresolved
  questions.
- Never invent commands, APIs, production behavior, identifiers, or validation results.

## Working Rules

- Make the smallest complete change that satisfies the request.
- Preserve existing behavior unless the requested outcome requires changing it.
- Follow the repository's established conventions before adding new abstractions.
- Do not silently switch tools, integrations, environments, or data sources after a failure.
- Keep implementation, verification, and documentation aligned.
- Update an existing durable note or runbook instead of creating a competing document.
- Promote a repeated procedure into `runbooks/` and repeated deterministic maintenance into
  `scripts/`.
- Keep large outputs out of task notes. Store necessary evidence under `artifacts/` and link it.

## Permission And Safety Boundaries

- Read-only inspection is allowed when it is relevant to the assigned task.
- Editing files is allowed only within the user-requested scope.
- A request to edit or fix does not authorize committing, pushing, creating branches, opening pull
  requests, merging, deploying, or changing external systems.
- Require explicit current authorization before each material external write or Git publication
  step.
- Confirm exact targets before destructive, irreversible, production, or security-sensitive work.
- Never store secrets, access tokens, private keys, session cookies, or unredacted sensitive data.
- Preserve unrelated user changes in dirty working trees.

## Coding Principles

- Prefer simple, direct code over speculative frameworks.
- Validate inputs at trust boundaries.
- Keep functions and modules focused on one responsibility.
- Use descriptive names and comments that explain why, not obvious syntax.
- Add or update tests for behavior changes when a test surface exists.
- Use secure defaults and make risky behavior explicit.
- Run the narrowest relevant checks first, then broader checks when the risk justifies them.
- Report what was verified and what remains unverified.

## Documentation Placement

- `knowledge/`: stable project, architecture, domain, ownership, and decision context.
- `tasks/`: temporary task state, decisions, blockers, and handoff information.
- `runbooks/`: safe, repeatable procedures with prerequisites and validation.
- `artifacts/`: raw or generated evidence with provenance and limitations.
- `local/`: ignored machine-specific state and sensitive operational material.
- `templates/`: standard document shapes, not live project truth.

## Completion Standard

Before declaring a task complete:

- confirm the requested outcome exists;
- run relevant validation;
- inspect the final diff or resulting state;
- update the active task note;
- promote only stable, reusable conclusions;
- state remaining risks or unverified areas;
- leave commit and push decisions to the user's explicit authorization.
