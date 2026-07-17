#!/usr/bin/env bash
set -euo pipefail

# Rootless multi-arch mode for a generic utility image.
# Requires a runtime where cross-arch execution is available.
# Run this script inside the podmangler container.

CONTEXT_DIR="${1:-/workspace}"
BASE_IMAGE="${2:-ghcr.io/example/utility}"
VERSION="${3:-dev}"
CONTAINERFILE="${4:-${CONTEXT_DIR}/builder/podmangler/examples/containerfiles/Utility.Containerfile}"
MANIFEST_REF="${BASE_IMAGE}:${VERSION}"

podman build --platform linux/amd64 --format docker -f "${CONTAINERFILE}" -t "${BASE_IMAGE}:${VERSION}-amd64" "${CONTEXT_DIR}"
podman build --platform linux/arm64 --format docker -f "${CONTAINERFILE}" -t "${BASE_IMAGE}:${VERSION}-arm64" "${CONTEXT_DIR}"

podman manifest create "${MANIFEST_REF}"
podman manifest add "${MANIFEST_REF}" "${BASE_IMAGE}:${VERSION}-amd64"
podman manifest add "${MANIFEST_REF}" "${BASE_IMAGE}:${VERSION}-arm64"

podman manifest inspect "${MANIFEST_REF}" | jq '.manifests[].platform'
