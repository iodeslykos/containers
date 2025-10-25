FROM public.ecr.aws/amazonlinux/amazonlinux:2023.9.20251020.0@sha256:8b571bc151a30c86f76e7216155e7dcbfff0b5f3fbbd349fd0988ed9ec20af84

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
