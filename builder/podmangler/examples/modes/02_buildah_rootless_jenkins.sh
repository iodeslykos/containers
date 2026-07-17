#!/usr/bin/env bash
set -euo pipefail

# Rootless Buildah mode (single-arch) for Jenkins inbound agent.
# Run this script inside the podmangler container.

CONTEXT_DIR="${1:-/workspace}"
IMAGE="${2:-ghcr.io/example/jenkins-agent:dev}"
CONTAINERFILE="${3:-${CONTEXT_DIR}/builder/podmangler/examples/containerfiles/JenkinsAgent.Containerfile}"

buildah bud \
  --isolation chroot \
  --format docker \
  -t "${IMAGE}" \
  -f "${CONTAINERFILE}" \
  "${CONTEXT_DIR}"

buildah images | grep "$(basename "${IMAGE}" | cut -d: -f1)" || true
