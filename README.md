# Portable Agent Knowledge Base

A small, reusable foundation for working with AI coding agents on any project.

It keeps project knowledge, active-task context, repeatable procedures, evidence, and machine-local
state in clearly separated places. The workflow is stored as ordinary Markdown and shell scripts,
so it works with Codex, Claude Code, GitHub Copilot, Gemini CLI, and other repository-aware agents.

## What This Solves

Long-running agent work often loses context, repeats investigations, mixes temporary evidence with
trusted guidance, and accumulates conflicting instructions. This repository provides a consistent
way to:

- give every agent the same starting rules;
- preserve the current state of non-trivial work in one task note;
- promote stable findings into durable project knowledge;
- turn repeated workflows into validated runbooks or scripts;
- keep raw evidence and machine-local state away from canonical guidance;
- record confidence, sources, and staleness conditions instead of presenting guesses as facts.

## Structure

```text
.
├── AGENTS.md                    # Canonical instructions for every agent
├── CLAUDE.md                    # Claude entry point
├── GEMINI.md                    # Gemini entry point
├── .github/copilot-instructions.md
├── index.md                     # Fast router
├── quick-start.md               # Canonical workflow
├── bootstrap/                   # New-system setup manifests
├── knowledge/                   # Durable project and domain knowledge
├── tasks/                       # Active, paused, and recently closed task context
├── runbooks/                    # Repeatable procedures
├── artifacts/                   # Evidence and reference material
├── local/                       # Ignored machine-local state
├── scripts/                     # Repeated maintenance helpers
└── templates/                   # Standard document shapes
```

## Start In Five Minutes

1. Copy or clone this repository into a new project, or copy its contents into a dedicated KB
   folder inside that project.
2. Replace the placeholder project information in `knowledge/project-overview.md`.
3. Adjust permission boundaries and required checks in `AGENTS.md`.
4. Create the first task:

   ```bash
   ./scripts/new-task.sh short-task-name
   ```

5. Validate the structure:

   ```bash
   ./scripts/validate-kb.sh
   ```

Agents should begin with `AGENTS.md`, then use `index.md` to find only the context needed for the
current task.

## Core Model

| Content | Location | Lifetime |
| --- | --- | --- |
| Current work, decisions, blockers, next action | `tasks/` | Temporary |
| Stable project or domain understanding | `knowledge/` | Durable |
| Repeatable operational steps | `runbooks/` | Durable |
| Raw logs, exports, screenshots, and captured evidence | `artifacts/` | Evidence-dependent |
| Credentials, caches, personal paths, runtime output | `local/` | Machine-local, ignored |
| Repeated repository maintenance | `scripts/` | Durable |

For a new Mac, start with the reviewed [macOS workstation bootstrap](runbooks/macos-workstation-bootstrap.md).

## Design Principles

- One canonical source for each rule or fact.
- Small routers instead of giant documents loaded every time.
- Evidence before conclusions; current source before cached notes.
- One task note per workstream, kept current rather than used as a transcript.
- Scripts only after a workflow repeats or needs deterministic validation.
- Agent-specific files remain thin adapters to the shared workflow.
- Commit and push only when the human explicitly authorizes those Git actions.

## Scope

This is a starter framework, not a universal source of truth. Adapt its project overview, safety
boundaries, runbooks, and validation rules to the repository and organization using it.

## License

Released under the [MIT License](LICENSE), so individuals and teams can reuse and adapt the
framework for their own projects.

Contributions are welcome when they preserve the framework's portability and safety boundaries.
See [CONTRIBUTING.md](CONTRIBUTING.md) before proposing changes.
