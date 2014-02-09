# image optimin
#
# VERSION: see `TAG`
FROM stackbrew/ubuntu:quantal
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Update apt sources and adad needed packages
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y install build-essential zlib1g-dev libfile-slurp-perl wget unzip

# Add download directory
ENV LOCAL_BIN /usr/local/bin
RUN mkdir /opt/downloads

# Add png optimization
ENV URL_PNG http://prdownloads.sourceforge.net/advancemame
ENV VERSION_PNG 1.17
RUN cd /opt/downloads \
    && wget $URL_PNG/advancescan-$VERSION_PNG.tar.gz \
    && tar -xzf advancescan-$VERSION_PNG.tar.gz \
    && ln -s advancescan-$VERSION_PNG advancescan \
    && cd advancescan \
    && ./configure \
    && make \
    && make install

# Add png zopfli
ENV URL_ZOP http://zopfli.googlecode.com/files
ENV VERSION_ZOP 1.0.0
RUN cd /opt/downloads \
    && wget $URL_ZOP/zopfli-$VERSION_ZOP.zip \
    && unzip zopfli-$VERSION_ZOP.zip \
    && ln -s zopfli-$VERSION_ZOP zopfli \
    && cd zopfli \
    && make \
    && ln -s /opt/downloads/zopfli/zopfli $LOCAL_BIN

# Add jpg optimization
ENV URL_JPG http://akuvian.org/src
RUN cd /opt/downloads \
    && mkdir jpgcrush \
    && cd jpgcrush \
    && wget $URL_JPG/jpgcrush.tar.gz \
    && tar -xzf jpgcrush.tar.gz \
    && ln -s /opt/downloads/jpgcrush/jpegrescan $LOCAL_BIN \
    && ln -s /opt/downloads/jpgcrush/jpgcrush $LOCAL_BIN
