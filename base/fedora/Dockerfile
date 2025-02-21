FROM fedora:rawhide

ENV USER=outis
ENV GROUP=outis
ENV UID=1000
ENV GID=1000

RUN dnf update -y \
    && dnf install -y \
        bash ca-certificates findutils \
        openssl zsh \
        --setopt=tsflags=nodocs \
    && dnf clean all \
    && rm -rf /var/cache /var/log/dnf* \
    && groupadd -g ${GID} ${GROUP} \
    && useradd -u ${UID} -g ${GROUP} -ms /bin/bash ${USER}
