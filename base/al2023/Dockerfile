FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20241209.0@sha256:5fe09c9adca768013f0104b7dbd8e3c5d203194240f74e32581e717a845d440b

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
