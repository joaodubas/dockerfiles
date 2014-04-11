# maestro-ng
#
# VERSION: see `TAG`
FROM debian:jessie
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# provision system
RUN apt-get -y -qq update \
    && apt-get -y -qq install \
        build-essential \
        libyaml-dev \
        python-dev \
        python-setuptools \
        git-core \
    && easy_install pip

# install maestro-ng
RUN pip install \
    PyYAML==3.11 \
    docker-py==0.3.1 \
    git+git://github.com/signalfuse/maestro-ng

# expected volume and working directory
VOLUMES ["/opt/host"]
WORKDIR ["/opt/host"]

# expose maestro command
ENTRYPOINT ["/usr/local/bin/maestro"]
