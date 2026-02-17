#!/usr/bin/env bash
set -euo pipefail

export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp/run-$(id -u)}"
export CONTAINERS_LOCAL_PATH="${CONTAINERS_LOCAL_PATH:-$HOME/.local/share/containers}"
export CONTAINERS_CONFIG_PATH="${CONTAINERS_CONFIG_PATH:-$HOME/.config/containers}"

mkdir -p "${XDG_RUNTIME_DIR}"
mkdir -p "${CONTAINERS_LOCAL_PATH}" "${CONTAINERS_CONFIG_PATH}"
chmod 0700 "${XDG_RUNTIME_DIR}" || true

# Enable cross-arch emulation if this container can write to binfmt_misc.
if [ "$(id -u)" -eq 0 ] && [ -w /proc/sys/fs/binfmt_misc/register ] && command -v update-binfmts >/dev/null 2>&1; then
  update-binfmts --enable qemu-aarch64 >/dev/null 2>&1 || true
  update-binfmts --enable qemu-x86_64 >/dev/null 2>&1 || true
fi

if [ "$#" -eq 0 ]; then
  exec /bin/bash
fi

# Single-string mode is convenient for CI systems that pass one command.
if [ "$#" -eq 1 ]; then
  exec /bin/bash -lc "$1"
fi

exec "$@"
