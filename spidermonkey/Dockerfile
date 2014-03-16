# spidermonkey
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Install deps
RUN apt-get -y -qq update \
    && apt-get -y -qq install zip unzip libnspr4-dev

# Download binary
RUN mkdir -p /opt/downloads/jsshell \
    && cd /opt/downloads \
    && wget http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/jsshell-linux-x86_64.zip \
    && unzip jsshell-linux-x86_64.zip -d /opt/downloads/jsshell \
    && ln -s /opt/downloads/jsshell/js /usr/local/bin \
    && ln -s /opt/downloads/jsshell/*.so /usr/local/share
