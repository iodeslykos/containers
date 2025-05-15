FROM public.ecr.aws/amazonlinux/amazonlinux:2023.7.20250512.0@sha256:ff1fad724e2ef77b8851124cbc35204d1defe63128f077021a2b3e459fcd866f

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl findutils \
        openssl shadow-utils zsh \
    && dnf clean all

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
