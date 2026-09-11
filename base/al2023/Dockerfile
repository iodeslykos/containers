FROM public.ecr.aws/amazonlinux/amazonlinux:2027.0.20260903.0@sha256:a6c4227aac90ecad487ee5fc82849b2d043659fffed35fd68473c262e2a96e94

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
