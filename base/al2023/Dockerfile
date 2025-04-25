FROM public.ecr.aws/amazonlinux/amazonlinux:2023.7.20250414.0@sha256:b885fda4d431af6d651ebf90c4c8790add9b1c3bf181d5e8ca559d3d7d64e616

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
