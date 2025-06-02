ARG ALPINE_RELEASE=edge
FROM alpine:$ALPINE_RELEASE
RUN apk --no-cache upgrade && apk --no-cache add --upgrade dnsmasq-dnssec
EXPOSE 53 53/udp 67/udp 69/udp
ENTRYPOINT ["/usr/sbin/dnsmasq", "--keep-in-foreground"]
