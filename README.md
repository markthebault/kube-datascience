# Kubernetes Data Science
This project is an interactive datascience environment that is running on Kubernetes. Containers such as Jupyter and RStudio will be deployed as long as an spark cluster.

At the moment kubvernetes only supports spark submit in a cluster mode, which is good for production jobs but not so much for interactive analysis. This is the reason why a spark cluster is running in the environment.

## Run the services in Kubernetes
The images are pused to my personal repository and are publicly available. Make sure your kubectl is properly configured in order to point to your kubernetes cluster.
Deploy the environment:
```
$ make deploy
```

## How to build the docker images
In the root folder just run `make build`. If you need to customise the images, you need to retag them and push them to your dockerhub account. If you are using minikube, you don't need to push the images to a custom repository, the internal docker images are shared with minikube.

## Improvments to be done
- Create a custom password for jupyter when is lunched
- Store the home directory of jupyter to an S3 bucket (or compatible)
- Lunch the different services in a separate namespace (let say we segregate by users)
- Pass AWS environment variables to the containers dynamically
- Add tensorflow capabilities to this environment
