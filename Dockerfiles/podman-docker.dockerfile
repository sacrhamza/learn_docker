FROM alpine

RUN apk add docker
RUN echo -e 'dockerhunt\ndockerhunt' | adduser --shell /bin/sh dockerhunt

USER dockerhunt
