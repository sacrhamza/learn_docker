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

* to restart a container
```bash

$ docker restart test
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

* to pause a container run:
```bash

$ docker pause container_name
```

* to create multi-architecture images using the docker minifest command
```bash

# on amd64
$ docker build -t one:amd64

# on arm
$ docker build -t one:arm

$ docker manifest create one:latest --amend one:amd64 --amend one:arm

$ docker manifest push one:latest
```

* from docker deep dive page 132
There are three ways you can tell Docker how to start an app in a container:
    1. An Entrypoint instruction in the image
    2. A Cmd instruction in the image 3. A CLI argument


* you can run that command to check if there is any Entrypoint in any local image.
```bash

$ docker inspect image_name | grep Entrypoint

```
* if I build an image and there is no Entry point the default would be "/bin/bash" (just assumed not sure)

* you can execute command inside a detached container like
```bash

docker run -d -it --name container alpine

docker exec container ls

docker exec container busybox ls

# or you can start interactive shell
docker exec -it container sh
```

* docker inspect
    => Description	Return low-level information on Docker objects
    => Usage	docker inspect [OPTIONS] NAME|ID [NAME|ID...]

        + -f, --format
```bash
   docker inspect [-f, --format]
    ```
```tex
Format output using a custom template:
'json': Print in JSON format
'TEMPLATE': Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates

```

    + -s, --size
```bash
docker inspect -s, --size		# Display total file sizes if the type is container

# Examples: 
$ docker run --name database -d redis
3b2cbf074c99db4a0cad35966a9e24d7bc277f5565c17233386589029b7db273

$ docker inspect --size database -f '{{ .SizeRootFs }}'
123125760

$ docker inspect --size database -f '{{ .SizeRw }}'
8192

$ docker exec database fallocate -l 1000 /newfile

$ docker inspect --size database -f '{{ .SizeRw }}'
12288
```

```tex

The --size, or short-form -s, option adds two additional fields to the docker inspect output. This option only works for containers. The container doesn't have to be running, it also works for stopped containers.
The output includes the full output of a regular docker inspect command, with the following additional fields:

    SizeRootFs: the total size of all the files in the container, in bytes.
    SizeRw: the size of the files that have been created or changed in the container, compared to it's image, in bytes.

```


    + --type
```bash

$ docker inspect --type # 	Only inspect objects of the given type
$ docker_list_of_types=(config container image node network secret service volume task plugin)

# image
    # example
$ docker inspect --type=image busybox
    # or
$ docker inspect --type image busybox


# container
$ docker inspect --type=container busy

$ docker container inspect busy

```
* to change restart policy of a stopped or running container you can run:
```bash

$ docker update --restart (no|always|on-failure|unless-stopped)
```

```tex
there is a useful thing to know about container related information like restart policy
you can edit that file in /var/lib/docker/containers/${CONTAINER_ID}/hostconfig.json

```

* you can retag your image using:
```bash

$ docker tag test/test:test test/test:new
```

* You can run a docker history command against any image to see the instructions that created it.
```bash

$ docker history test:test
```

* you can set env variables using two methods:
    => Dockerfile
```Dockerfile

FROM alpine

# SET envirenment variable to use inside the container
ENV FROM_ENV="hello i am from Dockerfile"

RUN apk add bash

# use the var FROM_ENV and FROM_CMD
# you can set FROM_CMD using -e flag
# when running the container, example:
# docker run --rm -it -e FROM_CMD="hello i am from cmd" env
CMD ["bash", "-c", "echo $FROM_ENV and $FROM_CMD"]

```

    => using -e flag when running the container
```bash

$ docker build -t env .
$ docker run --rm -it -e VAR='some value' env bash -c 'echo $VAR'
some value

```

* and also you can set args inside the Dockerfile
```Dockerfile```

# this is the syntax of dockerfile args
# ARG arg='value'

ARG VERSION='5.3.9'
ARG COMMAND='apt update'

FROM bash:${VERSION}

RUN  ${COMMAND}

CMD ["bash", "--version"]

* build cache
```tex
 Once a layer changes, then all downstream layers need to be rebuilt as well. Even if they wouldn't build anything differently, they still need to re-run.
 If your build contains several layers and you want to ensure the build cache is reusable, order the instructions from less frequently changed to more frequently changed where possible.
```

* if you want to not use build cache use: --no-cache or --no-cache-filter
```bash
docker build --no-cache .
```

* to clear the build cache use:
```bash
docker builder prune
```

* you can check if you are in a container using this little trick:
```tex
check if that file /.dockerenv exist
```
