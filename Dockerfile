ARG ALPINE_VERSION=edge
FROM alpine:$ALPINE_VERSION
RUN apk --no-cache add dnsmasq-dnssec dumb-init
EXPOSE 53 53/udp
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/usr/sbin/dnsmasq", "-k"]
