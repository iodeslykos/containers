FROM public.ecr.aws/amazonlinux/amazonlinux:2023.9.20251208.0@sha256:dc1dacae45ec346969d430237ddd1a282170ec9f322d4b3cf28ac8f1975070a1

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
