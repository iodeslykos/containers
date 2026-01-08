FROM public.ecr.aws/amazonlinux/amazonlinux:2023.10.20260105.0@sha256:e27a70c006c68f0d194cc9b9624714d6ed8d979a94f60f7d31392f4c8294155b

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
