#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE="$ROOT_DIR/templates/task.md"
ACTIVE_DIR="$ROOT_DIR/tasks/active"

usage() {
  printf 'Usage: %s <short-kebab-name>\n' "$(basename "$0")"
}

if [[ $# -ne 1 ]]; then
  usage >&2
  exit 2
fi

slug="$1"
if [[ ! "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  printf 'ERROR: task name must use lowercase kebab-case: %s\n' "$slug" >&2
  exit 2
fi

if [[ ! -f "$TEMPLATE" ]]; then
  printf 'ERROR: missing task template: %s\n' "$TEMPLATE" >&2
  exit 1
fi

today="$(date +%F)"
destination="$ACTIVE_DIR/task-$today-$slug.md"

if [[ -e "$destination" ]]; then
  printf 'ERROR: task already exists: %s\n' "$destination" >&2
  exit 1
fi

mkdir -p "$ACTIVE_DIR"
sed -e "s/{{DATE}}/$today/g" -e "s/{{SLUG}}/$slug/g" "$TEMPLATE" > "$destination"

printf 'Created %s\n' "${destination#"$ROOT_DIR/"}"
