#!/bin/bash


echo "

server {
    listen 443;
    server_name $DOMAIN_NAME;
    root /var/www/html/wordpress;
    index index.php;

    ssl    on;
    ssl_certificate    /inception.crt;
    ssl_certificate_key    /inception.key;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php$ {
        try_files \$uri =404;
        include fastcgi_params;
        fastcgi_pass wordpress:9000;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }
}
" >  /etc/nginx/sites-available/default

nginx -g 'daemon off;'