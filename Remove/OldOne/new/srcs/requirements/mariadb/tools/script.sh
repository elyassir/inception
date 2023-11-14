#!/bin/bash

mysql << EOF
CREATE DATABASE IF NOT EXISTS wpdb;
CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'dbpassword';
GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'%';
FLUSH PRIVILEGES;
EOF

sed -i "s/#port/port/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50-server.cnf