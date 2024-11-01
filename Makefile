BLUE = \033[0;34m
NC = \033[0m
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
ERASE = \033[2K
RESET = \033[0m
BOLD = \033[1m

COMPOSE_FILE = ./srcs/docker-compose.yml
DB_DIR = ./data/mariadb_data
WP_DIR = ./data/wordpress_data

all: mkdir build
	@echo Makefile running

mkdir:
	sudo mkdir -p $(DB_DIR)
	sudo mkdir -p $(WP_DIR)

build:
	@sudo docker-compose -f $(COMPOSE_FILE) up --build -d
	@echo "$(BOLD)$(GREEN)Docker containers are up and running$(RESET)"

down:
	@sudo docker-compose -f $(COMPOSE_FILE) down
	@echo "$(BOLD)$(RED)Docker containers are down$(RESET)"

rm_img:
	@sudo docker rmi -f $$(sudo docker images -q)
	@echo "$(BOLD)$(RED)All Docker images are removed$(RESET)"

rm_vol:
	@sudo docker volume rm mariadb_vol
	@sudo docker volume rm wordpress_vol
	@echo "$(BOLD)$(RED)All Docker volumes are removed$(RESET)"

rm_net:
	@sudo docker network rm $$(sudo docker network ls -q)
	@echo "$(BOLD)$(RED)All Docker networks are removed$(RESET)"

rm_dir:
	sudo rm -rf ./data/*

rm: rm_img rm_dir rm_vol 

re: down rm all

.PHONY: mkdir build down clean rm_dir