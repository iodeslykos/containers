# hadolint ignore=DL3007
FROM ghcr.io/iodeslykos/alpine:latest@sha256:9c9fe743c28db0bcb58575849122f9c66f2d4bd9bc7dea20d754969637bdff1e AS base

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
