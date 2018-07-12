all: build deploy
build:
	@cd docker && make build
deploy:
	kubectl apply -f kubernetes/