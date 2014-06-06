# zsh
#
# VERSION: see `TAG`
FROM debian:jessie
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        curl \
        git \
        zsh

# install zsh
ENV HOME /root
RUN curl -L http://install.ohmyz.sh | bash

# cleanup
RUN apt-get -y -qq --force-yes purge \
        curl \
    && apt-get -y -qq --force-yes autoremove \
    && apt-get -y -qq --force-yes clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/zsh"]
