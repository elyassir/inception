#!/bin/bash

cd /var/www/html/

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"


mkdir -p /var/
mkdir -p /var/www/
mkdir -p /var/www/html/

# -d checks if the path is a directory


if [ ! -d "wordpress" ]; then

    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
    chmod +x wp-cli.phar;
    mv wp-cli.phar /bin/wp;

    mkdir wordpress
    cd wordpress
    wp core download --allow-root;
    cp wp-config-sample.php wp-config.php;
	sed -i "s/database_name_here/$DB_NAME/g" wp-config.php;
	sed -i "s/username_here/$MYSQL_USER/g" wp-config.php;
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php;
    sed -i "s/localhost/mariadb/g" wp-config.php;

    wp core install --allow-root --url=$DOMAIN_NAME --title=$SERVER_NAME --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER $WP_USER_EMAIL --role=editor --first_name=$WP_USER_FIRST_NAME --last_name=$WP_USER_LAST_NAME --user_pass=$WP_USER_PASSWORD --allow-root

else

    cd wordpress

fi

mkdir -p /run/php/

# while true; do sleep 1000; done

exec /usr/sbin/php-fpm7.3 -F