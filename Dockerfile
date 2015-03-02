FROM gliderlabs/alpine:3.1
RUN apk-install dnsmasq
ENTRYPOINT ["dnsmasq", "-k"]
