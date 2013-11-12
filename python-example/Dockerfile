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

# Install ODBC
ENV VERSION_ODBC 2.3.0
RUN mkdir /opt/downloads \
    && cd /opt/downloads \
    && wget ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-$VERSION_ODBC.tar.gz \
    && tar -xzf unixODBC-$VERSION_ODBC.tar.gz \
    && cd /opt/downloads/unixODBC-$VERSION_ODBC \
    && ./configure --disable-gui --disable-drivers --enable-iconv --with-iconv-char-enc=UTF8 --with-iconv-ucode-enc=UTF16LE \
    && make install \
    && cd / \
    && rm -rf /opt/downloads/unixODBC-$VERSION_ODBC \
    && ldconfig /usr/local/lib

# Install MSSQL driver
ENV VERSION_MSSQL 11.0.2270.0
RUN cd /opt/downloads \
    && wget http://download.microsoft.com/download/B/C/D/BCDD264C-7517-4B7D-8159-C99FC5535680/RedHat6/msodbcsql-$VERSION_MSSQL.tar.gz \
    && tar -xzf msodbcsql-$VERSION_MSSQL.tar.gz \
    && cd /opt/downloads/msodbcsql-$VERSION_MSSQL \
    && /bin/bash install.sh install --force --accept-license \
    && cd / \
    && rm -rf /opt/downloads/msodbcsql-$VERSION_MSSQL

# Add supervisor conf file
ADD app.conf /etc/supervisor/conf.d/program.d/app.conf

# Create virtualenv
ADD requirements /opt/requirements
RUN /usr/local/bin/virtualenv /opt/.venv/ml-pandora
RUN /bin/bash -c "source /opt/.venv/ml-pandora/bin/activate"
RUN /opt/.venv/ml-pandora/bin/pip install -r /opt/requirements/local.txt

# Expose port 8061 for django app
EXPOSE 8061
