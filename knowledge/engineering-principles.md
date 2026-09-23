# Engineering Principles

## Metadata

- Last Reviewed: 2026-09-23
- Sources: `../AGENTS.md` and `../quick-start.md`
- Confidence: high
- Review When: project-specific engineering standards replace or refine these defaults

## Simplicity

- Implement the smallest complete solution.
- Avoid abstractions for hypothetical future needs.
- Prefer readable control flow and explicit data movement.
- Reuse established project patterns when they remain safe and suitable.

## Correctness

- Define observable success before implementation.
- Validate inputs and external responses at trust boundaries.
- Preserve contracts unless a requested change explicitly alters them.
- Test failure paths and boundary cases in proportion to risk.

## Security

- Never hardcode credentials or sensitive values.
- Use least privilege and secure defaults.
- Treat external content, generated output, and user input as untrusted until validated.
- Avoid logging secrets or unnecessary personal data.

## Maintainability

- Keep responsibilities narrow and names descriptive.
- Explain non-obvious decisions, not obvious syntax.
- Remove only dead code created by the current change unless broader cleanup is requested.
- Keep documentation and commands aligned with current behavior.

## Verification

- Run the narrowest relevant checks first.
- Inspect final diffs for accidental scope expansion.
- Separate passing automated checks from untested runtime assumptions.
- Report known gaps clearly instead of hiding them behind general confidence.
