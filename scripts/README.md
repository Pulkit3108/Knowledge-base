# Scripts

Use scripts for deterministic checks or workflows that repeat. Do not automate a process merely to
avoid documenting it.

## Inventory

| Script | Purpose | Mutates files? |
| --- | --- | --- |
| `new-task.sh` | Create a dated active task note from the canonical template. | Yes, one new task note. |
| `validate-kb.sh` | Check required structure, task placement, metadata, routing, and shell syntax. | No. |
| `check-freshness.sh` | Report maintained knowledge and runbooks that exceed a review-age threshold. | No. |

## Usage

```bash
./scripts/new-task.sh short-task-name
./scripts/validate-kb.sh
./scripts/check-freshness.sh
./scripts/check-freshness.sh --max-age-days 30
```

Scripts use repository-relative paths and fail clearly when their assumptions are not met.
