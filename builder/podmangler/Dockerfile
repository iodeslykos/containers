# hadolint ignore=DL3007
FROM ghcr.io/iodeslykos/debian:latest AS base

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

ENV BUILDAH_ISOLATION=chroot
ENV _CONTAINERS_USERNS_CONFIGURED=""
ENV CONTAINERS_LOCAL_PATH=/home/${USER}/.local/share/containers
ENV CONTAINERS_CONFIG_PATH=/home/${USER}/.config/containers
ENV XDG_RUNTIME_DIR=/tmp/run-${UID}
ENV DEBIAN_FRONTEND=noninteractive

VOLUME "${CONTAINERS_LOCAL_PATH}"

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      binfmt-support \
      buildah \
      ca-certificates \
      containernetworking-plugins \
      crun \
      curl \
      fuse-overlayfs \
      git \
      jq \
      openssl \
      passt \
      podman \
      qemu-user-static \
      skopeo \
      slirp4netns \
      uidmap \
      yq \
    && update-ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    if grep -q "^${USER}:" /etc/subuid; then \
      sed -i "s/^${USER}:.*/${USER}:100000:65536/" /etc/subuid; \
    else \
      echo "${USER}:100000:65536" >> /etc/subuid; \
    fi; \
    if grep -q "^${USER}:" /etc/subgid; then \
      sed -i "s/^${USER}:.*/${USER}:100000:65536/" /etc/subgid; \
    else \
      echo "${USER}:100000:65536" >> /etc/subgid; \
    fi

COPY --chmod=0644 config/containers.conf /etc/containers/containers.conf
COPY --chmod=0644 config/storage.conf /etc/containers/storage.conf
COPY --chmod=0644 config/registries.conf /etc/containers/registries.conf
COPY --chown=outis:outis --chmod=0644 config/containers.conf ${CONTAINERS_CONFIG_PATH}/containers.conf
COPY --chown=outis:outis --chmod=0644 config/storage.conf ${CONTAINERS_CONFIG_PATH}/storage.conf
COPY --chown=outis:outis --chmod=0644 config/registries.conf ${CONTAINERS_CONFIG_PATH}/registries.conf
COPY --chown=outis:outis --chmod=0755 entrypoint.sh /home/${USER}/entrypoint.sh

RUN set -eux; \
    mkdir -p "${XDG_RUNTIME_DIR}" \
             /home/${USER}/.config \
             /home/${USER}/.config/containers \
             "${CONTAINERS_LOCAL_PATH}/storage/libpod"; \
    chmod 0700 "${XDG_RUNTIME_DIR}"; \
    chmod 0755 /home/${USER}/.config /home/${USER}/.config/containers; \
    chown -R "${UID}:${GID}" /home/${USER} "${XDG_RUNTIME_DIR}" "${CONTAINERS_LOCAL_PATH}"; \
    chmod 0755 /usr/bin/fusermount3; \
    buildah --version; \
    podman --version; \
    skopeo --version; \
    qemu-aarch64-static --version; \
    qemu-x86_64-static --version

USER ${USER}
WORKDIR /home/${USER}

ENTRYPOINT ["./entrypoint.sh"]
