FROM alpine:3.23.2@sha256:865b95f46d98cf867a156fe4a135ad3fe50d2056aa3f25ed31662dff6da4eb62

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
