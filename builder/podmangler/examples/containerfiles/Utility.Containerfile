FROM alpine:3.22

RUN apk add --no-cache bash curl git jq yq

ENTRYPOINT ["/bin/bash"]
