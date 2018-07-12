# Kubernetes Data Science
This project is an interactive datascience environment that is running on Kubernetes. Containers such as Jupyter and Apache Livy will be deployed as long as an spark cluster.

At the moment kubernetes only supports spark submit in a cluster mode, which is good for production jobs but not so much for interactive analysis. This is the reason why a spark cluster is running in the environment.

This project will deploy the containers in a defined namespace, you can change the namespace name as you want (see the section below)

## Run the services in Kubernetes
The images are pused to my personal repository and are publicly available. Make sure your kubectl is properly configured in order to point to your kubernetes cluster.

The Makefile will generate the deployment files for kubernetes, do not use the `kubenetes/*` files directly, use them via the Makefile.

Deploy the environment:
```
$ make deploy NAMESPACE=my-original-namespace-name STACK_NAME=toto
```

## How to build the docker images
In the root folder just run `make build`. If you need to customise the images, you need to retag them and push them to your dockerhub account. If you are using minikube, you don't need to push the images to a custom repository, the internal docker images are shared with minikube.

## Good to know
Makefiles are used to build and deploy everything, it can be easily integrated with a Jenkins server.
Jinja is used to generate the deployment file. The execution of Jinja don't need to have Jinja installed but needs docker. Actually, a Jinja docker image is used to generate the files.

The generated files will be located in `.tmp/`

## Improvments to be done
- Create a custom password for jupyter when is lunched
- Store the home directory of jupyter to an S3 bucket (or compatible)
- Pass AWS environment variables to the containers dynamically
- Add tensorflow capabilities to this environment
