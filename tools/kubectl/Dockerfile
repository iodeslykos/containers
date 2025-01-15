# hadolint ignore=DL3007
FROM ghcr.io/iodeslykos/alpine:latest@sha256:700ddee01f1824001e2d6475d4d7447b17fa34a5c7878836e2061904a4f55bd3 AS base

LABEL org.opencontainers.image.title="kubectl"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"

ARG VERSION=1.31.2
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
ENV USER=outis

WORKDIR /tmp

# hadolint ignore=DL4006
RUN curl -LO "https://dl.k8s.io/release/v${VERSION}/bin/linux/${TARGETARCH}/kubectl" \
    && curl -LO "https://dl.k8s.io/v${VERSION}/bin/linux/${TARGETARCH}/kubectl.sha256" \
    && echo "$(cat kubectl.sha256) kubectl" | sha256sum -c - \
    && mv kubectl /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

USER ${USER}

ENTRYPOINT ["kubectl"]
CMD ["--help"]
