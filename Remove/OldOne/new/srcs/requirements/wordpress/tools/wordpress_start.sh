#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress: setting up..."
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	cp wp-config-sample.php wp-config.php;
	sed -i "s/database_name_here/wpdb/g" wp-config.php;
	sed -i "s/username_here/wpuser/g" wp-config.php;
	sed -i "s/password_here/dbpassword/g" wp-config.php;
	sed -i "s/localhost/mariadb/g" wp-config.php;

	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
fi

echo "Wordpress: starting..."

exec "$@";


	# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	# sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	# cp wp-config-sample.php wp-config.php












#!/bin/bash



# create directory to use in nginx container later and also to setup the wordpress conf
# mkdir /var/www/
# mkdir /var/www/html

# cd /var/www/html


# rm -rf *

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# chmod +x wp-cli.phar 

# mv wp-cli.phar /usr/local/bin/wp


# wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# mv /wp-config.php /var/www/html/wp-config.php


# sed -i -r "s/db1/$db_name/1"   wp-config.php
# sed -i -r "s/user/$db_user/1"  wp-config.php
# sed -i -r "s/pwd/$db_pwd/1"    wp-config.php

# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root




# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root


# wp theme install astra --activate --allow-root


# wp plugin install redis-cache --activate --allow-root

# wp plugin update --all --allow-root


 
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# mkdir /run/php



# wp redis enable --allow-root

# /usr/sbin/php-fpm7.3 -F



