# Go Continuous Delivery and Release Management Server

This is the server piece of *Go Continuous Delivery and Release Management
System*.

To understand what's Go, I really recommend reading the [*Go
Concepts*][go-concepts].

## Details

By default this image starts the Go server, and exposes the port `8153`,
allowing anyone to access the service through this.

## Run

```shell
$ docker run -d --name gocd-server -p 8153:8153 joaodubas/gocd-server:latest
```

## Stop

```shell
$ docker stop gocd-server
```

[go-concepts]: http://www.thoughtworks.com/products/docs/go/current/help/concepts_in_go.html
