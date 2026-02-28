1. use official docker images as Base Image
```dockerfile

# FROM ubuntu
# RUN apt update && apt install -y node && rm -rf /var/lib/apt/lists*/

# instead use

FROM node
```

2. use specific version unless you know what you are doing:
```dockerfile

FROM node:latest

# instead use

FROM node:24

```

3. use slim and minimal images(leaner operation system)
```tex
=>  because those images don't have all the bloat and software
    the are theoretically more secure.

=>  if you don't requre any specific utilities,
    choose leaner and smaller images.
```

```dockerfile

FROM node:24 # 1.13GB

#instead use

FROM node:24-alpine  # 159MB

```

4. Optimize Cacing Image Layers

```dockerfile

FROM gcc:13.4.0

WORKDIR /app

COPY ./main.c .

RUN apt update
RUN apt install make -y

# instead move frequently changed instructions or files in the context of copy or add the the bottom
# order docerfile commands from least most frequently changing

FROM gcc:13.4.0

RUN apt update
RUN apt install make -y

WORKDIR /app

COPY ./main.c .

```

5. use .dotignorefile
```.dockerignore

.git
.cache

*.md

env.sh

```

6. use multi-stage build:
```dockerfile

FROM gcc:13.4.0

RUN apt update
RUN apt install make -y

WORKDIR /app

COPY ./main.c .

RUN make build

FROM busybox:1.37.0-glibc

COPY --from=1 /app /app

CMD ["/app/a.out"]

```
