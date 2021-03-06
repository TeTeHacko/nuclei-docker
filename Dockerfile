FROM golang:alpine as builder

RUN apk add --no-cache git
RUN GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
RUN GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei

FROM alpine

COPY --from=builder /go/bin/httpx /usr/local/bin/
COPY --from=builder /go/bin/nuclei /usr/local/bin/

ENTRYPOINT ["/scan.sh"]
