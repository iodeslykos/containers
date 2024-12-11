FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20241121.0@sha256:d4eb0d6558eca804991d05f7ab287c3ee5c02e3eabcfeb074b9ef621fd26b5b5

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
