FROM public.ecr.aws/amazonlinux/amazonlinux:2023.9.20251014.0@sha256:78804160fd6e168e29aab05b9482b566addb6879c37c75053172cb6e911232ea

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
