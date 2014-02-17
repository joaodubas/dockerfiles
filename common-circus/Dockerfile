# sshd & circusd
#
# VERSION: see `TAG`
FROM stackbrew/ubuntu:13.10
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Update apt sources
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list \
    && echo "deb http://archive.ubuntu.com/ubuntu saucy multiverse" >> /etc/apt/sources.list \
    && echo "deb http://archive.ubuntu.com/ubuntu saucy-updates multiverse" >> /etc/apt/sources.list \
    && apt-get -y -qq update \
    && apt-get -y -qq install openssh-server python-setuptools python-dev libzmq-dev libevent-dev \
    && mkdir -p /var/run/sshd \
    && locale-gen en_US en_US.UTF-8

# Install virtualenv
RUN easy_install pip \
    && pip install virtualenv virtualenvwrapper

# Create and configure virtualenv for circus
ENV WORKON_HOME /opt/.venv
ENV PROJECT_HOME /opt/app
RUN mkdir -p /opt/.venv/circus \
    && /usr/local/bin/virtualenv /opt/.venv/circus \
    && /bin/bash -c "source /opt/.venv/circus/bin/activate" \
    && pip install circus circus-web chaussette \
    && ln -s /opt/.venv/circus/bin/{chaussette,circusctl,circusd} /usr/local/bin

# Add password to root user
ENV UPASS 123root4
RUN echo root:$UPASS | chpasswd

# Change sshd config
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# Expose ports for ssh (22) and circus (8080)
EXPOSE 22 8080

# Expected volumes
VOLUME ['/opt/log/', '/opt/app/', '/etc/circus/conf.d/hook.d/']

# Start supervisord
ENTRYPOINT ["/usr/local/bin/circusd"]
CMD ["/etc/circus/conf.d/circusd.ini"]

# Add circus/ssh conf
RUN mkdir -p /etc/circus/conf.d/watcher.d
ADD circusd.ini /etc/circus/conf.d/circusd.ini
ADD sshd.ini /etc/circus/conf.d/watcher.d/sshd.ini
