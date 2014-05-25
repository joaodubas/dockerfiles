# mariadb
#
# VERSION: see `TAG`
FROM stackbrew/ubuntu:14.04
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# update system and install deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install software-properties-common

# enable mariadb source
RUN apt-key adv \
        --recv-keys \
        --keyserver \
        hkp://keyserver.ubuntu.com:80 \
        0xcbcb082a1bb943db \
    && add-apt-repository -y \
        'deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu trusty main'

# install mariadb
RUN apt-get -y -qq --force-yes update \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get -y -qq --force-yes install mariadb-server pwgen inotify-tools

# configure mariadb
RUN sed -i -e 's/^datadir\s*=.*/datadir = \/data/' /etc/mysql/my.cnf \
    && sed -i -e 's/^bind-address/#bind-address/' /etc/mysql/my.cnf \
    && sed \
        -i \
        -e \
        's/^innodb_buffer_pool_size\s*=.*/innodb_buffer_pool_size = 128M/' \
        /etc/mysql/my.cnf

# add needed files
ADD scripts /scripts
RUN chmod 700 /scripts/start.sh \
    && touch /firstrun

# remove unused system packages and files
RUN apt-get -y -qq --force-yes purge software-properties-common \
    && apt-get -y -qq --force-yes autoremove \
    && apt-get -y -qq --force-yes clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configure command
EXPOSE 3306
VOLUMNE ["/data", "/var/log/mysql", "/etc/mysql"]
CMD ["/scripts/start.sh"]
