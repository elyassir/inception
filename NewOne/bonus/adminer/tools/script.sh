#!/bin/bash

# This script is used to run the adminer script

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 8000/" "/etc/php/7.3/fpm/pool.d/www.conf";


mkdir -p /var/www2
mkdir -p /var/www2/html/adminer/
wget https://www.adminer.org/latest.php -O /var/www2/html/adminer/index.php


service php7.3-fpm start

while true; do sleep 1000; done