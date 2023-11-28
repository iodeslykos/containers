# hadolint global ignore=DL3018
FROM alpine:3.18 as final

LABEL org.opencontainers.image.title="opentofu"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"
LABEL org.opencontainers.image.url="https://opentofu.org"
LABEL org.opencontainers.image.source="https://github.com/opentofu/opentofu/"

ARG WORKDIR=/tmp/opentofu
ARG BUILD_ARCH=arm64
ARG APP=tofu
ARG VERSION='1.6.0-alpha5'

WORKDIR ${WORKDIR}

RUN apk add --no-cache \
    curl

RUN curl -fsSL \
    -o "${WORKDIR}/${APP}.apk" \
    "https://github.com/opentofu/opentofu/releases/download/v${VERSION}/${APP}_${VERSION}_${BUILD_ARCH}.apk" \
    && apk add --no-cache --allow-untrusted \
        "${WORKDIR}/${APP}.apk" \
        && rm -rf "${WORKDIR}/${APP}.apk"

ENTRYPOINT [ "tofu" ]
CMD [ "--help" ]
