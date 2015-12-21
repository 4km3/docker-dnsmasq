FROM alpine:3.2
RUN apk -U add dnsmasq \
  && rm -rf /var/cache/apk/*
EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "-k"]
