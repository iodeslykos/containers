FROM public.ecr.aws/amazonlinux/amazonlinux:2027.0.20260914.0@sha256:dc743e9902480f078ff4099d19e4c9095306b88e4c2e7a3bd06a75b23b33f9af

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
