# memsql
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTANER Joao Paulo Dubas "joao.dubas@gmail.com"

ENV MEMSQLKEY 25b8eb29848843f9a1ede028a1c00992
ENV MEMSQLOPS 2.8.1

# Update system
RUN apt-get -y update \
    && apt-get -y install g++

# Get memsql
RUN mkdir /opt/downloads \
    && cd /opt/downloads \
    && wget http://download.memsql.com/$MEMSQLKEY/memsqlbin_amd64.tar.gz \
    && tar -xzf memsqlbin_amd64.tar.gz \
    && cd memsqlbin \
    && ./check_system \
    && ln -s /opt/downloads/memsqlbin/memsqld /usr/local/bin/memsqld

# Get memsql ops
RUN cd /opt/downloads \
    && wget http://download.memsql.com/ops-$MEMSQLOPS/memsql-ops-$MEMSQLOPS.tar.gz \
    && tar -xzf memsql-ops-$MEMSQLOPS.tar.gz

ADD memsql.conf /etc/supervisor/conf.d/program.d/memsql.conf
