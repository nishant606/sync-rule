FROM ghcr.io/powersync-ja/powersync-service:latest

WORKDIR /tmp

COPY powersync.yaml /tmp/powersync.yaml
COPY sync_rules.yaml /tmp/sync_rules.yaml

EXPOSE 8080

CMD ["/usr/local/bin/powersync", "start", "--config=/tmp/powersync.yaml"]
