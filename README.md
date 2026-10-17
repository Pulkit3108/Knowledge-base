# Portable Agent Knowledge Base

A small, reusable foundation for working with AI coding agents on any project.

It keeps project knowledge, active-task context, repeatable procedures, evidence, and machine-local
state in clearly separated places. The workflow is stored as ordinary Markdown and shell scripts,
so it can be used by any repository-aware agent that reads `AGENTS.md` directly or through a
verified compatibility configuration.

## What This Solves

Long-running agent work often loses context, repeats investigations, mixes temporary evidence with
trusted guidance, and accumulates conflicting instructions. This repository provides a consistent
way to:

- give every agent the same starting rules;
- preserve the current state of non-trivial work in one task note;
- promote stable findings into durable project knowledge;
- turn repeated workflows into validated runbooks or scripts;
- choose deliberately between agent instructions, skills, tools, MCP integrations, and delegated agents;
- resolve repositories, services, environments, APIs, databases, observability, and runtime targets;
- deliver through branches, pull requests, builds, deployments, and post-deployment verification;
- coordinate Jira work and Confluence knowledge without confusing their responsibilities;
- detect knowledge that needs review before stale guidance is reused;
- keep raw evidence and machine-local state away from canonical guidance;
- record confidence, sources, and staleness conditions instead of presenting guesses as facts.

## Structure

```text
.
├── AGENTS.md                    # Canonical instructions for every agent
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
4. Complete a system and environment map from `templates/system-landscape.md`.
5. Configure optional agent compatibility only if the selected tool cannot load `AGENTS.md`.
6. Create the first task:

   ```bash
   ./scripts/new-task.sh short-task-name
   ```

7. Validate the structure:

   ```bash
   ./scripts/validate-kb.sh
   ```

8. Review maintained knowledge for age and explicit refresh triggers:

   ```bash
   ./scripts/check-freshness.sh
   ```

Agents should begin with `AGENTS.md`, then use `index.md` to find only the context needed for the
current task.

## Operating Model

- [Operational access and environment model](knowledge/operational-access-and-environments.md)
  defines read-only capabilities, write gates, and the context needed for repositories, CI/CD,
  APIs, databases, observability, Kubernetes, and external knowledge.
- [End-to-end agent workflow](runbooks/end-to-end-agent-workflow.md) covers intake, investigation,
  implementation, branches, commit and push approval, PR creation and review, builds, deployments,
  runtime verification, and handoff.
- [Knowledge-base bootstrap](runbooks/bootstrap-knowledge-base.md) explains adoption, optional
  agent compatibility, permissions, system mapping, skills, and MCP integration requests.
- [System landscape template](templates/system-landscape.md) provides the portable structure a
  consuming project fills with its verified repositories, environments, services, and access routes.

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
- `AGENTS.md` remains the only canonical instruction file; compatibility adapters are optional,
  generated, and minimal.
- Commit and push only when the human explicitly authorizes those Git actions.

## Scope

This is a starter framework, not a universal source of truth. Adapt its project overview, safety
boundaries, runbooks, and validation rules to the repository and organization using it.

## License

Released under the [MIT License](LICENSE), so individuals and teams can reuse and adapt the
framework for their own projects.

Contributions are welcome when they preserve the framework's portability and safety boundaries.
See [CONTRIBUTING.md](CONTRIBUTING.md) before proposing changes.
