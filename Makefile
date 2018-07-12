JINJA_CMD=docker run -it --rm -v $(PWD)/kubernetes:/kubernetes jlesage/render-template
STACK_NAME=marcopolo
NAMESPACE=marcopolo-ns
JUPYTER_PASSWORD=admin

all: build deploy

build:
	@cd docker && make build

deploy: generate
	kubectl apply -f .tmp/namespace.yml
	@sleep 3
	kubectl apply -f .tmp/apps/


delete:
	kubectl delete -f .tmp/apps
	kubectl delete -f .tmp/namespace.yml


generate: generate-parameters
	@mkdir -p .tmp/apps/
	#GENERATING spark
	@for file in $(shell ls kubernetes/spark/) ; do \
        $(JINJA_CMD) /kubernetes/spark/$$file /kubernetes/parameters.json > .tmp/apps/$$file; \
    done

	#GENERATING jupyter
	@for file in $(shell ls kubernetes/jupyter/) ; do \
        $(JINJA_CMD) /kubernetes/jupyter/$$file /kubernetes/parameters.json > .tmp/apps/$$file; \
    done

	#GENERATING namespace
	@for file in $(shell ls kubernetes/namespace/) ; do \
        $(JINJA_CMD) /kubernetes/namespace/$$file /kubernetes/parameters.json > .tmp/$$file; \
    done

	@make output

generate-parameters:
	@echo '{"STACK_NAME":"$(STACK_NAME)","NAMESPACE":"$(NAMESPACE)","JUPYTER_PASSWORD":"$(shell make generate-jupyter-password JUPYTER_PASSWORD=$(JUPYTER_PASSWORD))"}' > kubernetes/parameters.json

generate-jupyter-password:
	@docker run -it --rm markthebault/jupyter:0.1 python -c 'from notebook.auth import passwd;print(passwd("$(JUPYTER_PASSWORD)"))'



output:
	@echo Jupyter URL:
	@echo http://$(shell kubectl get -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' service $(STACK_NAME)-jupyter --namespace $(NAMESPACE)):8888
	@echo Spark WebUI URL:
	@echo http://$(shell kubectl get -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' service $(STACK_NAME)-spark-master-webui --namespace $(NAMESPACE)):9090