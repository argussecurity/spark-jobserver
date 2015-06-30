#!/bin/bash
set -e

TAG=${1:-latest}

IMAGE_PREFIX=argussecurity
IMAGE_NAME=spark-jobserver

docker push $IMAGE_PREFIX/$IMAGE_NAME:$TAG

echo "Done"
