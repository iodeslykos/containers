FROM public.ecr.aws/amazonlinux/amazonlinux:2023.7.20250609.0@sha256:4e1648e3917aea2ecc13ae65ec45a9479380c38a4c525e224aa2d1936f6c9693

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
