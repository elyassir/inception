FROM debian:buster

RUN apt-get update 

RUN apt-get install php7.3-fpm php7.3-mysql mariadb-client php-redis wget -y

COPY tools/script.sh /script.sh

RUN chmod +x script.sh

ENTRYPOINT [ "bash", "/script.sh" ]