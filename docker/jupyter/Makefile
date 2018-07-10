IMAGE=markthebault/jupyter
TAG=0.1

all: build push

build:
	docker build -t $(IMAGE):$(TAG) .

push:
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE)

run:
	docker run -d -p 8888:8888 $(IMAGE):$(TAG)
