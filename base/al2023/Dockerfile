FROM public.ecr.aws/amazonlinux/amazonlinux:2023.5.20240624.0@sha256:51abd9ef38661d7236db924366f9ac68b6e10febeabd261e1d1431611af53861

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
