FROM public.ecr.aws/amazonlinux/amazonlinux:2023.12.20260724.0@sha256:7942e2a958a238057cdf3304cba7e75f4056d15f75112b8d8e7c1d21a17f2d6c

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
