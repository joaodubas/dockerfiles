# arangodb
#
# VERSION: see `TAG`
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Get needed packages
ADD http://www.arangodb.org/repositories/stable/xUbuntu_12.10/Release.key /Release.key
RUN echo "deb http://www.arangodb.org/repositories/stable/xUbuntu_12.10/ /" >> /etc/apt/sources.list.d/arangodb.list \
    && apt-key add - < /Release.key \
    && rm /Release.key \
    && apt-get -y update \
    && apt-get install -y arangodb

# Add sshd
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys && chown root:root /root/.ssh/authorized_keys

# Add supervisor conf file
ADD app.conf /etc/supervisor/conf.d/program.d/app.conf

# Expose port 8529 for arango connectivity
EXPOSE 8529
