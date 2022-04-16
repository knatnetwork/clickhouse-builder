# Clickhouse Builder

This is a image contains necessary dependencies for building Clickhouse, can be used for further building, the building `Dockerfile` should like this:

```Dockefile
FROM knatnetwork/clickhouse-builder:latest

ENV CC=clang-12
ENV CXX=clang++-12

...

WORKDIR /root
COPY ClickHouse /root/ClickHouse
RUN cd /root/ClickHouse && mkdir build && cd build && cmake .. && ninja
RUN cd /root/ClickHouse/docker/server && tcc su-exec.c -o /bin/su-exec && chown root:root /bin/su-exec

...
```

## Image

This repo provides the following images, both are Multi-Arch(amd64/arm64 supported):

* `knatnetwork/clickhouse-builder:latest`
* `ghcr.io/knatnetwork/clickhouse-builder:latest`

## License

GPL