FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20241010.0@sha256:75763d26a28070a9ac04d0250585119566734b1f5182474afd4cb062a26ef07f

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
