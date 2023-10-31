#!/bin/bash

cd /var/www/html/

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"


mkdir -p /var/
mkdir -p /var/www/
mkdir -p /var/www/html/

cd /var/www/html/

# -d checks if the path is a directory

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /bin/wp;

if [ ! -d "wordpress" ]; then

    mkdir wordpress
    cd wordpress
    wp core download --allow-root;
    cp wp-config-sample.php wp-config.php;
	sed -i "s/database_name_here/wpdb/g" wp-config.php;
	sed -i "s/username_here/wpuser/g" wp-config.php;
	sed -i "s/password_here/dbpassword/g" wp-config.php;
    sed -i "s/localhost/mariadb/g" wp-config.php;
    
wp core install --allow-root --url=yel-mass.42.fr --title=ft_server --admin_user=admin --admin_password=admin --admin_email=you@example.com
wp user create johndoe johndoe@example.com --role=editor --first_name=John --last_name=Doe --user_pass=johndoe --allow-root

else

    cd wordpress

fi


service php7.3-fpm start

while true; do sleep 1000; done