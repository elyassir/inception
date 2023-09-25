#!/bin/bash

	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	# -p = create parent directories as needed, this mean that mkdir will not raise an error if the directory already exists
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /wp-config.php /var/www/html/
	echo "Wordpress: creating users..."
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	echo "Wordpress: set up!"
fi

# hna wa9ila khasni ndir sed l dak file dyal wp-config.php bach nbadal les parametres dyal database

# if you want the installtion page not to be displayed, you can add the following line to the wp-config.php file

#https://localhost/wp-login.php

# Database name
# Database username
# Database password
# Database host

# define('DB_NAME', 'database_name_here');
# define('DB_USER', 'username_here');
# define('DB_PASSWORD', 'password_here');
# define('DB_HOST', 'localhost');

exec "$@"
# exec "$@" = execute the command line arguments passed to the script