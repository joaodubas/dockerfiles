# nodejs
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Update dependencies
RUN apt-get -y update \
    && apt-get -y install git

# Install node binary
ENV VERSION_NODE 0.11.11
RUN mkdir /opt/downloads \
    && cd /opt/downloads \
    && wget http://nodejs.org/dist/v$VERSION_NODE/node-v$VERSION_NODE-linux-x64.tar.gz \
    && tar -xzf node-v$VERSION_NODE-linux-x64.tar.gz \
    && ln -s node-v$VERSION_NODE-linux-x64 nodejs \
    && ln -s /opt/downloads/nodejs/bin/* /usr/local/bin
