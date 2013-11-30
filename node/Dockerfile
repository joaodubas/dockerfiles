# nodejs
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Install node binary
ENV VERSION_NODE 0.10.22
RUN mkdir /opt/downloads \
    && wget http://nodejs.org/dist/v$VERSION_NODE/node-v$VERSION_NODE-linux-x64.tar.gz \
    && tar -xzf node-v$VERSION_NODE-linux-x64.tar.gz \
    && ln -s node-v$VERSION_NODE-linux-x64 nodejs \
    && ln -s /opt/downloads/nodejs/bin/* /usr/local/bin
