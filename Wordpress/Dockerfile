FROM debian:buster

RUN apt-get update && apt-get upgrade && \
    apt-get install -y \
    nano wget unzip \
    nginx

RUN apt-get install -y php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip

RUN apt-get -y install mariadb-server mariadb-client

EXPOSE 80 443

COPY script.sh /

# ENTRYPOINT [ "./script.sh" ]
# nano /etc/php/8.2/fpm/php.ini

# Change the following settings per your requirements:

# max_execution_time = 300
# memory_limit = 512M
# post_max_size = 128M
# upload_max_filesize = 128M