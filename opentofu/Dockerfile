# hadolint global ignore=DL3018
FROM golang:alpine as builder

LABEL org.opencontainers.image.title="opentofu"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"
LABEL org.opencontainers.image.url="https://opentofu.org"
LABEL org.opencontainers.image.source="https://github.com/opentofu/opentofu/"

ARG build_arch=amd64
ARG workdir=/go/src/github.com/opentofu/opentofu
ARG opentf_branch=main

ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go

WORKDIR ${workdir}

RUN apk add --no-cache \
    git

RUN git clone --depth 1 --branch ${opentf_branch} https://github.com/opentofu/opentofu.git ${workdir}

RUN CGO_ENABLED=0 GOOS=linux GOARCH=${build_arch} go build -a -ldflags '-w -extldflags "-static"' -o /bin/opentofu

FROM alpine:3.18

COPY --from=builder /bin/opentofu /usr/local/bin/opentofu

ENTRYPOINT [ "opentofu" ]
CMD [ "--help" ]
