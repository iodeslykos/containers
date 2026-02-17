FROM ghcr.io/iodeslykos/alpine:3.23.3@sha256:b3a77faadae27b7841da8215d8d9696c28107ae0f1de0c7a3951f63569a2cb53 AS base

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
