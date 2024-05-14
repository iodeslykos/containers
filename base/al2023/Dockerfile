FROM public.ecr.aws/amazonlinux/amazonlinux:2023.4.20240513.0@sha256:f4c096ddea744b7e453acab52e4c54028b7f1563aac6f14870fbb27325617d9c

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
