# Runbook: Jira And Confluence Delivery

## Metadata

- Last Reviewed: 2026-09-27
- Sources: `../AGENTS.md`, `../quick-start.md`, and `../knowledge/knowledge-lifecycle.md`
- Confidence: high
- Review When: organization policy, Jira or Confluence integration, field model, or approval workflow changes

## When To Use This

Use this workflow when work is tracked in Jira and longer-lived context, decisions, designs, or
operational guidance belongs in Confluence. Adapt field names, statuses, page locations, and
approval rules to the organization before any write.

As a default responsibility split, use Jira for actionable state, ownership, acceptance criteria,
dependencies, and delivery history. Use Confluence for structured context that should remain useful
beyond one issue, such as decisions, designs, investigation summaries, and runbooks. Cross-link the
canonical records instead of copying the same mutable content into both systems.

## Do Not Use This When

- The organization defines another source of truth or prohibits one of these systems.
- The task contains secrets, restricted evidence, or customer data that the target page or issue
  is not authorized to hold.
- The user has authorized analysis but not external writes.
- The exact issue, page, project, space, environment, or authenticated identity is unclear.

## Prerequisites

- Required access: read access to the relevant issue and page; write access only for approved edits.
- Required tools: the configured Jira and Confluence integrations for the current environment.
- Required inputs: exact issue key, target page or space, expected outcome, source evidence, and
  organization-specific workflow rules.
- Required authorization: fresh approval for each material external write, transition, creation,
  or publication step unless the consuming project's rules explicitly establish a narrower gate.

## Procedure

1. **Resolve canonical targets.** Confirm the Jira issue, Confluence page or parent location,
   authenticated identity, and whether each operation is read-only or mutating.
2. **Read before drafting.** Inspect current issue fields, comments, linked pages, page history, and
   authoritative source or runtime evidence. Do not rely on a copied excerpt when the current
   record is available.
3. **Establish the work contract.** Record objective, scope, acceptance evidence, permissions,
   blockers, and next action in one KB task note. Identify which facts belong in Jira, Confluence,
   or neither.
4. **Draft without writing.** Prepare the smallest update in local Markdown or the task note. Keep
   confirmed facts, inferences, decisions, and open questions distinguishable.
5. **Reconfirm the write gate.** Show the intended target and material change when authorization is
   required. Do not infer permission to transition an issue from permission to edit a page.
6. **Write to the canonical owner.** Update Jira with actionable delivery state and Confluence with
   durable explanatory context. Link between them using stable URLs or issue keys. Avoid parallel
   copies of status, large logs, and rapidly changing details.
7. **Read back the result.** Confirm the issue key, status or fields changed, page title and URL,
   revision or update marker, links, formatting, and visibility. A successful API response alone is
   not sufficient when readback is available.
8. **Update the KB task note.** Record what was written, validation evidence, unresolved items, and
   the next action. Promote only reusable conclusions through the knowledge lifecycle.

## Suggested Content Shapes

For Jira, keep the description or update centered on outcome, scope, acceptance criteria, current
state, blockers, and links to evidence. Use comments for dated progress or investigation results
when organization policy allows them.

For Confluence, lead with purpose and current conclusion, then include scope, evidence, decisions,
risks, ownership, validation, and references. Keep volatile execution state in Jira or the KB task
note rather than turning a durable page into a transcript.

## Stop Conditions

- Stop when the target, authenticated identity, classification, or write authorization is unclear.
- Stop when Jira and Confluence disagree on ownership or current state; resolve the source of truth
  before copying either conclusion.
- Stop when source evidence is stale, incomplete, or inaccessible and label the blocker.
- Do not switch integrations, create a replacement page, or transition a ticket as a fallback
  without approval.

## Validation

- Verify links in both directions when both records were updated.
- Confirm the final Jira status, fields, or comment and the final Confluence revision through
  readback.
- Check that no secrets, private tokens, restricted raw logs, or unnecessary personal data were
  published.
- Record the validation and remaining uncertainty in the active task note.

## Recovery Or Rollback

If a write is incorrect, preserve the system's audit trail. Correct the Jira field, status, or
comment using the organization's normal workflow. Restore or supersede the Confluence revision
rather than deleting history unless policy explicitly requires deletion. Record the correction and
why it was needed.

## References

- `../knowledge/knowledge-lifecycle.md`
- `../templates/task.md`
- `../templates/runbook.md`
