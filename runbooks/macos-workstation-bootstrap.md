# Runbook: Bootstrap A macOS Workstation

## Metadata

- Last Reviewed: 2026-09-23
- Sources: Homebrew installation and Bundle documentation, current Homebrew cask catalog, official application pages, and Apple platform security controls
- Confidence: high for the baseline; medium for optional applications and organization-specific setup
- Review When: Homebrew syntax, cask names, application availability, minimum macOS versions, or organization security requirements change

## When To Use This

Use this runbook to prepare a new or reset Mac for general software engineering and knowledge-base
work. It provides a conservative baseline plus an optional catalog rather than assuming every
developer needs the same stack.

## Do Not Use This When

- The Mac is managed by an organization whose MDM or software catalog owns installation.
- Security policy prohibits Homebrew, third-party clipboard history, screen capture, or unmanaged
  developer tools.
- The machine contains existing setup that has not been backed up or reviewed.

## 1. Secure The Machine First

Before installing development tools:

1. Install current macOS updates.
2. Enable FileVault and confirm the recovery method.
3. Configure Touch ID, automatic screen locking, and Find My Mac as appropriate.
4. Install and sign in to the approved password manager.
5. Complete required MDM, VPN, endpoint-security, and corporate account setup.
6. Sign in to the Mac App Store only if App Store applications are required.

Do not copy private keys, tokens, or `.env` files into this repository. Restore credentials through
their approved password manager, keychain, or organization process.

## 2. Install Homebrew

Use the command shown on the official Homebrew website rather than an installer copied from an
untrusted page. Review the script source and expected changes before confirming installation.

Homebrew requires supported macOS and may require the Xcode Command Line Tools:

```bash
xcode-select --install
```

After installation, follow Homebrew's printed `brew shellenv` instruction, then verify:

```bash
brew --version
brew doctor
```

## 3. Review And Apply The Baseline

Open `bootstrap/macos/Brewfile` and remove anything unnecessary for the machine. The baseline
contains current Git and shell utilities plus:

| Application | Purpose | Important note |
| --- | --- | --- |
| Visual Studio Code | General-purpose editor | Add extensions intentionally; avoid restoring an unknown extension set. |
| iTerm2 | Terminal emulator | Apple's Terminal is sufficient if an additional terminal is unnecessary. |
| Maccy | Lightweight clipboard history | Exclude password managers and sensitive applications from capture. Requires macOS 14 or newer at the time of review. |
| Rectangle | Keyboard-driven window management | Requires Accessibility permission for window control. |
| DBeaver Community | Database and SQL client | Store credentials in the system keychain; verify drivers before connecting to managed systems. |
| Microsoft OneNote | Synced notes | Requires a Microsoft or organization account. The current Homebrew cask requires macOS 14 or newer. |

Preview what is missing:

```bash
brew bundle check --file=bootstrap/macos/Brewfile --verbose
```

Install the reviewed baseline without upgrading unrelated existing packages:

```bash
brew bundle install --file=bootstrap/macos/Brewfile --no-upgrade
```

Run the check again after installation. A successful check means the declared applications are
present; it does not prove that accounts, permissions, or project-specific tooling are configured.

## 4. Install Grab2Text Carefully

Grab2Text provides quick OCR for text in images, PDFs, presentations, videos, and other on-screen
content. It is not included in the Brewfile because no verified Homebrew cask is available, and its
linked App Store page was unavailable when this runbook was reviewed.

If it is still needed:

1. use the publisher page at `https://www.softwarehow.com/grab2text/`;
2. verify the download is signed and accepted by macOS Gatekeeper;
3. grant Screen Recording or Accessibility access only when the feature requires it;
4. avoid capturing secrets, private conversations, customer data, or regulated information;
5. remove its permissions if the application is no longer used.

Do not automate or mirror the DMG in this repository.

## 5. Optional Application Catalog

Add only role-appropriate entries to a personal or project-specific Brewfile.

| Category | Applications | Use when |
| --- | --- | --- |
| Browsers | Google Chrome, Firefox | Browser compatibility, profiles, or developer tools require them. |
| Containers | Docker Desktop or OrbStack | The project runs containers locally; review licensing and organization policy first. |
| API tools | Bruno or Postman | Repeated API exploration benefits from saved, shareable requests. |
| Communication | Slack, Microsoft Teams, Zoom | Required by the team or organization. |
| Knowledge | Obsidian | Local Markdown notes complement, but do not replace, repository knowledge. |
| Utilities | AppCleaner, Keka, IINA or VLC, LocalSend | Uninstall cleanup, archives, media, or local file transfer is needed. |
| Launchers | Raycast | A launcher and automation platform is useful; avoid duplicating Maccy's clipboard role unnecessarily. |
| IDEs | JetBrains Toolbox, Android Studio | The project language or platform requires them. |
| AI tools | Codex, Claude Code, Gemini CLI | The organization permits the tool and its data-handling model. Configure each to follow `AGENTS.md`. |

Prefer one tool per role until a concrete need justifies another. Fewer background applications
reduce update load, permissions, resource use, and overlapping shortcuts.

## 6. Restore Development Identity Safely

1. Set Git name and email for the correct personal or organization identity.
2. Generate or restore SSH keys through the approved process; do not copy private keys into the KB.
3. Authenticate GitHub CLI interactively:

   ```bash
   gh auth login
   gh auth status
   ```

4. Clone projects from verified remotes.
5. Restore language runtimes and project dependencies from version-controlled manifests rather
   than global ad hoc installs.

Keep personal and organization Git identities separate when both are used on the same machine.

## Validation

- `brew doctor` reports no unexplained blocking issue.
- `brew bundle check --file=bootstrap/macos/Brewfile --verbose` succeeds for the chosen baseline.
- Git author identity and remote authentication match the intended account.
- FileVault, lock settings, password manager, and required organization controls are active.
- Clipboard, Accessibility, Screen Recording, Full Disk Access, and background-item permissions are
  limited to applications that need them.
- A small test repository can be cloned, edited, validated, and authenticated without exposing a
  secret.

## Recovery And Maintenance

- Remove unwanted Brewfile entries before uninstalling them so the declared state stays accurate.
- Use `brew bundle cleanup --file=bootstrap/macos/Brewfile` only after reviewing its dry-run output;
  it can remove software not declared in the file.
- Periodically review login items, privacy permissions, Homebrew packages, and unused credentials.
- Update this runbook when a cask name, minimum macOS version, or verified installation route changes.

## References

- Homebrew installation: `https://docs.brew.sh/Installation`
- Homebrew Bundle and Brewfile: `https://docs.brew.sh/Brew-Bundle-and-Brewfile`
- Homebrew package catalog: `https://formulae.brew.sh/`
- Maccy: `https://github.com/p0deje/Maccy`
- Grab2Text: `https://www.softwarehow.com/grab2text/`
- DBeaver Community: `https://dbeaver.io/download/`
- Microsoft OneNote: `https://support.microsoft.com/en-us/onenote/how-to-download-onenote`
- GitHub CLI: `https://cli.github.com/`
