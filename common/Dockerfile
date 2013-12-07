# sshd & supervisord
#
# VERSION: see `TAG`
FROM stackbrew/ubuntu:quantal
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Update apt sources
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install openssh-server supervisor \
    && mkdir -p /var/run/sshd \
    && locale-gen en_US en_US.UTF-8

# Add supervisor/ssh conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD common.conf /etc/supervisor/conf.d/program.d/common.conf

# Add supervisorctl alias
RUN echo 'alias supervisorctl="/usr/bin/supervisorctl -c /etc/supervisor/conf.d/supervisord.conf"' >> /etc/profile

# Expose ports for ssh (22) and supervisor (9001)
EXPOSE 22 9001

# Start supervisord
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
