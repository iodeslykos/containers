FROM public.ecr.aws/amazonlinux/amazonlinux:2023.6.20250203.1@sha256:de2d62ca765c67df69485488aa3702c2ea056b046eb99b18a5af3429b8e9b952

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
