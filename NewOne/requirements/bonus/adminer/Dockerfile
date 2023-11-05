FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get -y install php php-mysqli wget -y

COPY tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT [ "./script.sh" ]