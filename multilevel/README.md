# Multilevel

Image that allow remote access to [leveldb][leveldb] through
[multilevel][multilevel] package.

## Running

An example command to run the `multilevel` image is:

```shell
$ mkdir -p{data,app/log}
$ docker run -d -t \
>    -name multilevel-db \
>    -p 40022:22 \
>    -p 9001:9001 \
>    -p 3001:3001 \
>    -v `pwd`/data:/opt/data \
>    -v `pwd`:/opt/app \
>    joaodubas/multilevel:latest
```

### Volumes

The image expects two volumes to be made available:

* `/opt/data`: path were the leveldb data is available.
* `/opt/app`: path that contain a `log` dir, where logs for `supervisor`, `sshd`
  and `multilevel` process are available.

### Ports

Three ports are made available to access the container:

* 22: allow ssh access using the `root` user and the password `123root4`
* 9001: allow access to supervisor web interface
* 3001: allow access to multilevel

This should start a container named `multilevel-db`, redirecting the ports
40022 to 22, 9001 to 9001 and 3001 to 3001, and mouting the directoris `./data`
and `./log` into `/opt/data` and `/opt/app/log` respectively.

### SSH access

To access the container through `ssh`, assuming that the the public port is
40022:

```shell
$ ssh root@localhost -p 40022
```

### Client access to multilevel

Using [node.js][nodejs], and having [multilevel][multilevel] package installed
on the client:

```javascript
var net = require('net');
var multilevel = require('multilevel');

var db = multilevel.client();
var conn = net.connect({
  port: 3001,  // public port exposed to the container
  host: "<container_ip_address>"
});

conn.pipe(db.createRpcStream()).pipe(conn);
```

To discover the container's ip address issue the command:

```shell
$ docker inspect pandora | python -c "import sys; import json; print json.loads(sys.stdin.read())[0]['NetworkSettings']['IPAddress']"
```

[leveldb]: https://code.google.com/p/leveldb/
[multilevel]: https://github.com/juliangruber/multilevel
[nodejs]: http://nodejs.org
