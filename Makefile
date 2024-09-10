CONTAINER_NAME ?= web
 
pc:
	docker compose run --rm web rspec && docker compose run --rm web rubocop

build:
	docker compose build
 
up:
	docker compose up

rspec:
	docker compose run --rm web rspec -f d

rubocop:
	docker compose run --rm web rubocop -c .rubocop.yml

migrate:
	docker compose run --rm web rails db:migrate

bundle:
	docker compose run --rm web bundle

console:
	docker compose run --rm web rails c

rollback:
	docker compose run --rm web rails db:rollback

seed:
	docker compose run --rm web rails db:seed

down:
	docker compose down
 
shell:
	@docker exec -it $(CONTAINER_NAME) \
	sh -c "/bin/bash || /bin/sh"
 
clean:
	@docker compose down
	@docker system prune --volumes --force
	@docker network prune
	@rm -rf tmp/* || sudo rm -rf tmp/*
	@mkdir -p tmp/pids && touch tmp/pids/.keep
