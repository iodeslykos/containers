FROM public.ecr.aws/amazonlinux/amazonlinux:2023.12.20260831.0@sha256:fb70bd54d4a849293bfef9785ce63aa1eac2557e0167af4f32f56286bd35d783

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
