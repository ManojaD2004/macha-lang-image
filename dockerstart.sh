#!/bin/bash

echo "Building and Starting Docker Image and Container"

docker build -t my-macha-lang-image ./
docker run --name my-macha-lang-container --rm -it -p 3000:3000 -p 8080:8080 my-macha-lang-image