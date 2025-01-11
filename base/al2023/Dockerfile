FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250107.0@sha256:115e4b0c86e75eb6c34049d8369c932cd40a5588a98a83187a9bd1d150cd2679

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
