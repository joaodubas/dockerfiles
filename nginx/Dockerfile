# nginx
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Update system and install deps
RUN apt-get -y -qq update \
    && apt-get -y -qq install build-essential wget libpcre3 libpcre3-dev zlib1g zlib1g-dev

# Retrieve nginx
ENV NGINX_VERSION 1.5.10
RUN mkdir /opt/downloads \
    && cd /opt/downloads \
    && wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz \
    && tar -xzf nginx-$NGINX_VERSION.tar.gz \
    && cd nginx-$NGINX_VERSION \
    && ./configure \
    && make install \
    && ln /usr/local/nginx/sbin/* /usr/local/sbin/

# Prepare nginx.conf
RUN sed -ri %s/#user nobody/user root root/g
