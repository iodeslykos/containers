FROM public.ecr.aws/amazonlinux/amazonlinux:2023.4.20240429.0@sha256:bcb8bd282c38fa8c58369bd217d25b5f8fbd760c663660c8c630189b988f5d97

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
