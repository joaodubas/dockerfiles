#!/bin/bash
if [ ! -f /data/ibdata1 ]; then
	mysql_install_db
	/usr/bin/mysqld_safe &
	sleep 10s
	echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
	killall mysqld
	sleep 10s
fi
/usr/sbin/mysqld
