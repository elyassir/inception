FROM  debian:buster

RUN   apt-get update

RUN   apt-get install redis-server -y

RUN   chmod +x script.sh

ENTRYPOINT ["redis-server", "--protected-mode no"]