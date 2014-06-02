# Moodle with ftp service
#
# VERSION: see `TAG`
FROM joaodubas/moodle:201406.1
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        python-setuptools \
        openssl \
        sudo

# install ftpd server
RUN easy_install pip \
    && pip install \
        pyftpdlib \
        --allow-external pyftpdlib \
        --allow-unverified pyftpdlib

# configure ftpd
ENV FTPD_PORT 8910
ADD pyftpd /usr/local/bin/pyftpd
RUN chmod 770 /usr/local/bin/pyftpd

# add user unprivileged user
RUN useradd \
        -G sudo,www-data \
        -d /home/app \
        -m \
        -p $(openssl passwd 123app4) \
        -s /bin/bash \
        app

# add circus conf
ADD ftpd.ini /etc/circus/conf.d/watcher.d/

# configure container run
EXPOSE 8910
