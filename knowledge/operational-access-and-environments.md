# Operational Access And Environment Model

## Metadata

- Last Reviewed: 2026-10-17
- Sources: `../AGENTS.md`, `../quick-start.md`, `agent-collaboration.md`, and the consuming
  project's authoritative source-control, CI/CD, runtime, API, database, observability, and
  access-control documentation
- Confidence: high
- Review When: access policy, environment topology, integration ownership, or the read/write
  classification of an operation changes

## Purpose

Define a portable model for what an agent may inspect, what context a project must maintain, and
which actions require explicit approval. A consuming project should refine this model with stricter
organization and repository rules where necessary.

## Authorization Model

Classify the intended operation before selecting a tool:

| Class | Default treatment | Examples |
| --- | --- | --- |
| Read-only discovery | Allowed when relevant to the assigned task and access is already available | Source and configuration inspection, PR diffs, build and deployment status, logs, metrics, alarms, traces, safe API reads, bounded database queries, Kubernetes listing and logs |
| Task-scoped local change | Allowed within the requested scope | Editing files, updating the active task note, running non-mutating validation, creating an isolated local branch when project policy permits |
| External or state-changing write | Explicit approval required | Commit, push, PR creation or submission, comments or approvals, build trigger, deployment, rollback, ticket or page edit, message send, API mutation, database write, Kubernetes change |
| Destructive, irreversible, production, or security-sensitive action | Explicit approval plus exact-target and recovery review | Data deletion, history rewrite, credential or policy change, production repair, schema change, forced restart, secret rotation |

Authorization does not flow from one class or target to another. Approval to push does not authorize
a PR, approval to create a PR does not authorize merge, and approval to update one environment does
not authorize another.

## Capability Boundaries

### Source Control And Pull Requests

The agent may inspect repositories, branches, history, ownership, diffs, PR metadata, checks, and
review state. It may review a PR and prepare findings without permission to publish comments.

Before branch work, verify the repository, remote, worktree, current state, destination branch,
fresh remote base, naming convention, and unrelated changes. A local branch may be created when the
requested delivery workflow needs isolation and project policy permits it. Every commit and push
requires explicit current approval.

PR titles and descriptions should follow repository conventions. In the absence of a stronger
template, include the outcome, motivation, material changes, validation, risks, rollback or recovery,
and linked work item. Creating the PR, submitting a review, commenting, approving, merging, closing,
or retargeting are external writes and require authorization for that action.

### Builds And Deployments

The agent may inspect pipeline definitions, build and deployment status, stage results, test reports,
artifacts, and logs. Separate code correctness, build status, approval gates, deployment status, and
runtime health in conclusions.

Triggering, retrying, cancelling, promoting, deploying, rolling back, changing variables, or
approving a gate changes external state and requires explicit approval. After an authorized action,
read back the exact run, revision, target environment, stage result, and relevant logs.

### APIs And External Services

Read-only API calls are allowed when they are relevant, bounded, and do not create sessions,
resources, locks, charges, or side effects. Do not assume `GET` is harmless; verify the API
contract when the operation can trigger work or expose sensitive data.

`POST`, `PUT`, `PATCH`, `DELETE`, GraphQL mutations, state-changing RPCs, ticket or document
updates, and messages require explicit approval. Validate the exact endpoint, environment, identity,
payload, idempotency behavior, and readback path first.

### Databases

The agent may perform bounded read-only queries when the correct connection, environment, database,
schema, and object are verified. Prefer metadata inspection, selective predicates, row limits,
appropriate timeouts, and query plans for potentially expensive reads.

Do not treat DML, DDL, `SELECT FOR UPDATE`, side-effecting functions or procedures, session changes
that alter shared behavior, or maintenance commands as read-only. Those operations require explicit
approval, a reviewed statement, affected-row or object bounds, transaction and rollback planning,
and post-write verification. Never place credentials or unredacted result sets in the KB.

### Logs, Metrics, Alarms, Traces, And Observability

The agent may query relevant logs, metrics, dashboards, alarms, traces, profiles, and service-health
signals. Correlate timestamps, environment, service, version, request or trace identifiers, and
deployment events. A dashboard definition or configured alarm does not prove the live signal path is
healthy.

Minimize retrieval of personal data, secrets, payloads, and large volumes. Store only necessary,
redacted evidence with provenance and retention limits. Editing dashboards, alerts, routing,
retention, or instrumentation is a write and requires approval.

### Kubernetes, Pods, Heap, And Memory

The agent may list and describe resources, inspect workload status, events, logs, existing resource
metrics, and already-captured diagnostics. Resolve the logical environment to the exact cluster,
context, namespace, workload, container, and revision before drawing conclusions.

Creating or deleting resources, applying manifests, scaling, restarting, evicting, changing
configuration, opening an ephemeral container, executing a mutating command, or attaching an
intrusive profiler requires explicit approval. Initiating heap dumps, flight recordings, core dumps,
or similar captures also requires a risk check because they can pause a process, consume disk or
memory, and contain secrets or personal data. Analyze an existing approved capture read-only and
keep large or sensitive artifacts outside Git.

### External Knowledge And Communication

The agent may read authorized issue trackers, documentation systems, chat, email, calendars, and
other sources when they materially improve the task. Treat messages and pages as context, not
automatically authoritative proof of current code or runtime behavior.

Creating or editing tickets, pages, comments, messages, calendar events, or notifications is an
external write and requires explicit approval. Never send on behalf of the user merely because
read access exists.

## Required System And Environment Context

A full project KB should make these relationships discoverable without storing secrets:

| Context | Minimum information |
| --- | --- |
| Repositories | Purpose, canonical remote, ownership, default and release branches, dependent repositories, local-clone guidance |
| Services and components | Responsibilities, callers, dependencies, entry points, data ownership, health endpoints |
| Environments | Purpose, lifecycle, region or account, branch or release mapping, restrictions, owner |
| Compute | Cluster or host mapping, namespace, workload and container names, access route, runtime limits |
| CI/CD | Pipeline and stage ownership, artifact flow, approvals, deployment target, rollback route |
| APIs | Base path or discovery source, authentication owner, read/write classification, request collection or schema |
| Databases | Database family, environment, connection alias, schema, ownership, migration path, query limits |
| Observability | Log source, metrics and dashboards, alarms, tracing/APM, correlation identifiers, retention |
| External context | Issue tracker, documentation, chat channels, support systems, source-of-truth boundaries |
| Capabilities | Available tools, protocol integrations such as MCP, skills, authentication owner, supported operations, validation path |

Start from `../templates/system-landscape.md`. Link to current authoritative sources rather than
copying volatile endpoints or inventories into multiple files.

## Environment Resolution

Resolve the environment from explicit user input first, then current task evidence, repository or
branch mapping, and the consuming project's documented default. Do not guess when signals conflict,
when the target is production, or when the operation is a write.

Before any live query, record or state the resolved environment and exact target. Before any write,
reconfirm identity, target, expected change, validation, and recovery. Never infer deployment state
from a branch name alone.

## Validation Path

- Confirm operation classification against the actual tool or API contract.
- Verify target and identity through a read before a write.
- Use readback or a second authoritative signal after an approved write.
- Record environment, time window, source, and limitations for live evidence.
- Review the capability matrix whenever a new integration or workflow is added.

## References

- `../runbooks/end-to-end-agent-workflow.md`
- `../runbooks/bootstrap-knowledge-base.md`
- `../templates/system-landscape.md`
- `agent-collaboration.md`
