#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

failures=0

fail() {
  printf 'FAIL: %s\n' "$1"
  failures=$((failures + 1))
}

check_file() {
  if [[ ! -f "$1" ]]; then
    fail "missing required file: $1"
  fi
}

check_text() {
  local file="$1"
  local text="$2"
  local message="$3"

  if [[ -f "$file" ]] && ! grep -Fq -- "$text" "$file"; then
    fail "$message"
  fi
}

required_files=(
  README.md
  LICENSE
  CONTRIBUTING.md
  AGENTS.md
  CLAUDE.md
  GEMINI.md
  .github/copilot-instructions.md
  index.md
  quick-start.md
  bootstrap/README.md
  bootstrap/macos/Brewfile
  knowledge/README.md
  knowledge/project-overview.md
  tasks/README.md
  tasks/active/README.md
  tasks/on-hold/README.md
  tasks/archive/README.md
  runbooks/README.md
  runbooks/macos-workstation-bootstrap.md
  artifacts/README.md
  local/README.md
  scripts/README.md
  scripts/new-task.sh
  scripts/validate-kb.sh
  templates/README.md
  templates/task.md
  templates/durable-note.md
  templates/runbook.md
)

for file in "${required_files[@]}"; do
  check_file "$file"
done

check_text LICENSE 'MIT License' 'LICENSE must contain the MIT License heading'
check_text bootstrap/macos/Brewfile 'cask "maccy"' 'Brewfile must include Maccy'
check_text bootstrap/macos/Brewfile 'cask "dbeaver-community"' 'Brewfile must include DBeaver Community'
check_text bootstrap/macos/Brewfile 'cask "microsoft-onenote"' 'Brewfile must include Microsoft OneNote'
check_text runbooks/macos-workstation-bootstrap.md 'Grab2Text' 'macOS runbook must cover Grab2Text'

for adapter in CLAUDE.md GEMINI.md .github/copilot-instructions.md; do
  check_text "$adapter" 'AGENTS.md' "$adapter must route to AGENTS.md"
  check_text "$adapter" 'index.md' "$adapter must route to index.md"
done

for file in knowledge/*.md; do
  [[ "$file" == 'knowledge/README.md' ]] && continue
  check_text "$file" '## Metadata' "$file is missing Metadata"
  check_text "$file" '- Last Reviewed:' "$file is missing Last Reviewed"
  check_text "$file" '- Sources:' "$file is missing Sources"
  check_text "$file" '- Confidence:' "$file is missing Confidence"
  check_text "$file" '- Review When:' "$file is missing Review When"
done

for file in runbooks/*.md; do
  [[ "$file" == 'runbooks/README.md' ]] && continue
  check_text "$file" '## Metadata' "$file is missing Metadata"
  check_text "$file" '- Last Reviewed:' "$file is missing Last Reviewed"
  check_text "$file" '- Sources:' "$file is missing Sources"
  check_text "$file" '- Confidence:' "$file is missing Confidence"
  check_text "$file" '- Review When:' "$file is missing Review When"
  check_text "$file" '## Validation' "$file is missing Validation"
done

while IFS= read -r file; do
  if [[ ! "$(basename "$file")" =~ ^task-[0-9]{4}-[0-9]{2}-[0-9]{2}-[a-z0-9]+(-[a-z0-9]+)*\.md$ ]]; then
    fail "task note has invalid filename: $file"
  fi
  check_text "$file" '## Status' "$file is missing Status"
  check_text "$file" '## Latest State' "$file is missing Latest State"
  check_text "$file" '## Verification' "$file is missing Verification"
done < <(find tasks/active tasks/on-hold tasks/archive -maxdepth 1 -type f -name 'task-*.md' | sort)

while IFS= read -r file; do
  if [[ ! -x "$file" ]]; then
    fail "shell script is not executable: $file"
  fi
  if ! bash -n "$file"; then
    fail "shell script has invalid syntax: $file"
  fi
done < <(find scripts -maxdepth 1 -type f -name '*.sh' | sort)

if find tasks -maxdepth 1 -type f ! -name 'README.md' | grep -q .; then
  fail 'task notes must live under active, on-hold, or archive'
fi

if [[ $failures -gt 0 ]]; then
  printf '\nKnowledge-base validation failed with %d issue(s).\n' "$failures" >&2
  exit 1
fi

printf 'Knowledge-base validation passed.\n'
