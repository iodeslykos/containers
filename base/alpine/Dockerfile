FROM alpine:3.20.0@sha256:77726ef6b57ddf65bb551896826ec38bc3e53f75cdde31354fbffb4f25238ebd

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
