# python-venv
#
# VERSION: see `TAG`
FROM joaodubas/python-venv:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Add sshd
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys \
    && chown root:root /root/.ssh/authorized_keys

# Add supervisor conf file
ADD app.conf /etc/supervisor/conf.d/program.d/app.conf

# Create virtualenv
ADD requirements /opt/requirements
RUN /usr/local/bin/virtualenv /opt/.venv/app
RUN /bin/bash -c "source /opt/.venv/app/bin/activate"
RUN /opt/.venv/app/bin/pip install -r /opt/requirements/base.txt

# Expose port for project app
ENV APP_PORT 8080
EXPOSE 8080
VOLUME ["/opt/app"]
