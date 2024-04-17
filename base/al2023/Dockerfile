FROM public.ecr.aws/amazonlinux/amazonlinux:2023.4.20240416.0@sha256:fae26a7ff65a1dc7441dba309bf6d5ad818ccaeb7267c3c309d139a97b7b28bc

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
