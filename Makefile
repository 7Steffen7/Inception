COMPOSE := ./srcs/docker-compose.yaml 

all : up

up :
	@docker-compose -f $(COMPOSE) up -d

down :
	@docker-compose -f $(COMPOSE) down -v

re :
	@docker-compose -f $(COMPOSE) up -d --build

start :
	@docker-compose -f $(COMPOSE) start

stop :
	@docker-compose -f $(COMPOSE) stop

status :
	@docker ps
	
remove :
	@docker system prune --all --force

logs :
	@docker-compose -f $(COMPOSE) logs