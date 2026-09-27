# Runbook: Knowledge Freshness Review

## Metadata

- Last Reviewed: 2026-09-27
- Sources: `../quick-start.md`, `../knowledge/knowledge-lifecycle.md`, and `../scripts/check-freshness.sh`
- Confidence: high
- Review When: metadata contract, freshness script, source hierarchy, or document lifecycle changes

## When To Use This

Use this runbook when a `Review When` condition fires, before relying on potentially stale guidance,
or on a periodic schedule appropriate to the consuming project.

## Do Not Use This When

- The target is a task note or raw artifact; those use lifecycle and provenance rather than the
  durable-document freshness contract.
- The goal is merely to make an age check pass without reviewing authoritative sources.
- A current incident or security issue requires an immediate source check instead of a broad review.

## Prerequisites

- Required access: read access to the KB and every authoritative source being checked.
- Required tools: shell and any project-specific source or integration clients.
- Required inputs: review scope, age threshold, and triggered `Review When` conditions.
- Required authorization: read-only review by default; fresh approval for external writes or
  changes outside the KB editing scope.

## Procedure

1. Run the age check from the repository root:

   ```bash
   ./scripts/check-freshness.sh
   ```

   Use `--max-age-days N` when the project defines a different review interval.
2. Add documents whose `Review When` condition has fired even when their dates are recent.
3. For each document, read its sources and validate the material claims against current code,
   configuration, official documentation, or authorized live evidence.
4. Classify the result:
   - **current:** claims and boundaries remain supported;
   - **update required:** the canonical note or runbook must change;
   - **superseded:** another source now owns the guidance;
   - **blocked:** required evidence or access is unavailable.
5. Update content, sources, confidence, and `Review When` as needed. Change `Last Reviewed` only
   after the review completes.
6. Update routers and dependent documents if ownership or paths changed. Remove duplicate guidance
   only after references point to the canonical replacement.
7. Run structural validation and the freshness check again.

## Scheduling Options

Run the checker on a cadence that matches the project through a CI scheduler, a workstation task,
or an agent automation. The scheduled operation should remain read-only: run the checker, preserve
its output, and notify the owner when a document is stale or invalid.

Do not automatically advance review dates or rewrite knowledge. A scheduled failure should create
or resume a scoped review task that follows this runbook. Keep the interval and notification owner
in project-specific configuration rather than hardcoding organizational assumptions into this
portable starter.

## Stop Conditions

- Stop and mark the review blocked when an authoritative source is unavailable.
- Do not replace a source-backed conclusion with agent inference to clear a stale result.
- Do not mutate external sources or production systems without explicit authorization.

## Validation

```bash
./scripts/validate-kb.sh
./scripts/check-freshness.sh --max-age-days 90
git diff --check
```

Confirm that changed review dates correspond to completed source checks and that every update has a
clear canonical owner and review trigger.

## Recovery Or Rollback

If an update is later shown to be wrong, restore the last source-backed guidance from version
control, record the correction in the active task note, and repeat the review against current
sources. Do not hide the error by changing only metadata.

## References

- `../knowledge/knowledge-lifecycle.md`
- `../templates/durable-note.md`
- `../scripts/check-freshness.sh`
