FROM public.ecr.aws/amazonlinux/amazonlinux:2027.0.20260928.1@sha256:3ad14f0ff21381755f96e7c44d4f3bbe12bd8369214d1f9b17e78842441f98dd

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
