FROM public.ecr.aws/amazonlinux/amazonlinux:2023.11.20260526.0@sha256:0179112c7edfde771da73dd5cd50ddd5a2f0e993bdac04c12c23d82c82ebae7b

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
