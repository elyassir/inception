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
# Mariadb
## Installation part:


    Pull debian:buster (our base image)
    update our package manager apt-get update -y
    install mariadb server apt-get install mariadb-server -y
    go to /etc/mysql/mariadb.conf.d/50-server.cnf and change line 28 from bind-address = 127.0.0.1 to bind-address = 0.0.0.0 for any network can connect to our Mariadb
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
