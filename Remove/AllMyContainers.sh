# General 

# Dockefile

- RUN
- FROM
- COPY
- ENTRYPOINT

# Nginx :

- Dockefile

```bash

openssl req -newkey rsa:2048 -nodes \
-x509 -out /etc/ssl/certs/inception.crt \ 
-keyout /etc/ssl/private/inception.key  \
-subj "/C=MO/L=agadir/CN=yel-mass.42.fr" \

# Openssl: This command generates a self-signed certificate and private key.
# -newkey rsa:2048: This option creates a new certificate request and a new private key.
# -nodes: This is for skipping the option to secure our certificate with a passphrase. 
# -x509: This option outputs a self-signed certificate instead of a certificate request.
# -out: This option specifies the file to write the newly created certificate to.
# -keyout: This option specifies the file to write the newly created private key to.

ope

```

- script.sh

```bash

ssl_protocols TLSv1.2;

# This option specifies the SSL protocol that should be used.


    location / {
        try_files \$uri \$uri/ /index.php?\$args;
        # This option specifies the files to search for when processing requests.
        # The first parameter is try request as a file.
        # The second parameter is try request as a directory.
        # The third parameter is try request as a index.php with arguments. ?$args is the arguments. ex: index.php?args=asd&&asd=asd

    }

    location ~ \.php$ {
        include fastcgi_params;
        # This option includes fastcgi_params parameters.
        fastcgi_pass wordpress:9000;
        # This option specifies the address and port of the FastCGI server.
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        # SCRIPT_FILENAME: This option specifies the path to the FastCGI application.
    }

```

# Wordpress :

- Dockefile

```bash

FPM : FastCGI Process Manager
    is a process manager or software that manages PHP processes.
    It is used to manage PHP processes and communicate with the web server.
    howa wahd process ola software li kaytst3ml bach i handle php requests from the web server.
    kaychd file o ka exceutih o kay return response ll webserver

FastCGI vs CGI 
    FastCGI is used to improve the performance instead of CGI.
    kaykono 3ndo chi processes li kaytst3mlhom bach i handle phpfiles.
    lfr9 howa anah makaydirch frok o run process o ytsd 
    la 3nd porocess li maruniin o kayb9aw mruniin 


RUN apt-get install php-fpm php-mysql mariadb-client php-redis wget -y

# php-mysql : This package provides the MySQL extensions for PHP. bach i hder m3a mariadb

sed -i "s/listen/;listen/g" /etc/php/7.4/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf

# here kan commanti lih listen dyalo , o kan 3ndi listen = 9000 dyali

&> /dev/null : This option is used to redirect both stdout and stderr to /dev/null.

    chown -R www-data:www-data /var/www/html/wordpress

# here we change the owner of the wordpress directory to www-data:www-data
# www-data is the user that webserver and php-fpm use to read files from the filesystem.
# because you cannot run php-fpm as root user.

    wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root

# WP_CACHE_KEY_SALT : This option specifies the salt to use for the cache key.
# salt is a random string that is used to make the cache unique.
# example : if you have more then server that use the same redis server.
# you can separate the cache of each server by using a different salt.


    wp plugin install redis-cache --activate --allow-root
    wp redis enable  --allow-root

    # --activate : This option activates the plugin after install.
    # enable : This option enables the redis object cache.

```