FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20240730.0@sha256:79ffc9c656b09342e85cd2524de34ff39d56189f7e053c6b5e6384236288e00d

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
