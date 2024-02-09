FROM public.ecr.aws/amazonlinux/amazonlinux:2023.3.20240205.2@sha256:9a39dfc7ea841627bdba346117bda5d4a7b9dbd14e99c7bba14c066be1c0cedb

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
