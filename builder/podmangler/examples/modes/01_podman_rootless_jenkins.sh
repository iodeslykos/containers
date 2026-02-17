#!/usr/bin/env bash
set -euo pipefail

# Rootless Podman build mode (single-arch) for Jenkins controller.
# Run this script inside the podmangler container.

CONTEXT_DIR="${1:-/workspace}"
IMAGE="${2:-ghcr.io/example/jenkins-controller:dev}"
CONTAINERFILE="${3:-${CONTEXT_DIR}/builder/podmangler/examples/containerfiles/JenkinsController.Containerfile}"

podman build \
  --format docker \
  -t "${IMAGE}" \
  -f "${CONTAINERFILE}" \
  "${CONTEXT_DIR}"

podman image inspect "${IMAGE}" --format '{{.Id}} {{.Digest}}'
