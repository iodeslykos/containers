FROM public.ecr.aws/amazonlinux/amazonlinux:2023.8.20250808.1@sha256:16be01492b5ab08c47f64f615e8787e675e8f0e67bcefcd43cfca164b6b9d788

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
