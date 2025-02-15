FROM fedora:rawhide AS base

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

ENV BUILDAH_ISOLATION=chroot
ENV CONTAINERS_LOCAL_PATH=/home/${USER}/.local/share/containers
ENV CONTAINERS_CONFIG_PATH=/home/${USER}/.config/containers
ENV _CONTAINERS_USERNS_CONFIGURED=""

VOLUME "${CONTAINERS_LOCAL_PATH}" /var/lib/containers

RUN dnf update -y \
    && dnf install -y --allowerasing \
      buildah bzip2 \
      catatonit containers-common-extra crun \
      dumb-init \
      fuse-overlayfs \
      jq \
      podman podman-docker podman-remote podman-tui \
      skopeo \
      --setopt=tsflags=nodocs \
    # Annoying bug that took two days to figure out.
    && dnf reinstall -y shadow-utils \
    && dnf clean all \
    && rm -rf /var/cache /var/log/dnf* \
    && groupadd -g ${GID} ${GROUP} \
    && useradd -u ${UID} -g ${GROUP} -ms /bin/bash ${USER} \
    && touch /etc/subuid /etc/subgid \
    && chmod g=u /etc/subuid /etc/subgid \
    && usermod --add-subuids 10000-165536 --add-subgids 10000-165536 outis

    # COPY --chmod=0644 containers.conf        /etc/containers/containers.conf
    COPY --chmod=0644 registries.conf        /etc/containers/registries.conf
    COPY --chmod=0644 podman-containers.conf /etc/containers/podman-containers.conf
    # COPY --chmod=0644 containers.conf        ${CONTAINERS_CONFIG_PATH}/containers.conf
    COPY --chmod=0644 registries.conf        ${CONTAINERS_CONFIG_PATH}/registries.conf
    COPY --chmod=0644 podman-containers.conf ${CONTAINERS_CONFIG_PATH}/podman-containers.conf
    COPY --chmod=0755 entrypoint.sh          /home/${USER}/entrypoint.sh

RUN chmod +x /home/${USER}/entrypoint.sh && \
    mkdir -p "${CONTAINERS_LOCAL_PATH}"/storage/libpod && \
    chown -R ${USER}:${GROUP} /home/${USER} && \
    chmod 0755 /usr/bin/fusermount3 && \
    mkdir -p /var/lib/shared/vfs-images \
             /var/lib/shared/vfs-layers \
             /var/lib/shared/overlay-images \
             /var/lib/shared/overlay-layers \
    && \
    touch /var/lib/shared/vfs-images/images.lock \
          /var/lib/shared/vfs-layers/layers.lock \
          /var/lib/shared/overlay-images/images.lock \
          /var/lib/shared/overlay-layers/layers.lock \
    && \
    buildah --version && \
    podman --version && \
    skopeo --version

USER ${USER}
WORKDIR /home/${USER}

ENTRYPOINT ["./entrypoint.sh"]
