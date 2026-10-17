# Project Overview

## Metadata

- Last Reviewed: 2026-10-17
- Sources: `../README.md`, `../AGENTS.md`, `../quick-start.md`, repository scripts, and templates
- Confidence: high
- Review When: repository structure, lifecycle rules, validation scripts, operational capability
  model, or supported agent instruction loading changes

## Purpose

Provide a portable, tool-neutral structure for preserving agent context, maintained project
knowledge, repeatable procedures, evidence, and deterministic maintenance without mixing their
different lifecycles or trust levels.

## Scope And Boundaries

- In scope: repository instructions, task-state lifecycle, durable knowledge, runbooks, evidence
  placement, reusable templates, validation, and local bootstrap guidance.
- Out of scope: organization-specific truth, runtime credentials, project source code, and direct
  ownership of external systems integrated by a consuming project.
- Safety boundaries: editing this repository never implies permission to publish Git changes or
  mutate external systems. Machine-local and sensitive values remain outside Git.

## Architecture

`AGENTS.md` is the only canonical instruction file and `index.md` routes agents to the smallest relevant
source. `tasks/` holds current working context. Stable findings move into `knowledge/`, repeated
procedures into `runbooks/`, and deterministic maintenance into `scripts/`. `artifacts/` preserves
evidence with limitations, while `local/` holds ignored machine-specific state. Templates keep the
document shapes consistent without becoming live truth.

## Repository Map

| Path | Purpose |
| --- | --- |
| `AGENTS.md` | Canonical operating and permission rules. |
| `index.md` | Minimal router into the knowledge base. |
| `quick-start.md` | Task, evidence, validation, promotion, freshness, and closure lifecycle. |
| `knowledge/` | Maintained project and engineering understanding. |
| `tasks/` | Active, paused, and archived working context. |
| `runbooks/` | Repeatable procedures with prerequisites and stop conditions. |
| `scripts/` | Deterministic creation and validation helpers. |
| `artifacts/` | Evidence that must retain provenance and limitations. |
| `local/` | Ignored machine-specific or sensitive state. |
| `templates/system-landscape.md` | Portable map for repositories, environments, delivery, data, observability, and capabilities. |

## Common Commands

```text
./scripts/new-task.sh short-task-name
./scripts/validate-kb.sh
./scripts/check-freshness.sh
```

## External Systems And Sources

This starter does not prescribe an external system. Consuming projects should list their current
repositories, official documentation, issue trackers, knowledge platforms, APIs, environments,
data stores, and ownership contacts here without including credentials or secret locations.
Use `../templates/system-landscape.md` for the detailed map and
`operational-access-and-environments.md` for access and permission boundaries.

## Known Risks And Constraints

- A copied knowledge base remains generic until `project-overview.md` and its permission boundaries
  are customized for the consuming project.
- Maintained notes can become stale; `Review When` triggers take precedence over age alone.
- Agent-specific compatibility files are not committed by default; if a tool requires one, it must
  remain a verified thin pointer so the workflow does not fork.
- Validation checks structure and metadata, not the factual correctness of every claim.

## Open Questions

- Which project-specific sources, integrations, owners, and review intervals should replace the
  starter defaults after adoption?
