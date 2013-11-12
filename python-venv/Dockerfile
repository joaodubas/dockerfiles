# python virtualenv
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Get needed packages
RUN apt-get -y update \
    && apt-get install -y python-dev python-setuptools build-essential git-core \
    && apt-get install -y libtiff4-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms1-dev libwebp-dev tcl8.5-dev tk8.5-dev \
    && apt-get install -y libssl-dev libssl1.0.0 libssl1.0.0-dbg \
    && ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so.10 \
    && ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /usr/lib/libcrypto.so.10

# Install pip and virtualenvwrapper
RUN easy_install pip \
    && pip install virtualenvwrapper \
    && echo "export WORKON_HOME=/opt/.venv" >> /etc/profile \
    && echo "export PROJECT_HOME=/opt/app" >> /etc/profile \
    && echo "source /usr/local/bin/virtualenvwrapper.sh" >> /etc/profile
