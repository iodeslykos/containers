# hadolint global ignore=DL3018,DL3007
FROM ghcr.io/iodeslykos/alpine:latest as base

LABEL org.opencontainers.image.title="kubectl"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"

ARG VERSION=v1.29.0
ARG BUILD_ARCH=linux/amd64
ENV USER=outis
ENV GROUP=outis

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

WORKDIR /tmp

RUN TARGET_ARCH=$(echo "${BUILD_ARCH}" | cut -d '/' -f2) \
    && curl -LO "https://dl.k8s.io/release/${VERSION}/bin/linux/${TARGET_ARCH}/kubectl" \
    && curl -LO "https://dl.k8s.io/${VERSION}/bin/linux/${TARGET_ARCH}/kubectl.sha256" \
    && echo "$(cat kubectl.sha256) kubectl" | sha256sum -c - \
    && mv kubectl /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

USER ${USER}

ENTRYPOINT ["kubectl"]
CMD ["--help"]
