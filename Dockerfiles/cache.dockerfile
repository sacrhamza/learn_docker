FROM alpine

RUN apk add gcc
RUN apk update
RUN apk add bash


CMD ["bash"]
