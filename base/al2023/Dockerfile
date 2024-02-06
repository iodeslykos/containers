FROM public.ecr.aws/amazonlinux/amazonlinux:2023.3.20240131.0@sha256:9a5fce62020fd3828a89c22e35ce4f02383efa8036dfdfc7165205763df252d1

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl openssl shadow-utils zsh \
    && dnf clean all

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
