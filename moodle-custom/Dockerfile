# moodle customized
#
# VERSION: see `TAG`
FROM joaodubas/moodle:201406.3
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        python-setuptools \
        openssl \
        sudo

# add user unprivileged user
RUN useradd \
        -G sudo,www-data \
        -d /home/app \
        -m \
        -p $(openssl passwd 123app4) \
        -s /bin/bash \
        app

# install halboo theme
ENV THM_V moodle_26_2014011201
ENV THM_C theme_halboo_${THM_V}.zip
ENV THM_R /opt/src/moodle/theme/halboo
RUN cd /opt/src \
    && wget https://moodle.org/plugins/download.php/5186/${THM_C} \
    && unzip ${THM_C} \
    && mv halboo /opt/src/moodle/theme/

# add customization to halboo theme
ADD halboo/layout/breadcrumb_arrow.png ${THM_R}/layout/breadcrumb_arrow.png
ADD halboo/style/core.css ${THM_R}/style/core.css

# install grid couser format
ENV CF_V moodle27_2014052000
ENV CF_C format_grid_${CF_V}.zip
RUN cd /opt/src \
    && wget https://moodle.org/plugins/download.php/6103/${CF_C} \
    && unzip ${CF_C} \
    && mv grid /opt/src/moodle/course/format/

# remove unused system packages and files
RUN rm -rf \
    /opt/src/${THM_C} \
    /opt/src/${CF_C}
