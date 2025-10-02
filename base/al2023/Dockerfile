FROM public.ecr.aws/amazonlinux/amazonlinux:2023.9.20250929.0@sha256:1517e612da23256b909cacc51dfc66a1918ba8c7bd8cc2b232e8929b8f3d8dd4

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
