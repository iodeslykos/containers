# podmangler

`podmangler` is a rootless-first Podman-in-Podman build image based on `ghcr.io/iodeslykos/debian:latest`.

It provides:
- Rootless `podman`, `buildah`, `skopeo`
- Multi-arch support tooling (`qemu-aarch64-static`, `qemu-x86_64-static`)
- CI utilities (`curl`, `git`, `jq`, `yq`, `openssl`)

## Directory Layout

- `Dockerfile`: image definition
- `entrypoint.sh`: runtime bootstrap
- `config/`: runtime config for containers/podman/storage
- `examples/containerfiles/`: example Containerfiles (Jenkins controller, Jenkins agent, utility)
- `examples/modes/`: executable workflows for common rootless build/publish modes

## Rootless Runtime Baseline

The image runs as user `outis` (UID/GID `1000`) with rootless storage (`vfs`) to maximize compatibility across containerized CI environments.

Recommended runtime mode for reliability:
- `--privileged`

Best-effort reduced-permission mode (runtime-dependent):
- `--cap-add SYS_ADMIN`
- `--device /dev/fuse`
- `--device /dev/net/tun`
- `--security-opt seccomp=unconfined`
- `--security-opt apparmor=unconfined`

## Build The Image

```bash
docker build -t podmangler:test ./builder/podmangler
```

## Run Modes

### 1) Rootless Podman build (Jenkins controller)

```bash
docker run --rm -it --privileged \
  -v "$PWD":/workspace \
  podmangler:test \
  /workspace/builder/podmangler/examples/modes/01_podman_rootless_jenkins.sh \
  /workspace ghcr.io/example/jenkins-controller:dev
```

### 2) Rootless Buildah build (Jenkins inbound agent)

```bash
docker run --rm -it --privileged \
  -v "$PWD":/workspace \
  podmangler:test \
  /workspace/builder/podmangler/examples/modes/02_buildah_rootless_jenkins.sh \
  /workspace ghcr.io/example/jenkins-agent:dev
```

### 3) Rootless Podman multi-arch manifest build (utility image)

```bash
docker run --rm -it --privileged \
  -v "$PWD":/workspace \
  podmangler:test \
  /workspace/builder/podmangler/examples/modes/03_podman_multiarch_manifest.sh \
  /workspace ghcr.io/example/utility dev
```

### 4) Publish with skopeo

```bash
docker run --rm -it --privileged \
  -v "$PWD":/workspace \
  podmangler:test \
  /workspace/builder/podmangler/examples/modes/04_skopeo_publish.sh \
  localhost/jenkins-controller:dev \
  docker://ghcr.io/example/jenkins-controller:dev
```

## Notes

- If your environment uses TLS interception, inject trusted CA certificates so Podman/Skopeo pulls and pushes verify correctly.
- Cross-arch execution requires binfmt support from the host/runtime.
