FROM public.ecr.aws/amazonlinux/amazonlinux:2023.10.20260202.2@sha256:b06511762afe97b1b5781ef28a712b1d46c28abceef11c8c3fcb7a10ccab021b

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
