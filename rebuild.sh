#!/bin/bash

# Check if --no-cache flag is provided
NO_CACHE=""
if [[ "$1" == "--no-cache" ]]; then
    NO_CACHE="--no-cache"
fi

# Stop and Remove existing docker container if any
echo "Stop and Remove existing docker container if any"
docker rm -f krakend-with-plugins

# Build the docker image
echo "Removing old image of krakend-with-plugins..."
docker rmi krakend-with-plugins

# Build the docker image
echo "Building new image of krakend-with-plugins..."
docker build $NO_CACHE -t krakend-with-plugins:latest .

