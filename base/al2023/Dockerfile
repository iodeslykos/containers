FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20241111.0@sha256:5faca3faac3f514a7b8da1801caf87acec0b53623675de4c72f346fa4d1790ea

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
