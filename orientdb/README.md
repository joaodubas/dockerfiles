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

[orientdb]: http://www.orientechnologies.com/orientdb/
