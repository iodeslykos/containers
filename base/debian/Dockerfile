FROM debian:12.9-slim@sha256:12c396bd585df7ec21d5679bb6a83d4878bc4415ce926c9e5ea6426d23c60bdc

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
