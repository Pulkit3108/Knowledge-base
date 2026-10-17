# Runbook: Bootstrap A Project Knowledge Base

## Metadata

- Last Reviewed: 2026-10-17
- Sources: `../AGENTS.md`, `../README.md`, `../quick-start.md`, current official instruction
  documentation for OpenAI Codex, Anthropic Claude Code, Google Gemini CLI, and GitHub Copilot
- Confidence: high
- Review When: repository structure, validation, supported instruction files, or official agent
  configuration behavior changes

## When To Use This

Use this runbook to adopt the portable KB in a new repository, service, platform, or organization.
The result should preserve the common lifecycle while replacing starter placeholders with
source-backed project context and policies.

## Do Not Use This When

- The target repository already has a maintained KB with a different canonical structure.
- The organization prohibits repository-local agent instructions.
- The required project, security, or access owners have not approved storing the proposed context.

## Prerequisites

- Required access: read access to the target source, official documentation, and system owners.
- Required tools: Git and a Markdown editor; agent tooling is optional.
- Required inputs: project scope, repositories, services, environments, delivery path, owners,
  permission policy, and validation commands.
- Required authorization: approval before modifying a target repository and separate approval for
  commit, push, or any external configuration write.

## Procedure

### 1. Choose The Placement

Use either a dedicated KB repository or a clearly owned folder in the target project. If nested
inside another repository, document whether it is tracked by the parent or is a separate checkout.
Keep machine-local state, credentials, large runtime captures, and private artifacts ignored.

### 2. Keep One Canonical Instruction File

Keep `AGENTS.md` as the only committed primary instruction file. Put routing in `index.md`,
workflow in `quick-start.md`, durable context in `knowledge/`, and procedures in `runbooks/`.
Do not copy the same rules into vendor-specific files.

Before adding a compatibility adapter, check the selected tool's current official documentation:

- [OpenAI Codex and AGENTS.md](https://developers.openai.com/cookbook/examples/codex/iterating-development-workflows-with-codex)
- [Anthropic Claude Code memory and project instructions](https://code.claude.com/docs/en/memory)
- [Google Gemini CLI context files](https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/gemini-md.md)
- [GitHub Copilot CLI custom instructions](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions)

These are compatibility examples, not required dependencies or a complete list of usable agents.
Apply the same verification process to any other agent, IDE, automation runner, or integration.

As checked on 2026-10-17, Codex uses `AGENTS.md`; current Claude Code and Copilot CLI can consume
`AGENTS.md`; and Gemini CLI can set `context.fileName` to `AGENTS.md`. Prefer those supported
paths over an adapter.

If a specific product or version still requires a vendor file:

1. verify its exact filename, location, hierarchy, and import behavior;
2. create only the one adapter required by that consuming project;
3. make it import or point to `AGENTS.md` and `index.md`;
4. do not repeat permission, coding, or workflow rules;
5. record the tool and version that requires it plus a removal condition; and
6. validate through the tool's context or memory inspection command.

Example fallback content:

```markdown
# Repository Instructions

Read and follow `AGENTS.md` as the canonical instruction source. Use `index.md` to load only the
task-relevant project context. Do not duplicate or override those rules here.
```

For Gemini CLI, prefer project configuration when supported:

```json
{
  "context": {
    "fileName": ["AGENTS.md"]
  }
}
```

Review generated configuration before committing it. Keep personal configuration and credentials
outside the repository.

### 3. Establish Project And System Context

Replace starter content in `knowledge/project-overview.md`. Copy
`templates/system-landscape.md` to a focused durable note and fill only verified information.
Capture repositories, services, dependencies, environments, compute, pipelines, APIs, databases,
observability, external context, owners, tools, MCP integrations, and skills.

Link to authoritative sources. Keep secrets, private addresses, short-lived identifiers, and local
paths in approved secret stores, external systems, or ignored local state.

### 4. Customize Permissions

Start from `knowledge/operational-access-and-environments.md`. Apply organization and
repository-specific constraints for branches, commits, pushes, PRs, APIs, databases, production,
Kubernetes, diagnostics, messaging, and destructive actions. Stricter applicable policy wins.

### 5. Record Delivery Conventions

Document branch naming, base selection, commit and PR format, review threshold, required checks,
build pipeline, deployment mapping, approval gates, rollback, and runtime verification. Add a
project-specific runbook only when the generic end-to-end workflow is insufficient.

### 6. Configure Capabilities

Inventory existing local tools, scripts, skills, protocol integrations, API clients, and external
connectors. An MCP server is one possible protocol integration, not a requirement. For each
integration, record owner, authentication route, supported read and write operations, environment
mapping, failure behavior, and validation. Do not record credentials.

When a recurring workflow lacks a capability, define the need using the capability-gap contract in
`../knowledge/agent-collaboration.md`. Request or create a skill for reusable procedure and an MCP
integration only for governed external-system access.

### 7. Exercise The Lifecycle

Create one sample task note, route it through the index, perform a harmless read-only workflow, run
the relevant validation, and close or archive the note. Verify that another agent can continue from
the repository without the original chat.

### 8. Validate

Run:

```bash
./scripts/validate-kb.sh
./scripts/check-freshness.sh
git diff --check
```

Inspect the complete diff. Confirm the KB has one canonical instruction source, no secrets, no
machine-local values, no copied organization-specific examples, and no unverified operational
claims.

## Stop Conditions

- Stop when the target repository or ownership model is unclear.
- Stop when proposed context includes credentials, sensitive evidence, or prohibited internal data.
- Stop before committing an adapter whose loading behavior has not been verified for the selected
  tool and version.
- Stop before any external configuration or repository publication without authorization.

## Validation

- `./scripts/validate-kb.sh` passes.
- The selected agent demonstrably loads `AGENTS.md` directly or through the verified adapter.
- The index routes to project context, system landscape, permissions, and the delivery workflow.
- A fresh agent can resolve one sample task, environment, evidence path, and permission gate.

## Recovery Or Rollback

Remove an unnecessary compatibility adapter and restore direct `AGENTS.md` loading. Revert
project-specific context to the last verified source-backed version rather than retaining a
plausible but unverified mapping. Git publication or history recovery follows the target
repository's normal process and requires authorization.

## References

- `../knowledge/operational-access-and-environments.md`
- `../knowledge/agent-collaboration.md`
- `end-to-end-agent-workflow.md`
- `../templates/system-landscape.md`
