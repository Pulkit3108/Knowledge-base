# Knowledge Base Index

Use this file to find the shortest reliable path for the current task.

## Start Here

- Operating rules: `AGENTS.md`
- Workflow and lifecycle: `quick-start.md`
- Project and domain knowledge: `knowledge/README.md`
- Current or paused work: `tasks/README.md`
- Repeatable procedures: `runbooks/README.md`
- Raw evidence and references: `artifacts/README.md`
- Machine-local state: `local/README.md`
- New-system setup manifests: `bootstrap/README.md`
- Repository helpers: `scripts/README.md`
- Reusable document shapes: `templates/README.md`

## Fast Routing

- Need to understand the project? Start with `knowledge/project-overview.md`.
- Need current task state? Find the single relevant note under `tasks/active/` or `tasks/on-hold/`.
- Need steps for a repeated operation? Check `runbooks/`.
- Need logs, exports, or captured evidence? Check `artifacts/` and verify freshness.
- Need credentials, caches, or machine-specific configuration? Follow `local/README.md`; never
  commit the underlying values.
- Need to prepare a new Mac? Follow `runbooks/macos-workstation-bootstrap.md`, review the included
  Brewfile, and install only the tools appropriate for that machine.
- Need to start a task? Run `./scripts/new-task.sh <short-name>`.
- Need to check the KB structure? Run `./scripts/validate-kb.sh`.

## Routing Rule

Do not read every folder automatically. Start with the smallest relevant source and expand only when
the task requires more evidence.
