# docker-dnsmasq

Alpine Linux-based [dnsmasq][dnsmasq] Docker image, about 10 MB in size.
With minimal fuzz, it just provides an `ENTRYPOINT` to the `dnsmasq` binary.

## Usage

CAVEAT EMPTOR: It is usually a good idea to use a tag other than `latest` if you are using this
image in a production setting.

There are two tags to choose from:

- `4km3/dnsmasq:2.90-r3`: dnsmasq 2.90-r3 based on Alpine 3.21 (for backwards compatibility, `latest` points to this tag)
- `4km3/dnsmasq:edge`: based on Alpine edge

Dnsmasq requires `NET_ADMIN` capabilities to run correctly.
Start it with something like `docker run -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN 4km3/dnsmasq:2.90-r3`.

The configuration is all handled on the command line (no wrapper scripts here).
The `ENTRYPOINT` is `dnsmasq --keep-in-foreground` to keep it running in the foreground.
If you wanted to send requests for an internal domain (such as Consul) you can forward
the requests upstream using something like `docker run -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN 4km3/dnsmasq:2.75 -S /consul/10.17.0.2`.
This will send a request for `redis.service.consul` to `10.17.0.2`

As this is a very barebones entrypoint with just enough to run in the
foreground, there is no logging enabled by default.
To send logging to stdout you can add `--log-facility=-` as an option.

## Traceability

These Docker images are automatically labeled with the Git commit revision of
the tree that was used to produce them, and can be obtained by running:

    docker image inspect foo | jq '.[0].Config.Labels["org.opencontainers.image.revision"]'

or

    podman image inspect foo | jq '.[0].Labels["org.opencontainers.image.revision"]'


[dnsmasq]: http://www.thekelleys.org.uk/dnsmasq/doc.html
