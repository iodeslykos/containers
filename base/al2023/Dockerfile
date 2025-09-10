FROM public.ecr.aws/amazonlinux/amazonlinux:2023.8.20250908.0@sha256:0afbc075facf7bb19482cd244d037222d6f998e8a443106fe245d23008910452

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
