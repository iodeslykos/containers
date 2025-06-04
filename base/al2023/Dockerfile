FROM public.ecr.aws/amazonlinux/amazonlinux:2023.7.20250527.1@sha256:ee9addc6fe2cc0eea2aec1a02d25a838fe33f0ffe0c4580885e26d1e218deeba

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl findutils \
        openssl shadow-utils zsh \
    && dnf clean all

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
