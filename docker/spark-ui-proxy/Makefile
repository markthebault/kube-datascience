IMAGE=markthebault/spark-ui-proxy
TAG=latest

all: build push

build:
	docker build -t $(IMAGE):$(TAG) .

push:
	docker push $(IMAGE):$(TAG)