# Dockerfiles

This is a colletion of [`Dockerfiles`][doc-dockerfile] that I commonly use
during my workday.

By no means these images are optmized to be used in prodution.

## Usage

Fist of all you should have docker installed, follow the [guideline available in
docker documentation][doc-install].

With `docker` command available, you can install any image available in this
repo by typing:

```shell
$ make install image=<image_name>
```

The available images are:

* COMMON
* PYTHON_VENV
* NODE
* NODE_UNSTABLE
* ORIENT

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

[doc-dockerfile]: http://docs.docker.io/en/latest/use/builder/
[doc-install]: http://docs.docker.io/en/latest/installation/
