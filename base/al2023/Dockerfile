FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20241031.0@sha256:6b900b55264796363fa7c6b51da3b31ba5c655fd6bdf02d825ab66d519f99a5d

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
