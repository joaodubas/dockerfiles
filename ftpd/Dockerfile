# vsftpd
#
# VERSION: see `TAG`
# Based on guide
# https://help.ubuntu.com/community/vsftpd
# https://calomel.org/vsftpd.html
FROM joaodubas/common:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# Update apt sources
RUN apt-get -y update \
    && apt-get -y install vsftpd db-util

# Backup original vsftpd.conf and create new vsftp.conf
RUN mv /etc/vsftpd.conf /etc/vsftpd.backup \
    && touch /etc/vsftpd.conf \
    && echo "background=NO" >> /etc/vsftpd.conf \
    && echo "listen=YES" >> /etc/vsftpd.conf \
    && echo "anonymous_enable=NO" >> /etc/vsftpd.conf \
    && echo "local_enable=YES" >> /etc/vsftpd.conf \
    && echo "virtual_use_local_privs=YES" >> /etc/vsftpd.conf \
    && echo "write_enable=YES" >> /etc/vsftpd.conf \
    && echo "pam_service_name=vsftpd.virtual" >> /etc/vsftpd.conf \
    && echo "guest_enable=YES" >> /etc/vsftpd.conf \
    && echo "user_sub_token=$USER" >> /etc/vsftpd.conf \
    && echo "local_root=/home/vftp/$USER" >> /etc/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftpd.conf \
    && echo "hide_ids=YES" >> /etc/vsftpd.conf \
    && echo "secure_chroot_dir=/home/vftp/empty" >> /etc/vsftpd.conf \
    && echo "local_root=/home" >> /etc/vsftpd.conf \


# Create virtual user
RUN mkdir /etc/vsftpd \
    && touch /etc/vsftpd/vusers.txt \
    && echo "ftpd" >> /etc/vsftpd/vusers.txt \
    && echo "123ftpd4" >> /etc/vsftpd/vusers.txt

# Convert virtual user into a database
RUN cd /etc/vsftpd \
    && db_load -T -t hash -f vusers.txt vsftpd-virtual-user.db \
    && chmod 600 vsftpd-virtual-user.db \
    && rm vusers.txt

# Enable PAM login
RUN touch /etc/pam.d/vsftpd.virtual \
    && echo "#%PAM-1.0" >> /etc/pam.d/vsftpd.virtual \
    && echo "auth     required    pam_userdb.so db=/etc/vsftpd/vsftpd-virtual-user" >> /etc/pam.d/vsftpd.virtual \
    && echo "account  required    pam_userdb.so db=/etc/vsftpd/vsftpd-virtual-user" >> /etc/pam.d/vsftpd.virtual \
    && echo "session  required    pam_loginuid.so" >> /etc/pam.d/vsftpd.virtual

# Create needed dirs
RUN mkdir -p /home/vftp/ftpd \
    mkdir -p /home/vftp/empty \
    && chown -R ftp:ftp /home/vftp

# Add ftpd supervisor conf
ADD ftpd.conf /etc/supervisor/conf.d/program.d/ftpd.conf

# Expose ports
EXPOSE 20
EXPOSE 21
