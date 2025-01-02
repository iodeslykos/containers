# hadolint ignore=DL3007
FROM ghcr.io/iodeslykos/alpine:latest@sha256:0fd21418805bf10318d7d85af98122df277af0edcc476cb244ed299aee131deb AS base

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
