ARG ALPINE_VERSION=edge
FROM alpine:$ALPINE_VERSION
RUN apk --no-cache add dnsmasq-dnssec
EXPOSE 53 53/udp 67/udp 69/udp
ENTRYPOINT ["/usr/sbin/dnsmasq", "-k"]
