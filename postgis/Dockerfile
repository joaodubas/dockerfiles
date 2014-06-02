FROM ubuntu:14.04
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install wget
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install wget

# install postgres and postgis
RUN wget \
        --quiet \
        --no-check-certificate \
        -O \
        - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" \
        >> /etc/apt/sources.list
    && apt-get -y -qq --force-yes update
    && apt-get -y -qq --force-yes install \
        postgresql-9.3 \
        postgresql-contrib-9.3 \
        postgresql-9.3-postgis-2.1 \
        postgis

# configure postgres
RUN echo "host    all             all             0.0.0.0/0               md5" \
        >> /etc/postgresql/9.3/main/pg_hba.conf \
    && service postgresql start \
    && /bin/su postgres -c "createuser -d -s -r -l docker" \
    && /bin/su postgres \
        -c \
        "psql postgres -c \"ALTER USER docker WITH ENCRYPTED PASSWORD 'docker'\"" \
    && service postgresql stop \
    && echo "listen_addresses = '*'" >> /etc/postgresql/9.3/main/postgresql.conf
    && echo "port = 5432" >> /etc/postgresql/9.3/main/postgresql.conf

# add start script
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

# configure container execution
EXPOSE 5432
CMD ["/start.sh"]
