FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250123.4@sha256:ec67a963853377ebdf482f0cf8ff8e76269882e2bffe1d614d79d24cfe7e52cc

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
