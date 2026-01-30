# learn_docker
learn_docker

### QUESTIONS

#### Why we should learn docker
* because it makes development and deployment easier.
* because a lot of tech companies use docker.
#### WHAT I NEED TO USE DOCKER?
1. install docker from the [source](https://docs.docker.com/engine/install/);

```bash
# check if docker is installed
$ docker --version
```


#### WHAT IS DOCKERFILE?

* example
```dockerfile
FROM node:22

WORKDIR /app

RUN npm install

ENV PORT=9000

EXPOSE 9000

CMD ["npm", "start"]
```

#### HOW TO BUILD A CONTAINER?
* example
```bash
$ docker run -p 80:80 nginx
```

#### WHAT IS .dockerignore FILE?

#### what are docker images?
* a docker images contains:
    1. techonologies we need.
    2. runtimes.
    3.the tools/instructions to run our code.

#### what are docker containers?
#### what does docker mean?
    the word docker is a British expression short for dock worker referring to someone who loads and unloads cargo from ships.
##### OPTIONS

* -d detached mode.
* --name to name a container.
* -p host_port:container_port told docker to map port container_port in the container to port host_port on your docker host.

```bash

$ docker pull nginx:latest
$ docker run --name test -d -p 9090:80 nginx:latest
```

NOTES:
* to see the running containers run:
```bash

$ docker ps
```

* Run the following command to attach your shell to a new Bash process
inside the container.

```bash

$ docker exec -it test bash
root@hey:/# 
```

* to stop container
```bash

$ docker stop test
```

* to remove a stopped container
```bash

$ docker rm test
```

* to list all containers (even stopped ones)
```bash

$ docker ps -a # list all containers
```

* to remove an image
```bash

$ docker rmi test:latest
```

* to know the digets of an image
```bash

$ docker images --digets image_name
```

* to know image digest before pulling it
```bash

docker buildx imagetools inspect org/repo:tag
```
* to remove all images and containers from your locally 
```bash

#remove all containers
$ docker rm $(docker ps -aq)
# remove images
$ docker rmi $(docker images -q)

# The following command deletes three images — one by name, one by short
# ID, and one by SHA. I’ve trimmed the output for easier reading.
$ docker rmi "${image_name)" "${image_id}" "${image_SHA}"
```
###### NOTE:

```tex

Deleting images removes them from your local repository and they’ll no
longer show up in your docker images commands. The operation also
deletes all directories on your local filesystem containing layer data.
However, Docker won’t delete layers shared by multiple images until you
delete all images that reference them.

* you can execute command and exit like that

```

```bash

docker run --rm --name name image:tag command
```

```tex

Docker will prevent the delete operation if the image is being used by a
container or referenced by more than one tag. However, you can force the
operation with the -f flag, but you should do so with caution, as forcing
Docker to delete an image in use by a container will untag the image and
leave it on the system as a dangling image.

```
