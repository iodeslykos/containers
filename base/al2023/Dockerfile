FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20240916.0@sha256:feeb91e31912e7b3739d9cee4bc2181262f54688bc4fbd21069f3cedce03fa4f

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
