# docker-dnsmasq

It's a [dnsmasq][dnsmasq] Docker image. It is only 6 MB in size. It is just an `ENTRYPOINT` to the `dnsmasq` binary. Can you smell what the rock is cookin'?

## Usage

It is usually a good idea to use a tag other than `latest` if you are using this image in a production setting. There are currently two tags to choose from:

* `andyshinn/dnsmasq:2.72`: dnsmasq 2.72 based on Alpine 3.2
* `andyshinn/dnsmasq:2.75`: dnsmasq 2.75 based on Alpine 3.3
* `andyshinn/dnsmasq:2.76`: dnsmasq 2.76 based on Alpine 3.4

The configuration is all handled on the command line (no wrapper scripts here). The `ENTRYPOINT` is `dnsmasq -k --user=root` to keep it running in the foreground without trying to drop root privileges.  We keep dnsmasq running as root to avoid the requirement for `NET_ADMIN` capabilites being required.

If you wanted to send requests for an internal domain (such as Consul) you can forward the requests upstream using something like `docker run -p 53:53/tcp -p 53:53/udp andyshinn/dnsmasq:2.75 -S /consul/10.17.0.2`. This will send a request for `redis.service.consul` to `10.17.0.2`

As this is a very barebones entrypoint with just enough to run in the foreground, there is no logging enabled by default. To send logging to stdout you can add `--log-facility=-` as an option.

[dnsmasq]: http://www.thekelleys.org.uk/dnsmasq/doc.html
