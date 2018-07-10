IMAGE=markthebault/livy
TAG=0.5.0

all: build push

build:
	docker build -t $(IMAGE):$(TAG) .

push:
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE)

run:
	docker run -d -p 8998:8998 $(IMAGE):$(TAG)