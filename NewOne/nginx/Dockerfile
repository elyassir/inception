FROM debian:buster

RUN apt-get update

RUN apt-get install vim nginx openssl -y

RUN openssl req -newkey rsa:2048 -nodes -x509 -out inception.crt -keyout inception.key -subj "/C=MO/L=agadir/CN=yel-mass.42.fr"

COPY tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]