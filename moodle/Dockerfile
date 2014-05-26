# moodle
#
# VERSION: see `TAG`
FROM stackbrew/ubuntu:14.04
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# update system and install deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        software-properties-common \
        wget \
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
        hkp://keyserver.ubuntu.com:80 \
        0xcbcb082a1bb943db \
    && add-apt-repository -y \
        'deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu trusty main' \
    && apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        mariadb-client \
        php5-mysql

# download moodle
ENV APP_V 27
ENV APP_S stable$APP_V
ENV APP_C moodle-latest-$APP_V.tgz
RUN mkdir -p /opt/src \
    && cd /opt/src \
    && wget http://download.moodle.org/download.php/direct/$APP_S/$APP_C \
    && tar -xzf $APP_C \
    && mkdir /var/moodledata

# install circus
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        python-setuptools \
        python-dev \
        libzmq3-dev \
        libevent-dev \
    && easy_install pip \
    && pip install circus circus-web chaussette \
    && pip uninstall -y psutil \
    && pip install psutil==1.2.1

# remove unused system packages and files
RUN apt-get -y -qq --force-yes purge \
        software-properties-common \
        wget \
    && apt-get -y -qq --force-yes autoremove \
    && apt-get -y -qq --force-yes clean \
    && rm -rf /opt/src/$APP_C /var/lib/apt/lists/* /tmp/* /var/tmp/*

# change moodle perms and ownership
ADD config.php /opt/src/moodle/config.php
RUN chmod 6755 /opt/src/moodle \
    && find /opt/src/moodle -type f -exec chmod 6644 {} \; \
    && chmod 6777 /var/moodledata \
    && chown -R www-data:www-data /opt/src/moodle \
    && chown -R www-data:www-data /var/moodledata

# configure circus
RUN mkdir -p /etc/circus/conf.d/watcher.d
ADD circusd.ini /etc/circus/conf.d/circusd.ini
ADD nginx.ini /etc/circus/conf.d/watcher.d/nginx.ini
ADD php-fpm.ini /etc/circus/conf.d/watcher.d/php-fpm.ini

# configure nginx
ADD moodle.conf /etc/nginx/sites-available/moodle.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf \
    && ln -s \
        /etc/nginx/sites-available/moodle.conf \
        /etc/nginx/sites-enabled/moodle.conf \
    && rm /etc/nginx/sites-enabled/default

# configure php5-fpm to execute by www-data with right perms
RUN sed \
        -ri \
        's/^;([a-z]+\.)(group|owner|mode)([ =0-9a-z]+)/\1\2\3/g' \
        /etc/php5/fpm/pool.d/www.conf \
    && sed \
        -ri \
        's/^;daemonize = yes/daemonize = no/' \
        /etc/php5/fpm/php-fpm.conf

# container default running and ports
EXPOSE 80 8080
VOLUME ["/var/log"]
ENTRYPOINT ["/usr/local/bin/circusd"]
CMD ["/etc/circus/conf.d/circusd.ini"]
