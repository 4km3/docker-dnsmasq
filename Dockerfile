FROM alpine:edge
RUN apk --no-cache add dnsmasq
EXPOSE 53 53/udp
ENTRYPOINT ["sh", "-c", "dnsmasq -k $OPTION"]
