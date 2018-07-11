all: build push

build:
	@cd spark && make build
	@cd livy && make build
	@cd jupyter && make build
	@cd spark-ui-proxy && make build

push:
	@cd spark && make push
	@cd livy && make push
	@cd jupyter && make push
	@cd spark-ui-proxy && make push

run:
	docker-compose up -d