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
-v `pwd`:/opt/app \
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

* `/opt/app`: path that contains a `log` dir, were logs for `supervisor`, `sshd`
  and `multilevel` process are available.

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

## LICENSE

Copyright (c) 2014 Joao Paulo Dubas <joao.dubas@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[levelhud]: https://github.com/ricardobeat/levelhud
[leveldb]: https://code.google.com/p/leveldb/
[docker-multilevel]: https://index.docker.io/u/joaodubas/multilevel
