# Bootstrap Manifests

This folder contains reviewed, declarative setup inputs for new systems.

## Inventory

| Path | Purpose |
| --- | --- |
| `macos/Brewfile` | Baseline command-line tools and macOS applications installed with Homebrew Bundle. |

Always inspect a manifest before running it. Organization-managed devices may require MDM,
approved package sources, VPN software, endpoint security, or restricted application versions that
override this generic baseline.

Setup procedures and safety checks belong in `../runbooks/`; this folder stores only the inputs
consumed by those procedures.
