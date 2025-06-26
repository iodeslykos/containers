FROM public.ecr.aws/amazonlinux/amazonlinux:2023.7.20250623.1@sha256:2b1c4a8251e3a0e95fba952161e05f7417fdca66580ca9bf0638d83c017f0e69

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
