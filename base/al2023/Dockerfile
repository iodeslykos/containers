FROM public.ecr.aws/amazonlinux/amazonlinux:2023@sha256:93e933436ef6202191ca4287996200278d689fee4cdb6543c801caf9108c7f7c

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
