FROM public.ecr.aws/amazonlinux/amazonlinux:2023.11.20260514.0@sha256:d644ae2e12b5fae7826c11c28a6c47d28ebfdb15e4dc7849af3c00317d4d0bc8

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl findutils \
        openssl shadow-utils zsh \
    && dnf clean all \
    && rm -rf /var/cache /var/log/dnf*

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
