FROM public.ecr.aws/amazonlinux/amazonlinux:2023.3.20240122.0@sha256:dd12ba17d753fa8e5b51497bab1644170c629ad9c600eea48109e5bf0b6c0dfd

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl openssl shadow-utils zsh \
    && dnf clean all

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
