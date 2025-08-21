FROM public.ecr.aws/amazonlinux/amazonlinux:2023.8.20250818.0@sha256:ae7ee9bf8436e1750ca7effe5a3e6fc3546003775ba169b93cc7b9901bcf1aa1

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
