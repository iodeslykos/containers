FROM public.ecr.aws/amazonlinux/amazonlinux:2023.9.20251027.0@sha256:5f408731c7de2f2c313dbc2dc387b00791aa87c36dc2711caaa053d2991f178a

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
