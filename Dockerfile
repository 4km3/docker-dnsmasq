FROM gliderlabs/alpine:3.1
RUN apk-install dnsmasq
EXPOSE 53
EXPOSE 53/udp
ENTRYPOINT ["dnsmasq", "-k"]
