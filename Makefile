JINJA_CMD=docker run -it --rm -v $(PWD)/kubernetes:/kubernetes jlesage/render-template
STACK_NAME=marcopolo
NAMESPACE=marcopolo-ns

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

generate-parameters:
	@echo '{"STACK_NAME":"$(STACK_NAME)","NAMESPACE":"$(NAMESPACE)"}' > kubernetes/parameters.json