# Agent Instructions

This is the only canonical repository instruction file. The knowledge model and workflows are
agent- and integration-neutral: any agent may use them through whatever local tools, scripts,
skills, APIs, or protocol integrations the consuming project has verified. Do not add `CLAUDE.md`,
`GEMINI.md`, `.github/copilot-instructions.md`, or another agent-specific instruction file by
default. When a selected tool cannot load `AGENTS.md` directly or through configuration, follow
`runbooks/bootstrap-knowledge-base.md` to create the smallest verified compatibility adapter
without duplicating these rules.

## Start Here

For non-trivial work:

1. read `index.md`;
2. read `quick-start.md`;
3. read the relevant files under `knowledge/` and `runbooks/`;
4. create or resume exactly one task note under `tasks/active/`;
5. keep that note current at material checkpoints;
6. resolve the target repository, system, environment, and permission gates before acting; and
7. run `./scripts/validate-kb.sh` after structural or workflow changes.

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
- Ask for help when authoritative sources conflict, the target or environment cannot be resolved,
  a required capability is unavailable, or proceeding would depend on an unsafe assumption. Do not
  invent details to avoid a necessary question.

## Permission And Safety Boundaries

- Relevant read-only inspection is allowed across source repositories, pull requests, CI/CD status
  and logs, deployed APIs, databases, observability systems, Kubernetes resources, issue trackers,
  knowledge platforms, and communication systems when access is available.
- Editing files is allowed only within the user-requested scope.
- A local branch may be created when the requested workflow needs isolation and the correct base,
  target, naming convention, and working-tree ownership are verified. A consuming repository may
  impose a stricter branch-creation gate.
- A request to edit or fix never authorizes a commit or push. Require explicit current approval
  before each commit and push.
- Pull-request creation, review submission, comments, approvals, merges, deployments, build
  triggers, API mutations, database writes, runtime changes, and other external writes require
  explicit approval unless the user already requested that exact action in the current task.
- Read-only database access means bounded queries that do not lock or mutate state. DML, DDL,
  stored procedures with side effects, `SELECT FOR UPDATE`, and equivalent operations are writes.
- Kubernetes reads such as listing resources, describing objects, reading logs and events, and
  inspecting existing metrics are allowed when relevant. Applying manifests, scaling, restarting,
  deleting, executing mutating commands, attaching an intrusive profiler, or creating a diagnostic
  artifact that can affect the workload requires explicit approval.
- Confirm exact targets before destructive, irreversible, production, or security-sensitive work.
- Never store secrets, access tokens, private keys, session cookies, or unredacted sensitive data.
- Preserve unrelated user changes in dirty working trees.
- Follow `knowledge/operational-access-and-environments.md` for the complete capability matrix and
  `runbooks/end-to-end-agent-workflow.md` for delivery flow.

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

## Operational Context

A consuming project must maintain enough source-backed context to resolve:

- repositories, services, dependencies, owners, and authoritative documentation;
- environments, regions, clusters, namespaces, accounts, databases, and deployment mappings;
- branch, build, release, and rollback conventions;
- API, database, observability, and Kubernetes access routes;
- available tools, protocol integrations such as MCP, skills, authentication ownership, and
  read/write boundaries.

Start from `templates/system-landscape.md`. Keep volatile or sensitive values in approved external
systems or ignored local state, and link to them without copying credentials.

## Completion Standard

Before declaring a task complete:

- confirm the requested outcome exists;
- run relevant validation;
- inspect the final diff or resulting state;
- update the active task note;
- promote only stable, reusable conclusions;
- state remaining risks or unverified areas;
- leave commit and push decisions to the user's explicit authorization.
