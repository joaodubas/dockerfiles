# go continuous delivery server
#
# VERSION: see `TAG`
FROM joaodubas/gocd-base:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install wget unzip

# download server
ENV GOVERSION 14.1.0
ENV GOMINOR ${GOVERSION}-18882
ENV GOFILE go-server-${GOMINOR}.zip
ENV GOURL http://download01.thoughtworks.com/go
RUN mkdir -p /opt/src \
    && cd /opt/src \
    && wget ${GOURL}/${GOVERSION}/ga/${GOFILE}

# install server
RUN cd /opt/src \
    && unzip ${GOFILE} \
    && ln -s /opt/src/go-server-${GOVERSION} /opt/src/go-server \
    && chmod 754 /opt/src/go-server/server.sh

# remove unused files
RUN apt-get -y -qq --force-yes clean \
    && rm -rf /opt/src/${GOFILE} /var/lib/apt/lists/* /tmp/* /var/tmp/*

# command
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV DAEMON N
EXPOSE 8153
CMD ["/opt/src/go-server/server.sh"]
