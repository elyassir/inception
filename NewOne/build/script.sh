#!/bin/bash

echo "
post_max_size = 64M
memory_limit = 256M
max_execution_time = 300
upload_max_filesize = 32M
date.timezone = America/Chicago
" >> /etc/php/7.3/fpm/php.ini≈≈

service mysql start

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS wpdb;
CREATE USER IF NOT EXISTS 'wpuser'@'localhost' identified by 'dbpassword';
GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EOF

cd /var/www/html/

# -d checks if the path is a directory

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";

if [ ! -d "wordpress" ]; then

    echo "Installing Wordpress ..."

    wget https://wordpress.org/latest.tar.gz
    tar -xvzf latest.tar.gz
    rm latest.tar.gz
    cd wordpress
    cp wp-config-sample.php wp-config.php

    sed -i "s/database_name_here/wpdb/g" wp-config.php
    sed -i "s/username_here/wpuser/g" wp-config.php
    sed -i "s/password_here/dbpassword/g" wp-config.php

    chown -R www-data:www-data /var/www/html/wordpress
    chmod -R 755 /var/www/html/wordpress

else

    echo "Wordpress already installed"

fi

service php7.3-fpm start
service mysql reload

while true; do sleep 1000; done