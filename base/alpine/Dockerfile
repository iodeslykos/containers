FROM alpine:3.23.3@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

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
