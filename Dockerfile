FROM alpine:3.2
RUN apk -U add dnsmasq
ENTRYPOINT ["dnsmasq", "-k"]
