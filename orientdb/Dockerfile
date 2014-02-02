# orientdb
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Get needed packages
RUN apt-get -y -qq update \
    && apt-get -y -qq install wget git-core

# Fake fuse install to allow jdk
# Based on solution in gist by Henrik Muehe
# https://gist.github.com/henrik-muehe/6155333
# For the issue 514 in docker
# https://github.com/dotcloud/docker/issues/514
RUN apt-get -y -qq install libfuse2 \
    && cd /tmp \
    && apt-get -y -qq download fuse \
    && dpkg-deb -x fuse_* . \
    && dpkg-deb -e fuse_* \
    && rm fuse_*.deb \
    && echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst \
    && dpkg-deb -b . /fuse.deb \
    && dpkg -i /fuse.deb

# Get jdk and ant
RUN apt-get -y -qq install openjdk-7-jdk ant

# Get orientdb
ENV ORIENT_VERSION orientdb-community-1.6.4
RUN mkdir /opt/downloads \
    && cd /opt/downloads \
    && wget http://www.orientdb.org/portal/function/portal/download/paywithatweet/-/-/-/-/-/$ORIENT_VERSION.tar.gz/false/false/linux \
    && tar -xzf linux \
    && cd $ORIENT_VERSION \
    && ln -s /opt/downloads/$ORIENT_VERSION/bin/* /usr/local/bin/

# Expose port 2424 and 2480 for orientdb connectivity
EXPOSE 2424
EXPOSE 2480

# Add supervisor conf file
ADD orientdb.conf /etc/supervisor/conf.d/program.d/orientdb.conf
