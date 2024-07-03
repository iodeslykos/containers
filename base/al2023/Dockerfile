FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20240701.0@sha256:0fce1a3d077646b94ae788918642d6614f8bb57910958af34710367105c5c2ad

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
