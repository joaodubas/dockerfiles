# mariadb
#
# VERSION: see `TAG`
FROM debian:jessie
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# enable debian source
RUN apt-key add \
        --recv-keys \
        --keyserver \
        keyserver.ubuntu.com 0xcbcb082a1bb943db \
    && echo "deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/debian sid main" \
        > /etc/apt/sources.list.d/mariadb"

# install mariadb
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install mariadb-server pwgen inotify-tools

# cleanup apt
RUN apt-clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configure mariadb
RUN sed -i -e 's/^datadir\s*=.*/datadir = \/data/' /etc/mysql/my.cnf \
    && sed -i -e 's/^bind-address/#bind-address/' /etc/mysql/my.cnf \
    && sed \
        -i \
        -e \
        's/^innodb_buffer_pool_size\s*=.*/innodb_buffer_pool_size = 128M' \
        /etc/mysql/my.cnf

# add needed files
ADD scripts /scripts
RUN chmod 700 /scripts/start.sh \
    && touch /firstrun

# configure command
EXPOSE 3306
VOLUMNE ["/data", "/var/log/mysql", "/etc/mysql"]
CMD ["/scripts/start.sh"]
