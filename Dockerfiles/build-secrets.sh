#!/usr/bin/bash

docker build -t build-secret --no-cache --secret id=TOKEN,src=./secrets -f ./build-secrets.dockerfile .
docker run build-secret cat /tmp/file
