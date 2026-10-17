# Effective Agent Collaboration

## Metadata

- Last Reviewed: 2026-10-17
- Sources: `../AGENTS.md`, `../quick-start.md`, `knowledge-lifecycle.md`, and the repository task workflow
- Confidence: high
- Review When: the repository instruction hierarchy, task lifecycle, capability model, or supported
  tool integrations change

## Give The Agent A Verifiable Outcome

Describe the desired result, affected scope, important constraints, and what success looks like.
Provide exact paths, examples, or failure evidence when available.

Good requests answer four questions:

1. What outcome is needed?
2. Where is the relevant source or system?
3. What must not change?
4. How will completion be verified?

## Preserve Context In The Repository

Use one task note for work that spans multiple turns or agents. Keep the current conclusion,
blocker, next action, and verification near the top. The next agent should not need the original
chat transcript to continue safely.

## Use Evidence, Not Agent Confidence

Ask the agent to distinguish source-backed facts, inferences, and assumptions. Require current
source inspection when facts can drift. A confident explanation without evidence is not validation.

## Keep Permissions Explicit

Separate inspection, editing, publication, and external mutation. For example, permission to fix a
file does not automatically include permission to commit, push, deploy, or update a remote issue.

## Keep The Feedback Loop Short

- Prefer focused checks before full suites.
- Give concrete corrections when wording, scope, or behavior is wrong.
- Update the task note after material corrections so later agents do not repeat superseded ideas.
- Turn repeated feedback into a durable rule, runbook, validation check, or script.

## Use Any Agent Without Forking The Workflow

`AGENTS.md` is the only canonical instruction file. Prefer tools that read it directly or can be
configured to use it. Create a vendor-specific compatibility file only when current official
documentation and a real consuming tool require one; keep it as a minimal pointer to `AGENTS.md`
and `index.md` and record when it can be removed. Project knowledge, task state, runbooks, and
validation remain tool-neutral and version-controlled. Product names in bootstrap examples are
illustrative, not a supported-tool allowlist. Any agent or integration may participate when its
instruction-loading behavior, access boundary, and validation path are known.

## Understand The Capability Layers

These capability layers describe roles, not particular products or protocols. Use the smallest
capability that safely completes the work:

| Capability | Primary purpose | Use it when | Do not treat it as |
| --- | --- | --- | --- |
| Agent | Plans, reasons, acts, and validates within a scoped task | The work requires judgment across multiple steps | An independent source of truth or extra authorization |
| Skill | Reusable instructions for a task pattern | A known workflow benefits from consistent routing and checks | External-system access or proof that a step succeeded |
| Tool | One callable operation | The required action is narrow and its result can be validated | A workflow, policy, or durable decision record |
| MCP integration | Exposes external tools or resources through a defined interface | Agents repeatedly need governed access to a system or knowledge source | Permission to mutate that system or bypass its native controls |
| Script | Deterministic repository-local automation | Inputs, outputs, and failure behavior are stable | A substitute for judgment where context changes the correct action |

Keep authentication and machine-specific MCP configuration outside durable knowledge. Document the
integration contract, required permissions, safe operations, and validation path without recording
credentials.

## Use A Bounded Agentic Loop

An agentic workflow should have an observable stopping condition:

1. define the outcome, scope, constraints, and success evidence;
2. route to the smallest relevant knowledge, skill, tool, or MCP integration;
3. inspect current sources before relying on cached conclusions;
4. plan the smallest safe action and identify permission gates;
5. act within the authorized scope;
6. validate the result through tests, readback, or source comparison;
7. record current task state and promote only stable conclusions;
8. stop when the outcome is proven, a permission gate is reached, or required evidence is missing.

Iteration is useful only when new evidence changes the next action. Repeating the same failed call
without a new hypothesis, narrower scope, or changed external state is not progress.

## Delegate Without Losing Ownership

Delegate when independent investigations can proceed in parallel, different expertise is needed,
or one agent can validate another agent's bounded output. Keep tightly coupled edits and short
sequential work with one owner.

Every delegated task should state:

- the exact question or deliverable;
- allowed sources, paths, environments, and tools;
- prohibited writes and permission gates;
- expected evidence and completion criteria;
- the required response shape;
- files or external objects that another agent may also touch.

The coordinating agent owns synthesis, conflict resolution, final validation, and the user-facing
conclusion. Delegation does not transfer or expand authorization. Avoid concurrent writes to the
same file, branch, ticket, page, or production resource unless the workflow explicitly coordinates
them.

## Turn Repetition Into Reusable Capability

When similar work recurs, update the task note first, then use the promotion ladder in
`knowledge-lifecycle.md`. Prefer:

1. durable knowledge for stable understanding;
2. a runbook for a repeatable procedure with judgment or safety gates;
3. a script for deterministic local automation;
4. a skill for reusable agent instructions across variable contexts;
5. an MCP integration when repeated work needs governed access to an external system.

Do not create a tool or MCP server merely because an API exists. Require a recurring use case, a
clear trust boundary, owned authentication, predictable failure behavior, and a validation path.

## Resolve Capability Gaps Deliberately

When a workflow needs a capability that is not available, do not invent a command, silently switch
integrations, or weaken the workflow. Record a capability request with:

- the user outcome and repeated use cases;
- target systems, environments, objects, and owners;
- required read operations and separately listed write operations;
- authentication and secret ownership;
- least-privilege scopes and approval gates;
- inputs, outputs, schemas, pagination, rate limits, timeouts, and error behavior;
- audit, redaction, retention, and sensitive-data requirements;
- dry-run, readback, health check, and test strategy;
- the skill, runbook, script, tool, or MCP layer that should own each part; and
- fallback and stop behavior when the capability is unavailable.

Use a skill when agents need a reusable decision and procedure across variable contexts. Use an MCP
integration when agents need governed access to an external API or resource. A common workflow may
need both: the MCP exposes bounded operations, while the skill defines target resolution,
permission checks, sequencing, validation, and reporting.

Prefer read-only operations first. Expose mutations only when the API contract, authorization
model, idempotency, readback, audit, and recovery path are understood. The presence of a write tool
does not grant permission to use it.

When the user requests the missing capability, the agent may author a repository-local skill or MCP
implementation within the approved file scope. Treat installation into shared tooling, credential
configuration, registration, deployment, publication, and external-system test writes as separate
actions with their own permission gates. Validate a skill against representative tasks and validate
an MCP with schema tests, safe read operations, controlled failure cases, and readback for every
approved mutation.
