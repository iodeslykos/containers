FROM docker.io/library/debian:13.5-slim@sha256:28de0877c2189802884ccd20f15ee41c203573bd87bb6b883f5f46362d24c5c2

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
