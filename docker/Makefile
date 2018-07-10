all: build push

build:
	@cd spark && make build
	@cd livy && make build
	@cd jupyter && make build

push:
	@cd spark && make push
	@cd livy && make push
	@cd jupyter && make push

run:
	docker-compose up -d