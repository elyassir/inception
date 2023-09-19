#!/bin/bash

# Stop and remove all containers

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# -a : all containers
# -q : only display numeric IDs

# Remove all images

docker rmi $(docker images -q)

# Remove all volumes

docker volume rm $(docker volume ls -q)

# thanks to Copilot for all help