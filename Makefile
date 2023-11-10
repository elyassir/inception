all: up

up:
	docker compose -f ./srcs/docker-compose.yml up -d
down : 
	docker compose -f ./srcs/docker-compose.yml down
start : 
	docker compose -f ./srcs/docker-compose.yml start
stop:
	docker compose -f ./srcs/docker-compose.yml down
build:
	docker compose -f ./srcs/docker-compose.yml build
re:
	docker compose -f ./srcs/docker-compose.yml down
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d