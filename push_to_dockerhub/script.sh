#!/usr/bin/env bash

######################################################################
#                                                                    #
# this script demonstrate how to create docker multiplatform manifest#
#                                                                    #
######################################################################

repo="test"

docker build --platform linux/amd64/v2 -t "sacrhamza/$repo:amd64v2" .
docker push "sacrhamza/$repo:amd64v2"
docker build --platform linux/amd64/v3 -t "sacrhamza/$repo:amd64v3" .
docker push "sacrhamza/$repo:amd64v3"

docker manifest create "sacrhamza/$repo:latest" --amend "sacrhamza/$repo:amd64v2"\
                                      --amend "sacrhamza/$repo:amd64v3"

docker manifest push "sacrhamza/$repo:latest"

docker manifest inspect "sacrhamza/$repo:latest" | jq
