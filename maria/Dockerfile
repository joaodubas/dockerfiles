# mariadb
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Set install params to prevent installation script from asking
RUN echo "mariadb-server-10.0 mysql-server/root_password password 123root4" | debconf-set-selections \
    && echo "mariadb-server-10.0 mysql-server/root_password_again password 123root4" | debconf-set-selections

# Get needed packages
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db \
    && echo "deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu quantal main" >> /etc/apt/sources.list \
    && echo "deb-src http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu quantal main" >> /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get install -y mariadb-server

# Change mariadb conf
ENV DATADIR /data
RUN sed -i '/^bind-address*/ s/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf \
    && sed -i '/^datadir*/ s|/var/lib/mysql|/data|' /etc/mysql/my.cnf

# Expose port 3306 for mariadb connectivity
EXPOSE 3306

# Volume for data directory
VOLUME ["/data"]

# Add supervisor conf file
ADD maria.conf /etc/supervisor/conf.d/program.d/maria.conf

# Add mariadb startup script
ADD maria.sh /opt/maria.sh
