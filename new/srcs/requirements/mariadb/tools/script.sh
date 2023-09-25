#!/bin/bash

# echo "create database"

# mysql < /initial_db.sql

mysql << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'yel'@'%' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON wordpress.* TO 'yel'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';
EOF


# echo "change port and bind-address"

sed -i "s/#port/port/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# echo "DB created"