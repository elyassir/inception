#!/bin/bash

sleep 10

echo "
post_max_size = 64M
memory_limit = 256M
max_execution_time = 300
upload_max_filesize = 32M
date.timezone = America/Chicago
" >> /etc/php/7.3/fpm/php.ini

cd /var/www/html/

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";


mkdir -p /var/
mkdir -p /var/www/
mkdir -p /var/www/html/

cd /var/www/html/

# -d checks if the path is a directory

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;

if [ ! -d "wordpress" ]; then

    mkdir wordpress
    cd wordpress
    wp core download --allow-root;
    cp wp-config-sample.php wp-config.php;
	sed -i "s/database_name_here/wpdb/g" wp-config.php;
	sed -i "s/username_here/wpuser/g" wp-config.php;
	sed -i "s/password_here/dbpassword/g" wp-config.php;
    sed -i "s/localhost/mariadb/g" wp-config.php;


else

    cd wordpress
    echo "Wordpress already installed"

fi

wp core install --allow-root --url=10.11.41.184 --title=ft_server --admin_user=admin --admin_password=admin --admin_email=you@example.com

service php7.3-fpm start

while true; do sleep 1000; done