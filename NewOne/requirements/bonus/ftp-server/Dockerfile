FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/script.sh script.sh

ENTRYPOINT ["bash", "script.sh"]