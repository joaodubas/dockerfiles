# sshd & circusd
#
# VERSION: see `TAG`
FROM debian:jessie
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Enable ubuntu repos
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list \
    && echo "deb http://archive.ubuntu.com/ubuntu saucy multiverse" >> /etc/apt/sources.list \
    && echo "deb http://archive.ubuntu.com/ubuntu saucy-updates multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://archive.ubuntu.com/ubuntu saucy multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://archive.ubuntu.com/ubuntu saucy-updates multiverse" >> /etc/apt/sources.list

# Update distro and install needed packages
RUN apt-get -y -qq update \
    && apt-get -y -qq install \
        openssh-server \
        python-setuptools \
        python-dev \
        libzmq-dev \
        libevent-dev \
        locales \
    && mkdir -p /var/run/sshd
RUN locale-gen en_US en_US.UTF-8

# Prepare virtualenv and virtualenvwrapper
ENV WORKON_HOME /opt/.venv
ENV PROJECT_HOME /opt/app
RUN easy_install pip \
    && pip install virtualenv virtualenvwrapper

# Install circus and dependencies
RUN mkdir -p $WORKON_HOME/circus \
    && /usr/local/bin/virtualenv $WORKON_HOME/circus \
    && /bin/bash -c "source /opt/.venv/circus/bin/activate" \
    && $WORKON_HOME/circus/bin/pip install circus circus-web chaussette \
    && $WORKON_HOME/circus/bin/pip uninstall -y psutil \
    && $WORKON_HOME/circus/bin/pip install psutil==1.2.1 \
    && ln -s $WORKON_HOME/circus/bin/b* /usr/local/bin/ \
    && ln -s $WORKON_HOME/circus/bin/c* /usr/local/bin/ \
    && ln -s $WORKON_HOME/circus/bin/m* /usr/local/bin/

# Add password to root user
ENV UPASS 123root4
RUN echo root:$UPASS | chpasswd

# Change sshd config
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# Expose ports for ssh (22) and circus (8080)
EXPOSE 22 8080

# Expected volume to store logs and runtime circus confs
VOLUME ["/opt/log", "/etc/circus/conf.d/hook.d"]

# Start supervisord
ENTRYPOINT ["/usr/local/bin/circusd"]
CMD ["/etc/circus/conf.d/circusd.ini"]

# Create structure that contain .ini files for circus
RUN mkdir -p /etc/circus/conf.d/watcher.d

# Add circus/ssh conf
ADD circusd.ini /etc/circus/conf.d/circusd.ini
ADD sshd.ini /etc/circus/conf.d/watcher.d/sshd.ini
