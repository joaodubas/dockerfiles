# mariadb
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Get needed packages
RUN apt-get -y update \
    && apt-get install -y software-properties-common \
    && apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db \
    && add-apt-repository "deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu quantal main" \
    && apt-get -y update \
    && apt-get install -y mariadb-server

# Add sshd
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys && chown root:root /root/.ssh/authorized_keys

# Add supervisor conf file
ADD app.conf /etc/supervisor/conf.d/program.d/app.conf

# Expose port 3306 for mariadb connectivity
EXPOSE 3306
