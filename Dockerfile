ARG ALPINE_RELEASE=edge
FROM alpine:$ALPINE_RELEASE
RUN apk --no-cache add dnsmasq-dnssec
EXPOSE 53 53/udp 67/udp 69/udp
ENTRYPOINT ["/usr/sbin/dnsmasq", "--keep-in-foreground"]
