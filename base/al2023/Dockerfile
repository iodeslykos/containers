FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250317.2@sha256:a6b3ed951098b74aefe204b0e907e9c0f7ae9c3114dbdd01ef94b06b12495a41

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
