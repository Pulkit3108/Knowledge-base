#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MAX_AGE_DAYS=90

usage() {
  printf 'Usage: %s [--max-age-days N]\n' "$(basename "$0")"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --max-age-days)
      if [[ $# -lt 2 ]]; then
        usage >&2
        exit 2
      fi
      MAX_AGE_DAYS="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 2
      ;;
  esac
done

if [[ ! "$MAX_AGE_DAYS" =~ ^[0-9]+$ ]]; then
  printf 'ERROR: --max-age-days must be a non-negative integer: %s\n' "$MAX_AGE_DAYS" >&2
  exit 2
fi

parse_date() {
  local value="$1"

  if date -j -f '%Y-%m-%d' "$value" '+%s' >/dev/null 2>&1; then
    date -j -f '%Y-%m-%d' "$value" '+%s'
  elif date -d "$value" '+%s' >/dev/null 2>&1; then
    date -d "$value" '+%s'
  else
    return 1
  fi
}

now_epoch="$(date '+%s')"
checked=0
stale=0
invalid=0

while IFS= read -r file; do
  reviewed="$(sed -n 's/^- Last Reviewed: //p' "$file" | head -n 1)"
  relative="${file#"$ROOT_DIR"/}"
  checked=$((checked + 1))

  if [[ ! "$reviewed" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    printf 'INVALID  %s (Last Reviewed: %s)\n' "$relative" "${reviewed:-missing}"
    invalid=$((invalid + 1))
    continue
  fi

  if ! reviewed_epoch="$(parse_date "$reviewed")"; then
    printf 'INVALID  %s (unparseable date: %s)\n' "$relative" "$reviewed"
    invalid=$((invalid + 1))
    continue
  fi

  if (( reviewed_epoch > now_epoch )); then
    printf 'INVALID  %s (future review date: %s)\n' "$relative" "$reviewed"
    invalid=$((invalid + 1))
    continue
  fi

  age_days=$(((now_epoch - reviewed_epoch) / 86400))
  if (( age_days > MAX_AGE_DAYS )); then
    printf 'STALE    %s (%d days; limit %d)\n' "$relative" "$age_days" "$MAX_AGE_DAYS"
    stale=$((stale + 1))
  else
    printf 'CURRENT  %s (%d days)\n' "$relative" "$age_days"
  fi
done < <(
  find "$ROOT_DIR/knowledge" "$ROOT_DIR/runbooks" -maxdepth 1 -type f -name '*.md' \
    ! -name 'README.md' | sort
)

printf '\nChecked %d maintained documents: %d stale, %d invalid.\n' "$checked" "$stale" "$invalid"

if (( stale > 0 || invalid > 0 )); then
  exit 1
fi
