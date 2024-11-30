FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20241121.0@sha256:196476f434b7027f42e9352cb6b36232134e47da15faa6676ddce79893493813

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
