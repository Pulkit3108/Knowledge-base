# Knowledge Lifecycle

## Metadata

- Last Reviewed: 2026-09-27
- Sources: `../AGENTS.md`, `../quick-start.md`, repository templates, and validation scripts
- Confidence: high
- Review When: document metadata, task lifecycle, repository structure, or capability guidance changes

## Purpose

Define how observations become maintained knowledge and, when useful, repeatable procedures or
automation. The goal is a knowledge base that grows through evidence without accumulating duplicate
or stale truth.

## Lifecycle

1. **Capture:** record task-specific evidence, decisions, uncertainty, and next actions in one task
   note. Store large raw evidence under `artifacts/`.
2. **Verify:** check the conclusion against current code, configuration, official documentation, or
   authorized live-system evidence.
3. **Promote:** move only stable and reusable conclusions into the existing canonical knowledge
   note. Include scope, sources, confidence, and a review trigger.
4. **Operationalize:** turn a repeated procedure into a runbook and deterministic repeated
   maintenance into a script. Use skills or MCP integrations only when their additional abstraction
   and trust boundary are justified.
5. **Review:** recheck knowledge when its `Review When` condition fires and use periodic age checks
   as a backstop.
6. **Retire:** remove, replace, or clearly mark superseded guidance after dependent routes and
   documents point to the new canonical source.

## Canonical Knowledge Records

A durable note should make each material claim recheckable. Record:

- the scope in which the claim is valid;
- the authoritative source or evidence;
- confidence and any unresolved boundary;
- the date the source was actually reviewed;
- the event that can make the claim stale;
- the replacement when guidance supersedes an older record.

Prefer repository-relative paths plus a stable symbol or heading over fragile line numbers. For an
external source, use an official URL and record the review date. For live evidence, record the
environment, target, capture time, and query or tool used. A task note or generated summary can
explain discovery, but it should not be the sole authority for durable truth.

## Promotion Ladder

Choose the lowest layer that provides lasting value:

| Repeated need | Canonical destination | Promotion test |
| --- | --- | --- |
| Stable explanation, ownership, constraint, or decision | `knowledge/` | Useful beyond one task and supported by a source |
| Procedure with prerequisites, judgment, permissions, or recovery | `runbooks/` | Repeated or important enough to standardize safely |
| Deterministic local transformation or validation | `scripts/` | Inputs, outputs, and failure behavior are stable and testable |
| Reusable agent behavior across varying projects | Skill | Instructions recur, but context still requires agent judgment |
| Governed access to an external system or knowledge source | MCP integration | Recurring demand, owned API/auth contract, bounded operations, and observable validation |

One workflow can use several layers, but each fact and procedure should have one canonical owner.
For example, durable knowledge explains a system, a runbook describes the safe workflow, a script
automates a deterministic check, and an MCP integration exposes authorized external operations.

## Freshness Model

Event-driven review is primary. Recheck guidance when a referenced source, API, dependency,
environment, owner, policy, schema, or workflow changes. Periodic review catches silent drift that
has no visible trigger.

Use review intervals based on change rate and consequence rather than one universal number:

- short intervals for operational endpoints, external APIs, active ownership, and security policy;
- medium intervals for maintained architecture, workflows, and tool contracts;
- longer intervals for stable principles and historical decisions whose sources remain fixed.

`../scripts/check-freshness.sh` reports documents whose `Last Reviewed` date exceeds a chosen age.
Age is a signal to inspect the source, not proof that the content is wrong. Do not update the date
until the listed sources and material claims have actually been checked.

## Conflict And Retirement

When two sources disagree, prefer the current authoritative source and record the conflict in the
active task note. Update the canonical durable note after verification. Then update routers and
dependent runbooks, identify the replacement in superseded content when it must remain for history,
and remove duplicate guidance that no longer has a distinct purpose.

## Validation Path

- Run `../scripts/validate-kb.sh` after structural, routing, or metadata changes.
- Run `../scripts/check-freshness.sh` with an interval appropriate to the project.
- Confirm every promoted claim can be traced to a current source without relying on the originating
  chat or agent session.

## References

- `../quick-start.md`
- `agent-collaboration.md`
- `../runbooks/knowledge-freshness-review.md`
- `../templates/durable-note.md`
