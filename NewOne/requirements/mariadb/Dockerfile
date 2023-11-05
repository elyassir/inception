FROM debian:buster

RUN apt-get update

RUN apt-get install mariadb-server -y

COPY tools/script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh" ]