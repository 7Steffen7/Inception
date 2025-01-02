COMPOSE := ./srcs/docker-compose.yaml 

all : up

up :
	@docker-compose -f $(COMPOSE) up -d

down :
	@docker-compose -f $(COMPOSE) down -v

start :
	@docker-compose -f $(COMPOSE) start

stop :
	@docker-compose -f $(COMPOSE) stop

status :
	@docker ps