FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/script.sh script.sh

ENTRYPOINT [ "bash", "/script.sh" ]