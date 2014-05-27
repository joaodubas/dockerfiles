# oracle jdk
#
# VERSION: see `TAG`
FROM stackbrew/ubuntu:14.04
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

RUN sed -i 's/main$/main universe/' /etc/apt/sources.list \
    && apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install software-properties-common

ENV JDK_INST oracle-java7-installer
ENV JDK_LIC shared/accepted-oracle-license-v1-1
ENV JDK ${JDK_INST} ${JDK_LIC} select true
RUN add-apt-repository -y ppa:webupd8team/java \
    && echo ${JDK} | /usr/bin/debconf-set-selections \
    && apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install oracle-java7-installer
