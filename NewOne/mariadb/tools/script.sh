#!/bin/bash

service mysql start

MYSQL_ROOT_PASSWORD=123456
MYSQL_USER=wp_user
MYSQL_PASSWORD=wp_password
DB_NAME=wp_db
ROOT=root

mysql << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%';
ALTER USER '$ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF


sed -i "s/#port/port/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# ALTER USER is used to modify the properties of a MariaDB user account.
