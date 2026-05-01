FROM public.ecr.aws/amazonlinux/amazonlinux:2023.11.20260427.1@sha256:34e79a29c5726670e1a2bd72db36bfd659c2c464e0b3e56bd1a7adfe93df820d

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
