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

[doc-dockerfile]: http://docs.docker.io/en/latest/use/builder/
[doc-install]: http://docs.docker.io/en/latest/installation/
