FROM alpine

# SET envirenment variable to use inside the container
ENV FROM_ENV="hello i am from Dockerfile"

RUN apk add bash

# use the var FROM_ENV and FROM_CMD
# you can set FROM_CMD using -e flag
# when running the container, example:
# docker run --rm -it -e FROM_CMD="hello i am from cmd" env
CMD ["bash", "-c", "echo $FROM_ENV and $FROM_CMD"]
