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
        unzip \
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
ENV APP_S stable${APP_V}
ENV APP_C moodle-latest-${APP_V}.tgz
RUN mkdir -p /opt/src \
    && cd /opt/src \
    && wget http://download.moodle.org/download.php/direct/${APP_S}/${APP_C} \
    && tar -xzf ${APP_C} \
    && mkdir /var/moodledata

# install halboo theme
ENV THM_V moodle_26_2014011201
ENV THM_C theme_halboo_${THM_V}.zip
ENV THM_R /opt/src/moodle/theme/halboo
RUN cd /opt/src \
    && wget https://moodle.org/plugins/download.php/5186/${THM_C} \
    && unzip ${THM_C} \
    && mv halboo /opt/src/moodle/theme/
ADD halboo/layout/breadcrumb_arrow.png ${THM_R}/layout/breadcrumb_arrow.png
ADD halboo/style/core.css ${THM_R}/style/core.css

# install grid couser format
ENV CF_V moodle27_2014052000
ENV CF_C format_grid_${CF_V}.zip
RUN cd /opt/src \
    && wget https://moodle.org/plugins/download.php/6103/${CF_C} \
    && unzip ${CF_C} \
    && mv grid /opt/src/moodle/course/format/

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
        unzip \
    && apt-get -y -qq --force-yes autoremove \
    && apt-get -y -qq --force-yes clean \
    && rm -rf \
        /opt/src/${APP_C} \
        /opt/src/${THM_C} \
        /opt/src/${CF_C} \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*

# change moodle perms and ownership
# ADD config.php /opt/src/moodle/config.php
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

# configure startup script
ADD start.sh /usr/local/bin/local_runner
RUN chmod 700 /usr/local/bin/local_runner

# container default running and ports
EXPOSE 80 8080
VOLUME ["/var/log/nginx", "/var/log/circus"]
ENTRYPOINT ["/usr/local/bin/local_runner"]
CMD ["--provision", "--run"]
