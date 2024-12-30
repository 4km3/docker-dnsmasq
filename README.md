# docker-dnsmasq

It's a [dnsmasq][dnsmasq] Docker image. It is only 4 MB in size. It is just an
`ENTRYPOINT` to the `dnsmasq` binary. Can you smell what the rock is cookin'?

## Usage

It is usually a good idea to use a tag other than `latest` if you are using this
image in a production setting. There are two tags to choose from:

- `4km3/dnsmasq:2.90-r3`: dnsmasq 2.90-r3 based on Alpine 3.21 (for backwards compatibility, `latest` points to this tag)
- `4km3/dnsmasq:edge`: based on Alpine edge

[dnsmasq][dnsmasq] requires `NET_ADMIN` capabilities to run correctly. Start it
with something like `docker run -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN 4km3/dnsmasq:2.90-r3`.

The configuration is all handled on the command line (no wrapper scripts here).
The `ENTRYPOINT` is `dnsmasq -k` to keep it running in the foreground. If you
wanted to send requests for an internal domain (such as Consul) you can forward
the requests upstream using something like `docker run -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN 4km3/dnsmasq:2.75 -S /consul/10.17.0.2`. This will send a
request for `redis.service.consul` to `10.17.0.2`

As this is a very barebones entrypoint with just enough to run in the
foreground, there is no logging enabled by default. To send logging to stdout
you can add `--log-facility=-` as an option.

[dnsmasq]: http://www.thekelleys.org.uk/dnsmasq/doc.html
