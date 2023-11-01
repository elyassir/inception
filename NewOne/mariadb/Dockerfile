FROM debian:buster

RUN apt-get update

RUN apt-get install mariadb-server  procps -y

COPY tools/script.sh .

RUN chmod 755 script.sh

CMD [ "./script.sh" ]