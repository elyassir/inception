FROM  debian:bullseye

RUN   apt-get update

RUN   apt-get install redis-server -y

ENTRYPOINT ["redis-server", "--protected-mode no"]