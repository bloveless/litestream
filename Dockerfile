FROM golang:1.18.0-bullseye AS builder

RUN wget https://github.com/benbjohnson/litestream/archive/refs/tags/v0.3.8.tar.gz && \
    tar xvvf v0.3.8.tar.gz && \
    cd litestream-0.3.8 && \
    go install ./cmd/litestream

FROM debian:bullseye-slim

COPY entrypoint.sh /entrypoint.sh
COPY --from=builder /go/bin/litestream /usr/local/bin/litestream

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

