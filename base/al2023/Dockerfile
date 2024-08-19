FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20240819.0@sha256:58b239881342c76bc01ac4a2bf442e76b7f816a136aa3bd9e48eecb8892cd171

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
