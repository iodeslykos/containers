FROM alpine:3.21.0@sha256:21dc6063fd678b478f57c0e13f47560d0ea4eeba26dfc947b2a4f81f686b9f45

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
