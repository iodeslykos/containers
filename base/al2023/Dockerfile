FROM public.ecr.aws/amazonlinux/amazonlinux:2023.11.20260511.1@sha256:f4170a0dc1608a482d2cb1b5a752cb64931cd62ade7d326c2d09391d4d527497

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
