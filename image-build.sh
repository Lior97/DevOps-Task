#!/bin/bash

DOCKER_FILE="Dockerfile"

IMAGE_NAME="lioragent:1"

docker build -t "$IMAGE_NAME" .

if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME' has been successfully built."
else
    echo "Failed to build Docker image '$IMAGE_NAME'."
fi



