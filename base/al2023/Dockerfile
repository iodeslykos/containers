FROM public.ecr.aws/amazonlinux/amazonlinux:2023.12.20260803.3@sha256:6d8e068b91f351df5bf6acd4bd261316e42747ad4bae76689ff6f4939e2180a2

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
