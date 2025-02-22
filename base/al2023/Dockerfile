FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250218.2@sha256:d66610d8193eb6169ad950ad5c253ff2be0ec89cff37b78c4e977a06e3889b1a

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
