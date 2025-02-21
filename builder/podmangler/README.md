# podmangler

`podmangler` is a custom-built container intended for use in CI/CD pipelines that cobbles together `podman`, `buildah`, `skopeo`, and `qemu` for building, running, and managing multi-arch containers.

Additionally, it contains tools like `jq`, `yq`, `curl`, `git`, and `openssl` for general utility.

It is rootless and meant to be run by a rootless container runtime like `podman` or `docker`, ensuring security while enabling magical things like container-in-container operations and container builds on Kubernetes.

> [!WARNING]
> `--cap-add SYS_ADMIN` is required for OCI runtime to perform administrative tasks, like mounting filesystems within the container.
> While containers with this capability can still be rootless with proper daemon configuration, there are security implications as it permits operations that would otherwise be restricted.

> [!CAUTION]
> Using `--privileged` flag is not recommended. If used, you will be ridiculed by your peers and shunned by the security-minded, computer-loving community.

## Usage

There are multiple ways to use this image!

1. Interactive session:

```bash
docker run --rm -it ghcr.io/iodeslykos/podmangler:latest
```

Running with this method will start an interactive shell session where you can then run commands as needed.

2. Commands direct to `podman run`:

This method allows you to run a series of commands directly without starting an interactive session.

```bash
# Run container with volume mounts for Containerfile, secrets, and config.
docker run --rm -it \
  -v /path/to/your/Containerfile:/tmp \
  -v /path/to/your/config:/config \
  -v /path/to/your/secrets:/secrets \
  ghcr.io/iodeslykos/podmangler:latest \
  # Commands to run inside pod.
  "export REGISTRY_AUTH_FILE=/secrets/auth.json && \
  podman login ghcr.io && \
  skopeo login ghcr.io && \
  podman build <context> -f /tmp/Containerfile -t <image-name>:<tag> && \
  skopeo copy oci:<image-name>:<tag> ghcr.io/<image-name>:<tag>"
```

3. Kubernetes:

Run on Kubernetes as a Pod, Job, or CronJob.

This example is a Job that matches the example shown in the previous method. Same end result, just uglier as YAML is wont to be.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: podmangler
spec:
  containers:
  - name: podmangler
    image: ghcr.io/iodeslykos/podmangler:latest
    securityContext:
      capabilities:
        add:
          - SYS_ADMIN
    command:
      - |
        export REGISTRY_AUTH_FILE=/secrets/auth.json && \
        podman login ghcr.io && \
        skopeo login ghcr.io && \
        podman build <context> -f /tmp/Containerfile -t <image-name>:<tag> && \
        skopeo copy oci:<image-name>:<tag> ghcr.io/<image-name>:<tag>
    volumeMounts:
      - name: containerfile
        mountPath: /tmp
      - name: config
        mountPath: /config
      - name: secrets
        mountPath: /secrets
  volumes:
    - name: containerfile
      hostPath:
        path: /path/to/your/Containerfile   # Must be a file on the host.
        type: File
    - name: config
      hostPath:
        path: /path/to/your/config          # Must be a directory on the host.
        type: Directory
    - name: secrets
      hostPath:
        path: /path/to/your/secrets         # Must be a directory on the host.
        type: Directory
  restartPolicy: Never
```
