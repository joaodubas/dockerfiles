# levelhud
#
# VERSION: see `TAG`
FROM joaodubas/nodejs:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Add needed deps to build leveldb
RUN apt-get -y update \
    && apt-get -y install build-essential automake autoconf

# Add leveldb
RUN apt-get -y install software-properties-common \
    && add-apt-repository 'deb http://archive.ubuntu.com/ubuntu saucy main' \
    && apt-get -y update \
    && apt-get -y install libleveldb-dev libleveldb1

# Add nodejs levelhud app
ENV NODE_PORT 3002
RUN mkdir -p /opt/{data,app/log}
ADD ./app /opt/app
ADD ./levelhud.conf /etc/supervisor/conf.d/program.d/levelhud.conf
RUN cd /opt/app \
    && /usr/local/bin/npm install

# Set workdir
WORKDIR /opt/app

# Add volume to handle data
VOLUME ['/opt/data', '/opt/app']

# Expose levelhud port
EXPOSE 3002
