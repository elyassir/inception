FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/script.sh script.sh

CMD ["bash", "script.sh"]