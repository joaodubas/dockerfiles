# multilevel
#
# VERSION: see `TAG`
FROM joaodubas/nodejs:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

RUN apt-get -y update \
    && apt-get -y install build-essential automake autoconf

RUN apt-get -y install software-properties-common \
    && add-apt-repository 'deb http://archive.ubuntu.com/ubuntu saucy main' \
    && apt-get -y update \
    && apt-get -y install libleveldb-dev libleveldb1

ADD . /opt/multilevel
ENV NODE_PORT 3001
RUN cd /opt/multilevel \
    && /usr/local/bin/npm install \
    && ln -s multilevel.conf /etc/supervisor/conf.d/program.d/ \
    && npm install

EXPOSE 3001
