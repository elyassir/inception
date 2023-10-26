FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install vim nginx -y

COPY script.sh /

RUN chmod 777 script.sh

ENTRYPOINT [ "./script.sh" ]