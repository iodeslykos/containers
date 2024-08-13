FROM debian:12.6-slim@sha256:2ccc7e39b0a6f504d252f807da1fc4b5bcd838e83e4dec3e2f57b2a4a64e7214

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        bash ca-certificates zsh tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g $GID $GROUP \
    && useradd -m -l -u $UID -g $GID $USER
