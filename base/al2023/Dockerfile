FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20240708.0@sha256:89c0a390789b0960da6a37033c4edd2d870b62ea3097487d99cea26ba9a0dd6a

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
