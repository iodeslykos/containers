FROM public.ecr.aws/amazonlinux/amazonlinux:2023.12.20260817.0@sha256:5d271dd33b628252c31c15f5449e50d7c4e9f93badf9342f9b1e2a8d326fbe84

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl findutils \
        openssl shadow-utils zsh \
    && dnf clean all \
    && rm -rf /var/cache /var/log/dnf*

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
