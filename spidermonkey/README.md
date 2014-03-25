# Spidermonkey / JavaScript shell

This image is based in the [JavaScript shell][jsshell], that allows a developer
to experiment javascript code and execute javascript programs in the
Spidermonkey environment.

The `js` command is available in `/usr/local/bin`. Besides that the image
expects a volume to be mounted in `/opt/app` and automatically set this
directory as the workdir.

## Run

Since the image is based in `joaodubas/common:latest` we must override the
entrypoint to execute the shell.

To enter the interactive mode:

```shell
$ docker run -i -t --rm --entrypoint /usr/local/bin/js joaodubas/spidermonkey:latest -i
```

To execute a file:

```shell
$ docker run -i -t --rm --entrypoint /usr/local/bin/js -v $(pwd):/opt/app joaodubas/spidermonkey:latest -f <a file in $(pwd)>
```

To execute a file and enter the interactive mode:

```shell
$ docker run -i -t --rm --entrypoint /usr/local/bin/js -v $(pwd):/opt/app joaodubas/spidermonkey:latest -f <a file in $(pwd)> -i
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

[jsshell]: https://developer.mozilla.org/en-US/docs/SpiderMonkey/Introduction_to_the_JavaScript_shell
