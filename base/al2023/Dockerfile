FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250114.0@sha256:5597e23b89a240ba385226447f50aeb138d259b00f1e1ef3e90ef700317e0cc4

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
