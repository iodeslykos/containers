FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20240903.0@sha256:46c62658e791da5e9ef5a88a8c2747aa2b7f548e9feae09ccb2fd2d66e380b53

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
