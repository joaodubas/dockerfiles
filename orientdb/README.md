# OrientDB image

Base image that exposes an [`orientdb`][orientdb] instance, in ports `2424` and
`2480`.

## Running

Since this image inherit from `joaodubas/common` you must mount a directory
with a `log` dir in `/opt/app` destination.

It's important to note that the ports `9001` and `22` are also exposed, to
allow access to supervisor and ssh, respectively.

```shell
$ mkdir log
$ docker run -d -t -v `pwd`:/opt/app -p 2424:2424 -p 2480:2480 -p 9001:9001 -p 40022:22 joaodubas/orientdb:latest
```

[orientdb]: http://www.orientechnologies.com/orientdb/
