#!/bin/bash

service mysql start

sleep 1

while true; do
    sleep 1
done

# mysql -e "CREATE DATABASE IF NOT EXISTS wp_db;"
# mysql -e "CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'wp_password';"
# mysql -e "GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_user'@'%';"
# mysql -e "FLUSH PRIVILEGES;"


sed -i "s/#port/port/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql stop

# ALTER USER is used to modify the properties of a MariaDB user account.

mysqld