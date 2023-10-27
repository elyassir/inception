FROM debian:buster

RUN apt-get update
RUN apt-get -y install vim php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget git -y

COPY ./script.sh /

RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]