#!/bin/bash


echo '
server {
    listen 80;
    root /var/www/html/wordpress;
    index index.php index.html index.htm;
    server_name example.com;

    access_log /var/log/nginx/wordpress_access.log;
    error_log /var/log/nginx/wordpress_error.log;

    client_max_body_size 64M;

    location / {
        try_files $uri $uri/ /index.php?$is_args$args;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

}
' >  /etc/nginx/sites-available/default

echo "
post_max_size = 64M
memory_limit = 256M
max_execution_time = 300
upload_max_filesize = 32M
date.timezone = America/Chicago
" >> /etc/php/7.3/fpm/php.ini

service mysql start

mysql -u root << EOF
CREATE DATABASE wpdb;
CREATE USER 'wpuser'@'localhost' identified by 'dbpassword';
GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EOF

    cd /var/www/html/
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
    mkdir wordpress
    cd wordpress
    wp core download --allow-root;
    cp wp-config-sample.php wp-config.php;
	sed -i "s/database_name_here/wpdb/g" wp-config.php;
	sed -i "s/username_here/wpuser/g" wp-config.php;
	sed -i "s/password_here/dbpassword/g" wp-config.php;
    wp core install --allow-root --url=10.11.41.184 --title=ft_server --admin_user=admin --admin_password=admin --admin_email=you@example.com

+

chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

service php7.3-fpm start
service mysql reload

nginx -g 'daemon off;'