COMPOSE_FILE = ./srcs/docker-compose.yml
DB_DIR = /home/ymahni/data/mariadb_data
WP_DIR = /home/ymahni/data/wordpress_data

all: mkdir build

mkdir:
	sudo mkdir -p $(DB_DIR) $(WP_DIR)

build:
	@sudo docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	@sudo docker-compose -f $(COMPOSE_FILE) down

rm_img:
	@sudo docker rmi -f $$(sudo docker images -q)

rm_vol:
	@sudo docker volume rm srcs_mariadb_vol srcs_wordpress_vol

rm_net:
	@sudo docker network rm $$(sudo docker network ls -q)

rm_dir:
	sudo rm -rf /home/ymahni/data/*

rm: rm_img rm_dir rm_vol 

re: down rm all

.PHONY: mkdir build down clean rm_dir