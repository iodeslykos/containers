FROM public.ecr.aws/amazonlinux/amazonlinux:2023.8.20250707.0@sha256:575eeb3622d0a6d8628ed063ed2572d7e75a584b679a3b013a7fd1da4ba19545

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
