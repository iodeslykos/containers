FROM jenkins/inbound-agent:latest-jdk17

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl git make \
    && rm -rf /var/lib/apt/lists/*

USER jenkins
