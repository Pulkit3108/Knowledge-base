# Effective Agent Collaboration

## Metadata

- Last Reviewed: 2026-09-23
- Sources: `../AGENTS.md`, `../quick-start.md`, and the repository task workflow
- Confidence: high
- Review When: the repository instruction hierarchy or task lifecycle changes

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

Agent-specific files should only direct the tool to `AGENTS.md` and `index.md`. Project knowledge,
task state, runbooks, and validation remain tool-neutral and version-controlled.
