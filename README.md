
# inception

# Docker

## Basic concepts (Theory Part)

- Docker | Container | Image | Containerization | Virtualization | Hypervisor | Docker-Compose

### What is Docker?

- Docker is an engine that used to run containers.

- Docker is a tool designed to make it easier to create, deploy, and run applications by using containers.

- Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package.

- By doing so, thanks to the container, the developer can rest assured that the application will run on any other Linux machine regardless of any customized settings that machine might have that could differ from the machine used for writing and testing the code.

- Docker is avoiding the "it works on my machine" problem when collaborating on code with others.

  

### How does Docker work? and Docker vs Virtual Machines

  

- Docker containers share the host machine’s kernel. But they run as isolated processes in their own user space on the host operating system.
- Docker containers are more lightweight than virtual machines.

- Both VMs and Docker containers provide an isolated environment for running applications, with their own file system, networking and process space.

- This allows you to run multiple containers on the same host (docker compose), each with its own configuration, without interfering with each other.

- Docker does not include a full copy of the host OS. Instead, they use the host machine’s kernel and rely on the host for system calls.

  
## Practical Part

## The most common commands are used in docker

	-. **`docker build`**: Used to build a Docker image from a Dockerfile.
	-. **`docker run`**: Used to run a Docker container based on a Docker image.
	-. **`docker pull`**: Used to pull a Docker image from a registry, such as Docker Hub.
	-. **`docker push`**: Used to push a Docker image to a registry.
	-. **`docker ps`**: Used to list the running Docker containers on a system.
	-. **`docker stop`**: Used to stop a running Docker container.
	-. **`docker rm`**: Used to remove a Docker container.
	-. **`docker rmi`**: Used to remove a Docker image.
	-. **`docker exec`**: Used to execute a command in a running Docker container.
	-. **`docker logs`**: Used to view the logs for a Docker container.
    -. **`docker inspect`**: Used to view the configuration of a Docker container.
    -. **`docker images`**: Used to list the Docker images on a system.
    -. **`docker network`**: Used to manage Docker networks.
    -. **`docker volume`**: Used to manage Docker volumes.

<!-- 
## Docker Compose

## The most common commands are used in docker-compose

    -. **`up`**: Create and start containers

    -. **`down`**: Stop and remove containers, networks, images, and volumes

    -. **`start`**: Start existing containers

    -. **`stop`**: Stop running containers

    -. **`restart`**: Restart running containers

    -. **`build`**: Build images

    -. **`ps`**: List containers

    -. **`logs`**: View output from containers

    -. **`exec`**: Run a command in a running container

    -. **`pull`**: Pull images from a registry

    -. **`push`**: Push images to a registry 
-->

# Dockerfiles

  

A Dockerfile is a text document that contains all the commands we would use to build our image.

That is written in a specific format JSON or YAML.

Docker reads the instructions given in the file and will use them to automatically build our image

  

## Nginx:

### what is Nginx?

- is an open source web server that is now also used as a reverse proxy, HTTP cache, and load balancer.

- reverse proxy: is a server that sits in front of web servers and forwards client (e.g. web browser) requests to those web servers.

- reverse proxy: sits in front of a web server and receives all the requests before they reach the origin server. Reverse proxies are typically used to enhance performance (find out how by clicking there), security, and reliability of the web server

- HTTP cache: is a temporary storage of web documents such as HTML pages and images to reduce bandwidth usage, server load, and perceived lag.

- HTTP cache: a mechanism that allows web browsers and servers to temporarly store or cache certain resources (such as images, scripts, and stylesheets) on a client’s device. For performance gains.

- load balancer: is a device that acts as a reverse proxy and distributes network or application traffic across a number of servers.

- Load balancer is a device or software that distributes incoming network traffic across multiple servers.

### How to use Nginx?

- All Nginx configuration files are located in /etc/nginx/ directory.

- The primary configuration file is /etc/nginx/nginx.conf.

- default.conf file:

```nginx
server {
    listen 443 ssl;
    root /var/www/html/wordpress;
    index index.php;
    ssl_certificate /etc/ssl/certificate.crt;
    ssl_certificate_key /etc/ssl/private.key;
    autoindex on;
    ssl_protocols TLSv1.2 TLSv1.3;
    location / {
        try_files $uri $uri/ =404;
    }
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass wordpress:9000;
    }
}
```

### Generate SSL certificate

- To generate a self-signed SSL certificate, we can use the openssl command.

- openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt


```dockerfile
    FROM debian:buster

    RUN apt-get update && apt-get upgrade -y && apt-get install nginx

    COPY index.html /usr/share/nginx/html

    EXPOSE 443

    CMD ["nginx", "-g", "daemon off;"]

```

  

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

    for wordpress we need to install wp-cli
    wp-cli is a command line interface for WordPress.
    site of wp-cli: https://wp-cli.org/#:~:text=WP%2DCLI%20is%20the%20command,without%20using%20a%20web%20browser.

    ```bash
    
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    # wget: is a command-line utility for downloading files from the web. (web get)

    chmod +x wp-cli.phar

    # Download WordPress core files.

    ./wp-cli.phar core download --allow-root

    # --allow-root: Allow wp-cli to be run as root. (use it to avoid errors)

    # Create wp-config.php file.

    cp wp-config-sample.php wp-config.php

    sed -i "s/database_name_here/name_of_database/g" wp-config.php
    sed -i "s/username_here/user_of_database/g" wp-config.php
    sed -i "s/password_here/password_of_database/g" wp-config.php
    sed -i "s/localhost/database_host/g" wp-config.php

    # sed: is a stream editor.

    # -i: is used to edit the file in place. (without creating a new file) ! test it
    # "s/old/new/g": is used to replace the old string with the new string.

    ./wp-cli.phar core install --url=ip_address --title=wordpress --admin_user=admin --admin_password=password --admin_email=email --allow-root

    # resourses: https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html

    ```
  

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


# Docker Compose

## What is Docker Compose?

- Docker Compose is a tool for defining and running multi-container Docker applications.