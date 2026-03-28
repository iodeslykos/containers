FROM public.ecr.aws/amazonlinux/amazonlinux:2023.10.20260325.0@sha256:6881a9bfd3a151cbdf364e4e2ab65a213f3f360e3647adca0f6527f45ee89936

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
