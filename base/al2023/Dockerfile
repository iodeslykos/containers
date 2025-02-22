FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250211.0@sha256:929dfd2e99503e4b15b9a921cdcd395a0bc9586523eb3e599e7393e0cb78a8eb

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
