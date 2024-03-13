FROM public.ecr.aws/amazonlinux/amazonlinux:2023.3.20240312.0@sha256:6d5910de52822ba72c6317805bcac2a3a499d70f047a9a2f080755489363bf13

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
