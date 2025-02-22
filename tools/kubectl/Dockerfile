# hadolint ignore=DL3007
FROM ghcr.io/iodeslykos/alpine:latest@sha256:e042a316132aef4bc47906b6f4a8dcf306ec2e53a3eac19d58496d96f6ddf094 AS base

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
