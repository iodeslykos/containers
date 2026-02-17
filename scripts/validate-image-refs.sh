#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${repo_root}"

fail() {
  echo "ERROR: $*" >&2
  exit 1
}

# Install dependencies.

apt update && apt install -y --no-install-recommends \
  rg

if ! command -v rg >/dev/null; then
  echo "ripgrep (rg) is required but not found. Please install it and try again." >&2
  exit 1
fi

if rg -n '^FROM[[:space:]]+[^[:space:]]+:latest([[:space:]]|@|$)' base tools >/dev/null; then
  rg -n '^FROM[[:space:]]+[^[:space:]]+:latest([[:space:]]|@|$)' base tools || true
  fail "latest tags are not allowed in base/ and tools/ Dockerfiles"
fi

if rg -n '^FROM[[:space:]]+[[:alnum:]_.-]+:' base tools >/dev/null; then
  rg -n '^FROM[[:space:]]+[[:alnum:]_.-]+:' base tools || true
  fail "unqualified FROM refs are not allowed in base/ and tools/ Dockerfiles"
fi

echo "Image reference validation passed."
