# Quick Start

This is the canonical workflow for maintaining and using this knowledge base.

## 1. Establish Project Context

Complete `knowledge/project-overview.md` with the repository purpose, architecture, important
commands, ownership boundaries, external systems, and known risks. Link authoritative sources
instead of copying large documents.

## 2. Start Non-Trivial Work

Create one task note:

```bash
./scripts/new-task.sh short-task-name
```

Use one note per workstream. Update the existing note when a task continues across sessions or
agents. Do not create parallel notes merely because the chat or agent changed.

Keep these fields current:

- objective and scope;
- latest confirmed state;
- current conclusion;
- decisions and reasons;
- blockers and open questions;
- exact next action;
- validation performed;
- repository, branch, and working-tree state when relevant.

A task note is a compact continuation record, not a chronological transcript.

## 3. Research And Implement

Use this evidence order:

1. current source code, configuration, and tests;
2. official or primary external sources;
3. current live-system evidence when authorized and necessary;
4. maintained durable knowledge;
5. raw artifacts and older task notes;
6. explicitly labeled assumptions.

Keep raw evidence under `artifacts/`. Put reusable conclusions under `knowledge/`. Put repeatable
steps under `runbooks/`.

## 4. Validate Proportionally

Choose checks based on the change and risk. Examples include:

- formatting or link checks for documentation;
- focused tests for behavior changes;
- syntax or static analysis for scripts and configuration;
- source-to-output comparison for generated artifacts;
- readback after an authorized external write.

Run `./scripts/validate-kb.sh` whenever files, routing, templates, task lifecycle, or repository
instructions change.

## 5. Promote Reusable Knowledge

Promote a conclusion only when it is stable, useful beyond the task, and supported by a source.

- update an existing note before adding a new one;
- include sources, confidence, and a clear staleness condition;
- keep volatile identifiers and dated investigation detail in the task note or artifact;
- convert a workflow into a runbook after it repeats or is important enough to standardize;
- convert manual maintenance into a script only when deterministic automation adds value.

## 6. Close Or Pause The Task

For a paused task:

1. set its status to `on-hold`;
2. record the blocker and exact resume condition;
3. move it from `tasks/active/` to `tasks/on-hold/`.

For a completed task:

1. reconcile the conclusion and verification;
2. promote durable knowledge and procedures;
3. set its status to `closed`;
4. move it to `tasks/archive/`;
5. retain it only as long as it remains useful.

## Document Metadata

Maintained knowledge and runbooks should include:

- `Last Reviewed`: when the guidance was last checked;
- `Sources`: authoritative inputs or code paths;
- `Confidence`: high, medium, or low;
- `Review When`: the condition that makes the note potentially stale.

Task notes and raw artifacts do not use this metadata contract because their lifecycle and
provenance are recorded differently.

## Git And External Writes

Editing permission is not publishing permission. Require explicit user authorization before
committing, pushing, creating or merging pull requests, deploying, changing tickets or documents,
or mutating external systems. Verify the exact target and read back the result when practical.
