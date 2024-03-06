FROM public.ecr.aws/amazonlinux/amazonlinux:2023.3.20240304.0@sha256:1a25083e114f303c6b2a5e0969eeea7d2a2bfad2067f0f6fd823748062a6f0cc

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
