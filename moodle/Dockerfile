# moodle
#
# VERSION: see `TAG`
FROM stackbrew/ubuntu:14.04
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# update system and install deps
RUN apt-get -i -qq --force-yes update \
    && apt-get -i -qq --force-yes install \
        software-properties-common \
        git \
        nginx-full \
        php5 \
        php5-fpm \
        php5-gd \
        php5-curl \
        php5-intl \
        php5-xmlrpc \
        php5-json \
        php5-apcu

# install mariadb
RUN apt-key \
        adv \
        --recv-keys \
        --keyserver \
        hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db \
    && add-apt-repository -y \
        'deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu trusty main' \
    && apt-get -i -qq --force-yes update \
    && apt-get -i -qq --force-yes install \
        mariadb-client \
        php5-mysql

# clone moodle
RUN mkdir -p /opt/src \
    && cd /opt/src \
    && git clone https://github.com/moodle/moodle.git \
    && cd moodle \
    && git checkout -t origin/MOODLE_26_STABLE \
    && chmod 0755 /opt/src/moodle

# create data folder
RUN mkdir /var/moodledata \
    && chmod 0777 /var/moodledata
