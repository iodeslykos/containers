FROM public.ecr.aws/amazonlinux/amazonlinux:2023.11.20260413.0@sha256:fe4122f41784670c960b28c8a32036d8ca268bb56a002ce1e191271b6ddf3293

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
