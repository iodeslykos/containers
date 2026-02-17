FROM alpine:3.18

LABEL maintainer="iodeslykos <42@iodeslykos.com>"
LABEL description="Alpine-based builder image for Rust applications."
LABEL repository="https://github.com/iodeslykos/containers/rust"

WORKDIR /tmp

# hadolint ignore=DL3008
RUN apk add --no-cache \
  build-base ca-certificates curl \
  && rm -rf /var/cache/apk/*

RUN curl https://sh.rustup.rs -sSf \
  | sh -s -- -y \
  && . $HOME/.cargo/env

ENV PATH="/root/.cargo/bin:${PATH}"

ENTRYPOINT [ "cargo build" ]
