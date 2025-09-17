FROM public.ecr.aws/amazonlinux/amazonlinux:2023.8.20250915.0@sha256:097c3f2de85902a408c41b85c837bc112483dd90400d471a9a8519c721d3c886

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
