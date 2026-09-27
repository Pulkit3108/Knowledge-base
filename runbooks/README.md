# Runbooks

Repeatable procedures belong here.

## When To Create A Runbook

Create or update a runbook when a workflow repeats, has meaningful safety boundaries, or benefits
from one verified sequence. Do not create a runbook for one-off task chronology.

## Standard

Each runbook should include:

- metadata and authoritative sources;
- when to use it and when not to use it;
- prerequisites and permission boundaries;
- ordered steps with exact inputs;
- stop conditions and safe failure behavior;
- validation and rollback or recovery guidance when applicable.

Start from `../templates/runbook.md`. List new runbooks in this README so agents can discover them.

## Inventory

| Runbook | Purpose |
| --- | --- |
| `macos-workstation-bootstrap.md` | Prepare a secure, useful macOS engineering workstation. |
| `jira-confluence-delivery.md` | Coordinate issue work and durable documentation across Jira and Confluence. |
| `knowledge-freshness-review.md` | Review age signals and revalidate maintained knowledge against its sources. |
