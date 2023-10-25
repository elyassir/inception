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

# Remove all networks

docker network rm $(docker network ls -q)

# Remove all volumes not used by at least one container



# thanks to Copilot for all help