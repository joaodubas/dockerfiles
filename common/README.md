# Common Dockerfile

This image layout a foundation where other images can be built upon. It exposes
the [`supervisord`][supervisor] and [`sshd`][ssh] services, so one can access a
container while it's running.

By default it also exposes two ports:

* _22_: to allow ssh acccess
* _9001_: to access supervisor web console

## Usage

The supervisor process is run by default when a container using this image is
started. It expects that a `log` folder be available in `/opt/app` path. So the
easiest way to start a container would be:

```shell
$ mkdir log
$ docker run -d -i -t -v `pwd`:/opt/app -p 40022:22 -p 9001:9001 joaodubas/common:latest
```

And that is it. the `-v` flag indicate that a directory from the host machine
should be mounted in the container in the given location. The `-p` create a
port forwarding from the host the container.

To see if your container is running type `$ docker ps` and a output like the
one bellow should be seen (edited to better fit the page).

```shell
CONTAINER ID  IMAGE                   COMMAND               CREATED        STATUS        PORTS                   NAMES
be213bfd4c43  joaodubas/common:0.0.4  /usr/bin/supervisord  2 minutes ago  Up 2 minutes  0.0.0.0:40022->22/tcp,  focused_tesla
                                                                                         0.0.0.0:9001->9001/tcp
```

To access the supervisor web console, go to the url _http://127.0.0.1:9001_ and
use the credentials:

* _username_: admin
* _password_: 123admin4

To access the container through ssh connect to the container using:

```shell
$ ssh root@localhost -p 40022
```

The password for the root user is 123root4.

### Adding new process to the supervisor

It's possible to add new process to supervisor manage by mouting a directory
with the conf file in the `/etc/supervisor/conf.d/hook.d`. For example:

```shell
$ mkdir {log,supervisor}
$ touch supervisor/new.conf
$ docker run -d -i -t -v `pwd`:/opt/app -v `pwd`/supervisor:/etc/supervisor/conf.d/hook.d joaodubas/common:latest
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

[supervisor]: http://supervisord.org/
[ssh]: http://www.openssh.com
