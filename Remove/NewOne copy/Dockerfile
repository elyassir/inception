FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install vim nginx mariadb-server mariadb-client php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget git -y

COPY script.sh /

EXPOSE 80

RUN chmod 777 script.sh

ENTRYPOINT [ "./script.sh" ]