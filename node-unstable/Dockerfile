# nodejs unstable branch
#
# VERSION: see `TAG`
FROM debian:jessie
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# update dependencies
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install git build-essential wget

# install node binary
ENV NODE_VERSION 0.11.13
ENV NODE_FILENAME node-v${NODE_VERSION}-linux-x64
ENV NODE_TGZ ${NODE_FILENAME}.tar.gz
RUN mkdir /opt/downloads \
    && cd /opt/downloads \
    && wget http://nodejs.org/dist/v${NODE_VERSION}/${NODE_TGZ} \
    && tar -xzf ${NODE_TGZ} \
    && ln -s ${NODE_FILENAME} nodejs \
    && ln -s /opt/downloads/nodejs/bin/* /usr/local/bin

# cleanup temp files
RUN apt-get -y -qq --force-yes clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
