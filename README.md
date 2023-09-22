# inception
## The most common commands are used in docker

    docker build: Used to build a Docker image from a Dockerfile.
    docker run: Used to run a Docker container based on a Docker image.
    docker pull: Used to pull a Docker image from a registry, such as Docker Hub.
    docker push: Used to push a Docker image to a registry.
    docker ps: Used to list the running Docker containers on a system.
    docker stop: Used to stop a running Docker container.
    docker rm: Used to remove a Docker container.
    docker rmi: Used to remove a Docker image.
    docker exec: Used to execute a command in a running Docker container.
    docker logs: Used to view the logs for a Docker container.

## The most common commands are used in docker-compose


    up: Create and start containers
    down: Stop and remove containers, networks, images, and volumes
    start: Start existing containers
    stop: Stop running containers
    restart: Restart running containers
    build: Build images
    ps: List containers
    logs: View output from containers
    exec: Run a command in a running container
    pull: Pull images from a registry
    push: Push images to a registry
# Dockerfiles

A Dockerfile is a text document that contains all the commands we would use to build our image.
That is written in a specific format JSON or YAML.
Docker reads the instructions given in the file and will use them to automatically build our image

## Nginx:

    FROM debian:buster
    RUN apt-get update && apt-get upgrade -y && apt-get install nginx
    COPY index.html /usr/share/nginx/html
    EXPOSE 443
    CMD ["nginx", "-g", "daemon off;"]

1-FROM : This is the base image we want to use. In this case, we are using the latest version of Debian Buster.
2- RUN : This is used to run commands on top of our base image. In this case, we are update the package list, upgrading any existing packages, and installing Nginx.
3- COPY : This is used to copy files from our local machine to the image. In this case, we are copying the index.html file from the Docker build context to the /usr/share/nginx/html directory inside the container.
4- EXPOSE : This is used to expose a port from the container to the host. this mean that we can access the container from the host using this port.
5- CMD : This is used to run commands when the container is started. In this case, we are starting the Nginx service.

To build the image we use that command:

    docker build -t nginx .

    -t: is used to give the image a name.
    . : the directory that contains the Dockerfile.

After building an image, now we use it to create a container:
    
        docker run -d -p 80:80 -p 443:443 nginx
    
        -d: is used to run the container in the background. If you want to run the container in the foreground, you can use -it instead.
        -p: is used to map the ports from the container to the host. In this case, we are mapping port 80 and 443 from the container to the host.

Now we can attach to the container’s console by executing this command

    docker exec -it <container_id> sh (or bash)

## Wordpress:


## Mariadb:


Pull debian:buster (our base image)

update our package manager apt-get update -y

install mariadb server apt-get install mariadb-server -y

go to /etc/mysql/mariadb.conf.d/50-server.cnf and 
change line 28 from bind-address = 127.0.0.1 to bind-address = 0.0.0.0 
for any network can connect to our Mariadb

service mysql start
create our database and our user and give him the access to the database then FLUSH PRIVILEGES

to keep the container running run this command in CMD in your Dockerfile /usr/bin/mysqld_safe
    
    #db_name = Database Name
    #db_user = User
    #db_pwd = User Password
    echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db1.sql
    echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
    echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
    echo "FLUSH PRIVILEGES;" >> db1.sql
    mysql < db1.sql
