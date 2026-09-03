#!/usr/bin/env bash

# build the image
docker build -t sacrhamza/test:tag

# push it to dockerhub
docker push sacrhamza/test:tag
