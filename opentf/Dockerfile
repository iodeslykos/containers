# hadolint global ignore=DL3018
FROM golang:alpine as builder

LABEL org.opencontainers.image.title="opentf"
LABEL org.opencontainers.image.authors="iodeslykos <42@iodeslykos.com>"
LABEL org.opencontainers.image.url="https://opentf.org"
LABEL org.opencontainers.image.source="https://github.com/opentffoundation/opentf"

ARG workdir=/go/src/github.com/opentffoundation/opentf
ARG opentf_branch=main

ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go

WORKDIR ${workdir}

RUN apk add --no-cache \
    git

RUN git clone --depth 1 --branch ${opentf_branch} https://github.com/opentffoundation/opentf.git ${workdir}

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-w -extldflags "-static"' -o /bin/opentf

FROM alpine:3.18

COPY --from=builder /bin/opentf /usr/local/bin/opentf

ENTRYPOINT [ "opentf" ]
CMD [ "--help" ]
