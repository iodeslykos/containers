FROM alpine:3.19.1@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN addgroup -g ${GID} -S ${GROUP} \
    && \
    adduser -u ${UID} -S ${USER} -G ${GROUP}

# hadolint ignore=DL3018
RUN apk add --no-cache \
    ca-certificates openssl curl zsh \
    && \
    rm -rf /var/cache/apk/*
