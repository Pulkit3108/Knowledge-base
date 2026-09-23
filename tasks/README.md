# Task Context

This folder stores short-lived working memory for non-trivial tasks.

## Layout

- `active/`: work currently in progress;
- `on-hold/`: intentionally paused work with a resume condition;
- `archive/`: recently closed notes awaiting eventual pruning.

## Workflow

Create a task with:

```bash
./scripts/new-task.sh short-task-name
```

Use one task note per workstream. Keep it concise and current. A task note should preserve enough
state for another agent to continue without the original conversation.

## Lifecycle

- Start in `active/` with status `open`.
- Move to `on-hold/` only after recording the blocker and resume condition.
- Before closure, promote stable findings to `knowledge/` and repeated procedures to `runbooks/`.
- Set status to `closed` and move the note to `archive/`.
- Do not treat archived task notes as current truth without reverification.

No live task note should exist directly under `tasks/`.
