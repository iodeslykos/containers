#!/usr/bin/env bash
set -euo pipefail

# Registry copy mode for images/manifests created with podman/buildah.
# Run this script inside the podmangler container.

SRC_IMAGE="${1:?source image required (example: localhost/jenkins-controller:dev)}"
DST_IMAGE="${2:?destination image required (example: docker://ghcr.io/org/jenkins-controller:dev)}"
SRC_TRANSPORT="${3:-containers-storage}"

skopeo copy --all "${SRC_TRANSPORT}:${SRC_IMAGE}" "${DST_IMAGE}"
