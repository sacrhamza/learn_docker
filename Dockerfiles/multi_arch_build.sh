#!/usr/bin/env bash

docker buildx build -t sacrhamza/something --builder=hey --platform=linux/amd64,linux/arm64 --push -f ./multi_arch_build.dockerfile .
