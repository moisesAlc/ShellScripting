#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")" && pwd)"
dir="$root/solucoes"
ok=0
fail=0

for f in "$dir"/*.sh; do
  [[ -f "$f" ]] || continue
  if bash -n "$f"; then
    echo "OK   $(basename "$f")"
    ok=$((ok + 1))
  else
    echo "FAIL $(basename "$f")"
    fail=$((fail + 1))
  fi
done

if [[ $fail -gt 0 ]]; then
  exit 1
fi
echo "--- $ok arquivo(s) com sintaxe válida"
