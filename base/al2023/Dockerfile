FROM public.ecr.aws/amazonlinux/amazonlinux:2027.0.20261012.0@sha256:ab2239363e895f6d0aeab85e3cdd8aa67dda0e20fd033decc541924d79f4a12b

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
