# arangodb
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Enable arangodb repository
ENV ARANGO_URL http://www.arangodb.org/repositories/arangodb2/xUbuntu_12.10/
RUN echo "deb $ARANGO_URL /" >> /etc/apt/sources.list.d/arangodb.list \
    && wget $ARANGO_URL/Release.key \
    && apt-key add - < Release.key \
    && rm Release.key

# Install arangodb
RUN apt-get -y update \
    && apt-get install -y arangodb=2.0.0

# Add sshd
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys && chown root:root /root/.ssh/authorized_keys

# Add supervisor conf file
ADD arangodb.conf /etc/supervisor/conf.d/program.d/arangodb.conf

# Expose port 8529 for arango connectivity
EXPOSE 8529
