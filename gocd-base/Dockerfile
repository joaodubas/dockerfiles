# go continuous delivery base commands
#
# VERSION: see `TAG`
FROM joaodubas/oracle-jdk:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install git mercurial

# remove unused files
RUN apt-get -y -qq --force-yes clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
