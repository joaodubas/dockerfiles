# leveldb
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

RUN apt-get -y update \
    && apt-get -y install build-essential automake autoconf

RUN apt-get -y install software-properties-common \
    && add-apt-repository 'deb http://archive.ubuntu.com/ubuntu saucy main' \
    && apt-get -y update \
    && apt-get -y install libleveldb-dev libleveldb1
