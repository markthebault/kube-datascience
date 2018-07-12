IMAGE=portal-datascience

all: build run

build:
	docker build -t $(IMAGE) .

run:
	docker run -it --rm -p 5000:5000 $(IMAGE)
