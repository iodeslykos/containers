FROM public.ecr.aws/amazonlinux/amazonlinux:2023.8.20250804.0@sha256:b605bd9526950f8d77a79b11667e4e7c75683e9d7dc6bb148bc023b8503163cb

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl findutils \
        openssl shadow-utils zsh \
    && dnf clean all \
    && rm -rf /var/cache /var/log/dnf*

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
