FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250303.0@sha256:558e465c865f94ba15dd832dfa418eb21e2a954dac7d5e542ac1fee146b7675c

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
