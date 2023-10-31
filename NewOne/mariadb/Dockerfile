FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install mariadb-server -y

COPY tools/script.sh .

RUN chmod 755 script.sh

RUN service mysql start
RUN ./script.sh
RUN service mysql stop

ENTRYPOINT [ "mysqld" ]