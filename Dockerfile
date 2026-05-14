FROM debian:13.4-slim

ARG VERSION=unset

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        "ca-certificates=*" \
        "imapfilter=1:${VERSION}+*" \
        "python3=*" \
    && rm -rf \
        /var/lib/apt/lists/* \
    && mkdir /app /config \
    && chown 1000:1000 /app

ENV HOME=/app
USER 1000:1000
WORKDIR /app

ENTRYPOINT ["/usr/bin/imapfilter"]
