FROM public.ecr.aws/amazonlinux/amazonlinux:2023.4.20240401.1@sha256:aaaf1d028c7e011f73aaecb0a392200806e86934fef4eb86cf53ccfbd79e9db1

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
