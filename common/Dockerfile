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

# Add supervisorctl alias
RUN echo 'alias supervisorctl="/usr/bin/supervisorctl -c /etc/supervisor/conf.d/supervisord.conf"' >> /etc/profile

# Add password to root user
ENV UPASS 123root4
RUN echo root:$UPASS | chpasswd

# Change sshd config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && sed -r 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Add supervisor/ssh conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD common.conf /etc/supervisor/conf.d/program.d/common.conf

# Expose ports for ssh (22) and supervisor (9001)
EXPOSE 22 9001

# Start supervisord
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
