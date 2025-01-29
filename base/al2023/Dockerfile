FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250128.0@sha256:e054718e637a1295ba7d5e9f44dba64a3c15aa5941252e4409ad990b96560d72

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl findutils \
        openssl shadow-utils zsh \
    && dnf clean all

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
