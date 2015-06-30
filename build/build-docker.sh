#!/bin/bash
set -e

TAG=${1:-latest}

IMAGE_PREFIX=argussecurity
IMAGE_NAME=spark-jobserver
BUILD_PROPERTIES_LOCATION=./build.properties

script_dir="$( cd "$( dirname "$0" )" && pwd )"
cd $script_dir/..

echo "Adding some build information..."
echo -e "BUILD_DATE=`date`\nGIT_REVISION=`git rev-parse HEAD`\nGIT_REVISION_NAME=`git rev-parse --abbrev-ref HEAD`" > $BUILD_PROPERTIES_LOCATION

echo "Tagging old docker images, if exists (to be removed)..."
docker tag $IMAGE_PREFIX/$IMAGE_NAME:$TAG   $IMAGE_PREFIX/$IMAGE_NAME:old-$TAG || true

echo "Building new docker image..."
docker build -t $IMAGE_PREFIX/$IMAGE_NAME:latest .

echo "Tagging the newly created image..."
docker tag $IMAGE_PREFIX/$IMAGE_NAME:latest $IMAGE_PREFIX/$IMAGE_NAME:$TAG

echo "Removing old docker images..."
docker rmi -f $IMAGE_PREFIX/$IMAGE_NAME:old-$TAG || true

echo "Deleting the build information file"
rm $BUILD_PROPERTIES_LOCATION

echo "Done"
