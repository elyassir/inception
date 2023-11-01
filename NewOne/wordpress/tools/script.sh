#!/bin/bash

cd /var/www/html/

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"

mkdir -p /var/
mkdir -p /var/www/
mkdir -p /var/www/html/

# -d checks if the path is a directory

while true; do
    if mysql -u "wp_user" -p --password="wp_password" -h "mariadb" -e "USE "wp_db";" &> /dev/null; then
        echo "MySQL server is running."
        break
    else
        echo "MySQL server is not running. Sleeping for 1 second..."
        sleep 1
    fi
done



echo "MySQL database is  running ." 


if [ ! -d "wordpress" ]; then

    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
    chmod +x wp-cli.phar;
    mv wp-cli.phar /bin/wp;

    mkdir wordpress
    cd wordpress
    wp core download --allow-root;
    cp wp-config-sample.php wp-config.php;
	sed -i "s/database_name_here/wp_db/g" wp-config.php;
	sed -i "s/username_here/wp_user/g" wp-config.php;
	sed -i "s/password_here/wp_password/g" wp-config.php;
    sed -i "s/localhost/mariadb/g" wp-config.php;

    wp core install --allow-root --url=$DOMAIN_NAME --title=$SERVER_NAME --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER $WP_USER_EMAIL --role=editor --first_name=$WP_USER_FIRST_NAME --last_name=$WP_USER_LAST_NAME --user_pass=$WP_USER_PASSWORD --allow-root

fi

mkdir -p /run/php/

# while true; do sleep 1000; done

exec /usr/sbin/php-fpm7.3 -F