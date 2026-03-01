#!/bin/bash

docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin --network my-first-network --name mongodb mongo

docker run -d -p 8081:8081 \
  -e  ME_CONFIG_MONGODB_ROOT_USERNAME=admin \
  -e ME_CONFIG_MONGODB_ROOT_PASSWORD=supersecret \
  -e ME_CONFIG_MONGODB_SERVER=mongodb\
	-e ME_CONFIG_MONGODB_ADMINPASSWORD=admin\
	-e ME_CONFIG_MONGODB_ADMINPASSWORD=admin \
  --network my-first-network \
  --name mongo-express\
  mongo-express

