FROM public.ecr.aws/amazonlinux/amazonlinux:2023.9.20251117.1@sha256:f5ca6cafc706233c641ad838e738047389943afd3585cb1df7eedfc4d9b1799d

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
