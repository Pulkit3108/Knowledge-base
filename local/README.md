# Local State

Use this folder for machine-specific state that must not be committed, such as local paths, runtime
output, caches, temporary credentials, and personal environment notes.

Everything under `local/` is ignored except this README.

Rules:

- never force-add ignored local state;
- do not record secret values even in examples;
- prefer the official credential manager or secret store used by the project;
- document reusable setup procedures in `../runbooks/`, with placeholders instead of real values.
