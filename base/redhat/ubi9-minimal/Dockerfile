FROM docker.io/redhat/ubi9-minimal:9.5

ENV USER=outis
ENV GROUP=outis
ARG UID=1000
ARG GID=1000

# hadolint ignore=DL3041
RUN microdnf update -y \
    && microdnf install -y \
        bash ca-certificates findutils \
        openssl zsh \
        --setopt=tsflags=nodocs \
    && microdnf clean all \
    && rm -rf /var/cache /var/log/dnf* \
    && groupadd -g ${GID} ${GROUP} \
    && useradd -u ${UID} -g ${GROUP} -ms /bin/bash ${USER}
