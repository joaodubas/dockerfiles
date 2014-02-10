# levelhud
#
# VERSION: see `TAG`
FROM joaodubas/nodejs:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Add nodejs levelhud app
ENV NODE_PORT 3002
RUN mkdir -p /opt/levelhud
ADD ./app /opt/levelhud
ADD ./levelhud.conf /etc/supervisor/conf.d/program.d/levelhud.conf
RUN cd /opt/levelhud\
    && /usr/local/bin/npm install

# Set workdir
WORKDIR /opt/levelhud

# Volume to handle logs
VOLUME ['/opt/app']

# Expose levelhud port
EXPOSE 3002
