FROM public.ecr.aws/amazonlinux/amazonlinux:2023.12.20260727.0@sha256:601289f29d1b67fc542a451beda8ac6ca542d40289c99f71faa3ba37fe0d133a

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
