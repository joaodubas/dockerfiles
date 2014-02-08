# multilevel
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

# Add nodejs multilevel app
ENV NODE_PORT 3001
ENV NODE_DB_PATH /opt/data
RUN mkdir -p /opt/{data,multilevel,app/log}
ADD ./app /opt/multilevel
ADD ./multilevel.conf /etc/supervisor/conf.d/program.d/multilevel.conf
RUN cd /opt/multilevel \
    && /usr/local/bin/npm install

# Set workdir
WORKDIR /opt/multilevel

# Add volume to handle data
VOLUME ['/opt/data', '/opt/app']

# Expose multilevel port
EXPOSE 3001
