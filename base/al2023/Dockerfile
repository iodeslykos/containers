FROM public.ecr.aws/amazonlinux/amazonlinux:2023.9.20251110.1@sha256:c929105619fbc4cb4cb2d0667a02b549a3408be98e89d9c61437ca702d04d829

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
