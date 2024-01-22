# hadolint ignore=DL3007
FROM ghcr.io/iodeslykos/alpine:latest@sha256:6bd07431821b60539e2721178ffd2ccc9d37f188ffeaf9249b4cc4e9e1dd7e01 as base

LABEL org.opencontainers.image.title="kubectl"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"

ARG VERSION=v1.29.0
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
ENV USER=outis

WORKDIR /tmp

# hadolint ignore=DL4006
RUN curl -LO "https://dl.k8s.io/release/${VERSION}/bin/linux/${TARGETARCH}/kubectl" \
    && curl -LO "https://dl.k8s.io/${VERSION}/bin/linux/${TARGETARCH}/kubectl.sha256" \
    && echo "$(cat kubectl.sha256) kubectl" | sha256sum -c - \
    && mv kubectl /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

USER ${USER}

ENTRYPOINT ["kubectl"]
