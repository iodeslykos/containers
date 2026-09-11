FROM public.ecr.aws/amazonlinux/amazonlinux:2023.12.20260909.0@sha256:a0646b8bd35abf5ca3ab94d8cdb5691b9024e19c357531eeefd0ac4762836438

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
