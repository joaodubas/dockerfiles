# levelHUD 

Image that runs [levelHUD][levelhud] to access a remote [leveldb][leveldb]
instance.

## Running

An example command to run this image is:

```shell
$ mkdir log
$ docker run -d -t \
-name levelhud \
-e DB_PORT_3001_TCP_ADDR:<address_to_multilevel> \
-e DB_PORT_3001_TCP_PORT:<port_to_multilevel> \
-v `pwd`/log:/opt/app/log \
joaodubas/levelhud:latest
```

### Environment variables

The connection to multilevel is made by two environment variables:

* `DB_PORT_3001_TCP_ADDR`: ip address to the machine hosting multilevel
* `DB_PORT_3001_TCP_PORT`: port to the machine hosting multilevel

If the [multilevel][docker-multilevel] image is used to expose the multilevel
instance, you can link both:

```shell
$ mkdir log
$ docker run -d -t \
-name levelhud \
-link <multilevel_container_name>:db \
-v `pwd`/log:/opt/app/log \
-p 40022:22 \
-p 9001:9001 \
-p 3002:3002 \
joaodubas/levelhud:latest
```

### Volumes

The image expects one volume to be made available:

* `/opt/app/log`: path were logs for `supervisor`, `sshd` and `multilevel`
  process are available.

# Ports

This image exposes the following private ports:

* 22: allow ssh access using the `root` user and the password `123root4`
* 9001: allow access to supervisor web interface
* 3002: allow access to levelhud

### SSH access

To access the container through `ssh`, assuming that the the public port is
40022:

```shell
$ ssh root@localhost -p 40022
```

[levelhud]: https://github.com/ricardobeat/levelhud
[leveldb]: https://code.google.com/p/leveldb/
[docker-multilevel]: https://index.docker.io/u/joaodubas/multilevel
