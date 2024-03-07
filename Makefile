COMPOSE 	= srcs/docker-compose.yml

all:
	sh srcs/tools/make_dir.sh
	docker compose -f $(COMPOSE) up -d

re: fclean all

down:
	docker compose -f $(COMPOSE) down

prune:
	docker system prune --force

fclean: stop down
	-docker ps -a -q | xargs -r docker rm -f 
	-docker images -a -q | xargs -r docker rmi -f
	-docker volume ls -q | xargs -r docker volume rm
	-docker network ls -q | xargs -r docker network rm

stop:
	-docker stop $$(docker ps -qa)

.PHONY: all re prune down fclean stop
