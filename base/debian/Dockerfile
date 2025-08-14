FROM debian:13.0-slim@sha256:c85a2732e97694ea77237c61304b3bb410e0e961dd6ee945997a06c788c545bb

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
