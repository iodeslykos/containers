FROM public.ecr.aws/amazonlinux/amazonlinux:2023.9.20251105.0@sha256:b0f8d1179ea5555f33163cbd33ad91ac5c553d334da210741171fa5e40cbefa9

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
