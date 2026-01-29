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


