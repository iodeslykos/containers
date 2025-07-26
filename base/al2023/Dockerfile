FROM public.ecr.aws/amazonlinux/amazonlinux:2023.8.20250721.2@sha256:4308d53aeabb6df156feb75ff6fd7cef02f0fede70478c81d7a7236678cddd98

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
