#!/usr/bin/env bash

set -e

docker stop cont label_cont 1> /dev/null
docker rm -f cont label_cont 1> /dev/null

echo 'building label_filter and pull debian ...'
docker build -t label_filter . 2> /dev/null
docker pull debian 1> /dev/null

echo 'running containers detached...'
docker run -d --name cont -t debian 1> /dev/null
docker run -d -t --name label_cont  label_filter 1> /dev/null

# this line will filter running containers for any
# that has Label owner=hamza
docker ps --filter 'Label=owner=hamza'

echo 'stop containers and remove them ...'
docker stop cont label_cont
docker rm cont label_cont
