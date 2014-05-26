#!/usr/bin/env bash

function provision_db() {
	mysql -u ${MDL_DB_USER} --password=${MDL_DB_PASS} -h ${MDL_DB_HOST} <<-EOF
		CREATE DATABASE IF NOT EXISTS moodle DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
		GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO '${MDL_DB_USER}'@'%' IDENTIFIED BY '${MDL_DB_PASS}';
	EOF
}

function run_circus() {
	exec /usr/local/bin/circusd /etc/circus/conf.d/circusd.ini
}

while [ $# -gt 0 ]; do
	case "$1" in
		-p|--provision)
			provision_db
			;;
		-r|--run)
			run_circus
			;;
		-h|--help)
			echo "Start script for moodle container."
			echo "Usage:"
			echo "  -p | --provision: provision moodle database"
			echo "  -r | --run: start circus process management"
			echo "  -h | --help: print this help"
			;;
	esac
	shift
done
