FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20241010.1@sha256:441220eb6a6052dd1e283a361a345b580725c2d71fe5a9f3c68f69a67af985ce

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
