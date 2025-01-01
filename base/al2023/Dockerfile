FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20241212.0@sha256:bea1de0a7c636402cc10a1746df1e90ab60f01ae2a76a0103c11940d67c68d03

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
