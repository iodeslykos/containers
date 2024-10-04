FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20241001.1@sha256:d98c1c8b83f153add6073e6579d153398928f2d5117d982f3cb0d03e8cb09f53

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
