# Common Dockerfile

This image layout a foundation where other images can be built upon. It exposes
[circusd][circusd] and [sshd][sshd] services, so one can access a container
while it's running.

By default the following ports are exposed:

* _22_: ssh access
* _8080_: circusweb access

Besides that, two volumes are expected to be mounted:

* `/log`: where all log files from `circusd` should be stored
* `/etc/circus/conf.d/hook.d`: where custom [watchers][circus-watcher] can be
  implemented. These watchers run during container execution.

## Usage

The circus process is run by default whe a container using this image is
started. It expects a `/log` folder to be mounted from the host. So the easiest
way to stat a container would be:

```shell
$ mkdir log
$ docker run -d -i -t -v `pwd`/log:/log -p 40022:22 -p 9111:8080 -name circus joaodubas:common:latest
```

To access circusweb console, go to url http://127.0.0.1:9111.

To access the container through ssh issue:

```shell
$ ssh root@localhost -p 40022
```

The password for the root user is: __123root4__

### Adding watchers to circus

It's possible to add new watcher to circus manage by mouting a directory with
the `*.ini` files to `/etc/circus/conf.d/hook.d`. For example:

```shell
$ mkdir {log,circus}
$ touch circus/watcher.ini
$ docker run -d -i -t -v `pwd`/log:/log -v `pwd`/circus:/etc/circus/conf.d/hook.d joaodubas/common:latest
```

# LICENSE

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

[circusd]: http://circus.readthedocs.org/en/latest/
[circus-watcher]: http://circus.readthedocs.org/en/latest/for-ops/configuration/#watcher-name-as-many-sections-as-you-want
[sshd]: http://www.openssh.com
