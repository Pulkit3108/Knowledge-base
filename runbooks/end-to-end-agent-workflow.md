# Runbook: End-To-End Agent Workflow

## Metadata

- Last Reviewed: 2026-10-17
- Sources: `../AGENTS.md`, `../quick-start.md`,
  `../knowledge/operational-access-and-environments.md`, `../knowledge/agent-collaboration.md`,
  and repository-owned delivery conventions in the consuming project
- Confidence: high
- Review When: permission policy, branch or PR convention, CI/CD workflow, environment mapping, or
  external integration changes

## When To Use This

Use this workflow for non-trivial investigation, implementation, review, delivery, or operational
verification that can span source control, external context, CI/CD, deployed environments,
databases, observability, or Kubernetes.

## Do Not Use This When

- A narrower project runbook owns the workflow.
- The user requested only an explanation or one bounded read.
- The exact repository, target environment, authenticated identity, or permission boundary cannot
  be established.
- Required access is unavailable and the user has not approved a different route.

## Prerequisites

- Required access: read access to relevant source and evidence; write access only for authorized
  actions.
- Required tools: current local source where available, plus configured integrations for required
  external systems.
- Required inputs: verifiable outcome, scope, acceptance evidence, target system or repository, and
  known constraints.
- Required authorization: explicit current approval for every commit and push and for each material
  external write not already requested as the exact action.

## Procedure

### 1. Establish The Work Contract

Define the outcome, in-scope and out-of-scope areas, success evidence, risks, and permission gates.
Create or resume exactly one active task note. Record repository, branch, worktree ownership, target
system, and the next action.

### 2. Resolve The System And Environment

Use the system landscape to map the request to the correct repositories, services, dependencies,
environment, account or region, cluster, namespace, API, database, pipeline, and observability
sources. State assumptions and stop when strong signals conflict. Never use a KB branch as evidence
of an application's deployed revision.

### 3. Gather Current Evidence

Read the smallest authoritative set needed:

1. current code, configuration, tests, and repository conventions;
2. issue, design, documentation, or chat context when relevant;
3. PR, build, deployment, and artifact metadata;
4. safe API and database reads;
5. logs, metrics, alarms, traces, Kubernetes state, and existing diagnostics.

Separate confirmed facts, evidence-backed inferences, assumptions, and unknowns. Record large raw
outputs as redacted artifacts only when they are necessary.

### 4. Select Capabilities

Route each need to the smallest suitable local tool, script, skill, or MCP integration. Verify
authentication, supported operations, environment mapping, and failure behavior. If a needed
capability is missing, follow the capability-gap process in
`../knowledge/agent-collaboration.md`; do not invent commands or silently switch integrations.

### 5. Prepare The Change

Inspect repository state, remote, default and destination branches, ownership, and unrelated work.
Use the consuming repository's branch convention. When local branch creation is permitted, start
from the verified intended base. Make the smallest complete implementation and keep code,
configuration, tests, and documentation aligned.

Do not commit or push without explicit current approval.

### 6. Validate Locally

Run focused checks first and broader checks in proportion to risk. Inspect the complete diff and
confirm no unrelated changes, secrets, generated noise, or unverified claims were introduced.
Update the active task note with commands, outcomes, skipped checks, and remaining risks.

### 7. Publish Git Changes

At the approval gate, show the exact repository, branch, staged scope, validation, and intended
commit. After approval:

1. verify the remote destination has not unexpectedly advanced;
2. stage only owned files and inspect the staged diff;
3. commit with the repository's required format;
4. push the exact branch; and
5. verify local and remote heads match.

Treat commit and push as separate authorized actions when project policy requires it.

### 8. Create Or Update The Pull Request

Use the repository template and conventions. Without a stronger format, include:

- outcome and motivation;
- scoped changes;
- validation performed and not performed;
- compatibility, security, data, and operational risks;
- deployment, rollback, or recovery notes;
- linked issue, design, evidence, and dependencies.

PR creation is an external write. Create it only when explicitly requested, then read it back and
verify repository, source, destination, title, body, head revision, checks, and URL.

### 9. Review The Pull Request

For review, inspect the exact PR head and merge-base diff. Trace affected callers, contracts,
authorization, persistence, concurrency, failure handling, tests, deployment effects, and downstream
consumers as relevant. Distinguish code findings from CI, approval, and deployment gates.

Preparing findings is read-only. Publishing comments, a review, approval, requested changes, merge,
close, or retarget is an external write and requires approval for that action.

### 10. Observe Build And Deployment

Read build and deployment status, stage results, tests, artifacts, approvals, and logs. Trigger,
retry, cancel, promote, deploy, or roll back only with explicit approval. Verify the exact revision
and target environment rather than assuming a successful build is deployed.

### 11. Verify Runtime Behavior

Use safe reads from APIs, databases, logs, metrics, alarms, traces, Kubernetes, and existing
diagnostic captures. Correlate environment, time, version, request or trace identifier, pod or
instance, and deployment. Passing tests or a healthy dashboard alone does not prove end-to-end
behavior.

Any repair, API mutation, database write, workload change, profiler attachment, diagnostic capture,
or external update requires its own approval and readback.

### 12. Close Or Hand Off

Reconcile the final outcome, validation, unresolved risk, and exact next action in the task note.
Promote only stable, source-backed knowledge. Update a runbook or request a skill, script, or MCP
integration when the workflow is likely to recur. Archive or pause the task note according to
`../quick-start.md`.

## Stop Conditions

- Stop when identity, repository, base, environment, target, authorization, or expected state is
  unclear.
- Stop when current authoritative sources conflict and the conflict changes the safe action.
- Stop before a mutation when only read permission exists.
- Stop when a required integration fails; diagnose the configured route and ask before switching.
- Stop when validation cannot establish the requested outcome and report the evidence gap.

## Validation

- Confirm the requested outcome against its observable success criteria.
- Verify remote Git and PR state after publication.
- Verify exact build, deployment, and runtime revision when delivery is in scope.
- Read back every authorized external write when the system supports it.
- Confirm the task note and durable documentation reflect the final state without copying secrets
  or raw transient output.

## Recovery Or Rollback

Use the consuming project's repository, deployment, database, and runtime recovery procedures.
Never improvise destructive rollback. Preserve audit history, record the exact failed action, and
obtain approval before a compensating write unless an existing approved incident procedure grants a
narrower authority.

## References

- `../knowledge/operational-access-and-environments.md`
- `../knowledge/agent-collaboration.md`
- `../templates/task.md`
- `../templates/system-landscape.md`
- `jira-confluence-delivery.md`
