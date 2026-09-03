#!/usr/bin/env bash

# build just the base image
docker build -t base --target base .

# run container based on the image base
docker run -it --rm base
