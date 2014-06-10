# Python example app

This is sample Flask app that shows how one can use the `joaodubas/python-venv`
docker image.

## Image building

To build the image it's necessary to add a `id_rsa.pub` file to the root
folder, this will be used to allow ssh access to the container.

With the `id_rsa.pub` in the folder run the command:
`docker build --rm --tag $(cat REPOSITORY):$(cat TAG) .`

## Image configuration

By default the image expose the following ports:

* _22_: `sshd` service
* _9001_: `supervisord` service
* _8080_: python app service

And the folder `/opt/app` is an expected external volume that should contain
the `python` app code and a `log` folder where the `supervisord` process will
output the log files related to running services.

## Container execution

A `Makefile` is provided to execute the example image, with the following
commands:

* `_start_`: execute the default command for the image, that starts
  `supervisord`, `sshd` and `python` app processes.
* `_run_`: run only the `python` app code.
* `_ipython_`: run an `ipython` console.

One _can't_ run all commands at the same time, since all use the same ports to
expose the container services.
