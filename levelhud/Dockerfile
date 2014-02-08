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
RUN mkdir -p /opt/{levelhud,app/log}
ADD ./app /opt/levelhud
ADD ./levelhud.conf /etc/supervisor/conf.d/program.d/levelhud.conf
RUN cd /opt/levelhud\
    && /usr/local/bin/npm install

# Set workdir
WORKDIR /opt/levelhud

# Add volume to handle data
VOLUME ['/opt/app']

# Expose levelhud port
EXPOSE 3002
