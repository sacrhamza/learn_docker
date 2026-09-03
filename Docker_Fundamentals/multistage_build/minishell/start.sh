#!/usr/bin/env bash

IMAGE_NAME='tinyshell'

echo "building the image ${IMAGE_NAME}"
docker build -t "${IMAGE_NAME}" .

echo "starting a container from the image ${IMAGE_NAME}"
docker run --rm -it "${IMAGE_NAME}"
