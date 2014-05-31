# moodle with ftp service
#
# VERSION: see `TAG`
FROM joaodubas/moodle:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install needed system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes python-setuptools openssl sudo\
    && easy_install pip

# install python ftpd service
RUN /usr/local/bin/pip \
        install \
        pyftpdlib \
        --allow-external \
        pyftpdlib \
        --allow-unverified \
        pyftpdlib

# create user to access ftpd service
RUN useradd \
        -G sudo,www-data \
        -d /home/app \
        -m \
        -p $(openssl passwd 123app4) \
        -s /bin/bash \
        app

# add ftpd service to circus
ADD ftpd.ini /etc/circus/conf.d/watcher.d/ftpd.ini

# remove unused system packages and files
RUN apt-get -y -qq --force-yes autoremove \
    && apt-get -y -qq --force-yes clean \
    && /var/lib/apt/lists/* /tmp/* /var/tmp/*

# setup envs
ENV FTPD_HOME_FOLDER /home/app
ENV FTPD_PORT 8921

# configure container command
EXPOSE 8921