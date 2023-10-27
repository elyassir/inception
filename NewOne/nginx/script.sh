#!/bin/bash


echo '
server {
    listen 80;
    root /var/www/html/wordpress;
    index index.php;
    server_name example.com;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass wordpress:9000;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location /adminer/ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass adminer:8000;
    }
}

# Adminer

server {
    listen 8080;
    server_name adminer.example.com;
    root /var/www2/html/adminer;
    index index.php;
    autoindex on;

    location / {
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass adminer:8000;
    }

    access_log /var/log/nginx/adminer-access.log;
    error_log /var/log/nginx/adminer-error.log;
}

' >  /etc/nginx/sites-available/default

nginx -g 'daemon off;'

# $uri vs $uri/

# if the request is /folder/

# $uri = /folder (without slash)

# $uri/ = /folder/