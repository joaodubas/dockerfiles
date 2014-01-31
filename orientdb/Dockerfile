# orientdb
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Get needed packages
RUN apt-get -y -qq update \
    && apt-get -y -qq install wget openjdk-7-jdk git-core ant

# Get orientdb
ENV ORIENT_VERSION 1.6.4
RUN mkdir /opt/downloads \
    && cd /opt/downloads \
    && wget http://www.orientdb.org/portal/function/portal/download/paywithatweet/-/-/-/-/-/orientdb-community-$ORIENT_VERSION.tar.gz/false/false/linux \
    && tar -xzf linux \
    && cd orientdb-community-$ORIENT_VERSION \
    && ln -s ./bin/* /usr/local/bin/

# Expose port 2424 and 2480 for orientdb connectivity
EXPOSE 2424
EXPOSE 2480

# Add supervisor conf file
ADD orientdb.conf /etc/supervisor/conf.d/program.d/orientdb.conf
