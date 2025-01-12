COMPOSE := ./srcs/docker-compose.yaml 

all : up

up :
	@docker compose -f $(COMPOSE) up -d

down :
	@docker compose -f $(COMPOSE) down -v

re :
	@docker compose -f $(COMPOSE) up -d --build

start :
	@docker compose -f $(COMPOSE) start

stop :
	@docker compose -f $(COMPOSE) stop

status :
	@docker ps
	
remove :
	@docker system prune --all --force

eval :
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	@if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa); fi
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
	@if [ -n "$$(docker network ls -q)" ]; then docker network rm $$(docker network ls -q) 2>/dev/null || true; fi

logs :
	@docker compose -f $(COMPOSE) logs
