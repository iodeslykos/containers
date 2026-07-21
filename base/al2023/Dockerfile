FROM public.ecr.aws/amazonlinux/amazonlinux:2023.12.20260720.0@sha256:a173dcd0fdeb0e83b39fcf9464a1b2af233569809181717cf541ab6a82039c09

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
