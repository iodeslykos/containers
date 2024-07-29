FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20240722.0@sha256:41051251bfef3a5c572404d3bedb0d32fcec4e60a955dbfa0620c7b5d82a1f86

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
