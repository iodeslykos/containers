FROM debian:12.6-slim@sha256:5f7d5664eae4a192c2d2d6cb67fc3f3c7891a8722cd2903cc35aa649a12b0c8d

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
