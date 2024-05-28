FROM public.ecr.aws/amazonlinux/amazonlinux:2023.4.20240528.0@sha256:783acc41799fabc1fbc069d99338c85132f1d7dcd35c4707a0ae39f5c735e4a0

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
