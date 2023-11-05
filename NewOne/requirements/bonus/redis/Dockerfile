FROM  debian:buster

RUN   apt-get update && apt-get upgrade 

RUN   apt-get install redis-server -y

COPY  tools/script.sh script.sh

RUN   chmod +x script.sh

CMD redis-server --protected-mode no

# Change it to ENTRYPOINT
# READ ABOUT --protected-mode no