# hadolint ignore=DL3007
FROM ghcr.io/iodeslykos/alpine:latest@sha256:689c236ce7706de18944ee2e549100c90767262c0ce3c55a1c0f3dd34a85f2fc AS base

LABEL org.opencontainers.image.title="opentofu"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"
LABEL org.opencontainers.image.url="https://opentofu.org"
LABEL org.opencontainers.image.source="https://github.com/opentofu/opentofu/"

ARG WORKDIR=/tmp/opentofu
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
ARG APP=tofu

ARG VERSION='1.9.0'

ENV USER=outis

WORKDIR ${WORKDIR}

# hadolint ignore=DL3018
RUN apk add --no-cache \
        curl

# hadolint ignore=DL4006
RUN curl -fsSL -o "${WORKDIR}/${APP}.apk" \
        "https://github.com/opentofu/opentofu/releases/download/v${VERSION}/${APP}_${VERSION}_${TARGETARCH}.apk" \
    && apk add --no-cache --allow-untrusted \
        "${WORKDIR}/${APP}.apk" \
        && rm -rf "${WORKDIR}/${APP}.apk"

USER ${USER}

ENTRYPOINT [ "tofu" ]
CMD [ "--help" ]
