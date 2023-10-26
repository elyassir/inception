FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install mariadb-server -y

COPY script.sh /

RUN chmod 755 /script.sh

RUN service mysql start && ./script.sh  && rm -f /script.sh;

CMD [ "mysqld" ]