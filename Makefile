# Makefile for starting and stopping Docker Compose stacks

.PHONY: up down clean

all:
	@echo "Nothing to be done for 'all'. Check the Makefile for valid targets."

config: # Show the current docker compose configuration
	docker compose config

up: # Start the container stacks
	docker compose -p traefik_stack -f docker-compose.yml up -d
	docker compose -p web_docs_stack --env-file .env -f web/docker-compose.yml up -d

down: # Stop and remove the containers
	docker compose -p traefik_stack -f docker-compose.yml down
	docker compose -p web_docs_stack -f web/docker-compose.yml down

clean: down # Remove containers and unused volumens
	@echo Containers are removed.
	@echo "To remove volumes use the `docker volume rm <stack>_<volume label>` command."

	