FROM public.ecr.aws/amazonlinux/amazonlinux:2023.11.20260505.0@sha256:a450a74bfebfa936e7106d79c8b4b4dd0ca891c790513f84624da02a0e5531db

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
