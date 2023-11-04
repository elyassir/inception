FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl tar

RUN curl -sSL https://github.com/portainer/portainer/releases/download/2.14.2/portainer-2.14.2-linux-amd64.tar.gz | tar -xzo -C /usr/local

CMD ["/usr/local/portainer/portainer"]