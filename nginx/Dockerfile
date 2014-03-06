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

# Expose port 80
EXPOSE 80

# Define expected volumes
VOLUME ["/nginx"]

# Add base nginx configuration
ADD nginx.conf /usr/local/nginx/conf/
ADD mime.types /usr/local/nginx/conf/
ADD proxy_params /usr/local/nginx/conf/

# Add supervisor conf
ADD supervisor.conf /etc/supervisor/conf.d/program.d/nginx.conf
