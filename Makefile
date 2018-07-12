all: build deploy
build:
	@cd docker && make build
deploy:
	kubectl apply -f kubernetes/namespace/
	kubectl apply -f kubernetes/spark/
	kubectl apply -f kubernetes/jupyter/

delete:
	kubectl delete -f kubernetes/spark/
	kubectl delete -f kubernetes/jupyter/	
	kubectl delete -f kubernetes/namespace/
