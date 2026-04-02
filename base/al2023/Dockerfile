FROM public.ecr.aws/amazonlinux/amazonlinux:2023.10.20260330.0@sha256:58f5ab870b17ba908389a253ef7764c39e908f76c023861e8d99a5b1ff323397

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
