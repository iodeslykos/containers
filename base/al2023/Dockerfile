FROM public.ecr.aws/amazonlinux/amazonlinux:2023.3.20240219.0@sha256:38701a173dc0dea352df1bb934c3269053cf4137a9325e68ebef971a3d39beee

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

# hadolint ignore=DL3041
RUN dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates curl openssl shadow-utils zsh \
    && dnf clean all

RUN groupadd -g ${GID} ${GROUP} \
    && adduser -u ${UID} ${USER} -g ${GROUP}
