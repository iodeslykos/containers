FROM public.ecr.aws/amazonlinux/amazonlinux:2023.10.20260216.1@sha256:dfa14233aa5e9f951074312290a1d217272cd1a04babdf1f87a68ea27d6eeac6

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
