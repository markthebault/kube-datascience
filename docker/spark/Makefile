IMAGE=markthebault/spark
TAG=spark-2.2.1-hadoop2.7.0

all: build push

build:
	docker build -t $(IMAGE):$(TAG) .

push:
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE)