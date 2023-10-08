FROM public.ecr.aws/amazonlinux/amazonlinux:2023 as base

LABEL org.opencontainers.image.title="al2023"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"
LABEL org.opencontainers.image.description="Amazon Linux 2023"

ARG UID=4249
ARG GID=4249
ARG USER=outis
ARG GROUP=outis

ENV TERM="xterm-256color" \
    TZ="Etc/UTC"

USER root

# Install necessary tools.
#hadolint ignore=DL3041
RUN dnf install -y shadow-utils sudo zsh\
    && \
    dnf clean all \
    && \
    sed -i "s/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/" /etc/sudoers \
    && \
    sed -i "s/%wheel\tALL=(ALL)\tALL/# %wheel\tALL=(ALL)\tALL/" /etc/sudoers \
    && \
    adduser --shell /bin/zsh --uid "${UID}" --home /home/"${USER}" --user-group "${USER}" --groups wheel

USER ${USER}
