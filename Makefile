all:
	@cd docker && make build
	kubectl apply -f kubernetes/