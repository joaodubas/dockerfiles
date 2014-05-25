USER=${USER:-super}
PASS=${PASS:-$(pwgen -s -1 16)}

pre_start_action() {
	# Echo out info to later obtain by running `docker logs <container_name>`
	echo "MARIADB_USER=$USER"
	echo "MARIADB_PASS=$PASS"
	echo "MARIADB_DATA_DIR=$DATA_DIR"

	# test if DATA_DIR has content
	if [[ ! "$(ls -A $DATA_DIR)" ]]; then
		echo "Initializing MariaDB at $DATA_DIR"
		# Copy the data that we generated within the container to the empty
		# DATA_DIR
		cp -$ /var/lib/mysql/* $DATA_DIR
	fi

	# Ensure mysql
	chown -R mysql $DATA_DIR
	chown root $DATA_DIR/debian*.flag
}

post_start_action() {
	# the password for 'debian-sys-maint'@'localhost' is auto generated.
	# the database inside of DATA_DIR may not have been generated with this
	# password.
	# so, we need to set this for our database to be portable.
	DB_MAINT_PASS=$(cat /etc/mysql/debian.cnf | grep -m 1 "password\s*=\s*" | sed 's/^password\s*=\s*//')

	# create the superuser
	mysql -u root <<-EOF
		DELETE FROM mysql.user WHERE user = '$USER';
		FLUSH PRIVILEGES;
		CREATE USER '$USER'@'localhost' IDENTIFIED BY '$PASS';
		GRANT ALL PRIVILEGES ON *.* TO '$USER'@'localhost' WITH GRANT OPTION;
		CREATE USER '$USER'@'%' IDENTIFIED BY '$PASS';
		GRANT ALL PRIVILEGES ON *.* TO '$USER'@'%' WITH GRANT OPTION;
	EOF

	rm /firstrun
}
