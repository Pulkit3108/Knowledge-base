# Scripts

Use scripts for deterministic checks or workflows that repeat. Do not automate a process merely to
avoid documenting it.

## Inventory

| Script | Purpose | Mutates files? |
| --- | --- | --- |
| `new-task.sh` | Create a dated active task note from the canonical template. | Yes, one new task note. |
| `validate-kb.sh` | Check required structure, task placement, metadata, routing, and shell syntax. | No. |

## Usage

```bash
./scripts/new-task.sh short-task-name
./scripts/validate-kb.sh
```

Scripts use repository-relative paths and fail clearly when their assumptions are not met.
