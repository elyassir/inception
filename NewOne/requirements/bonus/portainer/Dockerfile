FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget tar

RUN wget https://github.com/portainer/portainer/releases/download/2.14.2/portainer-2.14.2-linux-amd64.tar.gz 
RUN tar -xf portainer-2.14.2-linux-amd64.tar.gz

# tar : is a tool used to collect multiple files into a single archive file (also known as tarball) and also extract the files from the tarball.
# -x : Extract a tar ball.
# -f : Allows you to specify the file name of the tarball.


ENTRYPOINT ["./portainer/portainer"]