# python ftp server
#
# VERSION: see `TAG`
FROM joaodubas/python-venv:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Install pytfpdlib
RUN /usr/local/bin/pip install pyftpdlib --allow-external pyftpdlib --allow-unverified pyftpdlib

# Add user home folder
RUN mkdir -p /home/tmp

# Add ftp supervisor conf
ADD ftpd.conf /etc/supervisor/conf.d/program.d/ftpd.conf

# Expose port 8921
EXPOSE 8921
