# hadolint ignore=DL3007
FROM ghcr.io/iodeslykos/alpine:latest as base

LABEL org.opencontainers.image.title="opentofu"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"
LABEL org.opencontainers.image.url="https://opentofu.org"
LABEL org.opencontainers.image.source="https://github.com/opentofu/opentofu/"

ARG WORKDIR=/tmp/opentofu
ARG TARGETPLATFORM
ARG APP=tofu
ARG VERSION='1.6.0'

ENV USER=outis

WORKDIR ${WORKDIR}

# hadolint ignore=DL3018
RUN apk add --no-cache \
    curl

# hadolint ignore=DL4006
RUN TARGET_ARCH=$(echo "${TARGETPLATFORM}" | cut -d '/' -f2) \
    && curl -fsSL -o "${WORKDIR}/${APP}.apk" \
        "https://github.com/opentofu/opentofu/releases/download/v${VERSION}/${APP}_${VERSION}_${TARGET_ARCH}.apk" \
    && apk add --no-cache --allow-untrusted \
        "${WORKDIR}/${APP}.apk" \
        && rm -rf "${WORKDIR}/${APP}.apk"

USER ${USER}

ENTRYPOINT [ "tofu" ]
CMD [ "--help" ]
