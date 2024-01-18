#!/bin/bash

PROJECT_BASE_DIR=/Users/provility/workspaces/kubernetes-node
DOCKER_IMAGE_TAG=v$(date +'%Y%m%d%H%M%S')
ACCESS_TOKEN=11111

echo "LOGIN TO DOCKER"
echo "$ACCESS_TOKEN" | docker login --username mohamedumar --password-stdin
echo "LOGIN TO DOCKER SUCCEEDED"

echo "START BUILDING"
cd $PROJECT_BASE_DIR
docker build -t kubernetes-node .
docker tag kubernetes-node mohamedumar/kubernetes-node:${DOCKER_IMAGE_TAG}
docker tag kubernetes-node mohamedumar/kubernetes-node:latest
echo "STORAGE IMAGE BUILT SUCCESSFULLY"
echo "START PUSHING IMAGE TO DOCKER"
docker push mohamedumar/kubernetes-node:${DOCKER_IMAGE_TAG}
docker push mohamedumar/kubernetes-node:latest
echo "PUSHED TO DOCKER SUCCESSFULLY"

