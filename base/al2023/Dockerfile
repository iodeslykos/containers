FROM public.ecr.aws/amazonlinux/amazonlinux:2023.7.20250428.1@sha256:04a5f64cd542aa4f74b092180d48edee266ee239145564d98850ad9a1f370bcb

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
