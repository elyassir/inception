FROM debian:buster

RUN apt-get update
RUN apt-get -y install php-cgi php-common php-fpm php-pear php-mbstring php-net-socket php-gd php-mysql  wget -y

COPY ./script.sh /

RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]