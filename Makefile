NAME=		Inception

VOLUMES=	$(shell docker volume ls -q)

.SILENT:

all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

c:
	docker-compose -f ./srcs/docker-compose.yml down \
		&& docker volume rm $(VOLUMES)

s:
	docker ps && docker ps -a && docker volume ls

ng:
	sudo vim -p srcs/requirements/nginx/Dockerfile \
	srcs/requirements/nginx/conf/nginx.conf 

mdb:
	sudo vim -p srcs/requirements/mariadb/Dockerfile \
	srcs/requirements/mariadb/tools/start.sh \
	srcs/requirements/mariadb/tools/setup.sh

wp:
	sudo vim -p srcs/requirements/wordpress/Dockerfile \
	srcs/requirements/wordpress/tools/setup.sh \
	srcs/requirements/wordpress/tools/www.conf
dc:
	sudo vim srcs/docker-compose.yml

e:
	sudo vim srcs/.env

rd:
	sudo rm -rfv ../jose/data/db/* ../jose/data/wp/*

re: c all

.PHONY: all c s ng mdb wp dc e rd 
