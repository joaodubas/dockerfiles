# Go Continuous Delivery and Management Release Agent

This is the agent piece of *Go Continuous Delivery and Release Management
System*.

To understand what's Go, I really recommend reading the [*Go
Concepts*][go-concepts]

## Details

By default this image starts the Go Agent. To connect the agent with the
server, a variable `GO_SERVER` with the ip or hostname to Go Server should be
set, if this isn't available the agent will try to stablish a connection to the
localhost.

## Run

```
$ docker run -d --name go-agent --link go-server:server --env GO_SERVER=server joaodubas/gocd-agent:latest
```

This run command expect that a container with the Go Server to be running with a
name `go-server`. Since docker add an entry to `/etc/hosts` resolving the ip of
the linked parent for the provided alias, we set `GO_SERVER` to be the link
alias.

## Stop

```
$ docker stop go-agent
```

[go-concepts]: http://www.thoughtworks.com/products/docs/go/current/help/concepts_in_go.html
