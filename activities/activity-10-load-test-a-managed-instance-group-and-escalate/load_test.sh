#!/usr/bin/env bash
set -euo pipefail
URL=${1:?Usage: load_test.sh URL}
for i in $(seq 1 120); do
  code=$(curl -sS -o /dev/null -w '%{http_code}' "$URL")
  printf '%s,%s,%s\n' "$(date -u +%FT%TZ)" "$i" "$code"
done
