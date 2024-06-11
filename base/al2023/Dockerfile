FROM public.ecr.aws/amazonlinux/amazonlinux:2023.4.20240611.0@sha256:e96baa46e2effb0f69d488007bde35a7d01d7fc2ec9f4e1cd65c59846c01775e

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
