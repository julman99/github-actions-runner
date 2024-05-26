#!/bin/bash

VERSION="$1"

if [ -z "$VERSION" ]; then
    echo "Usage ./deploy.sh <version>"
    exit 3
fi

docker build --platform=linux/amd64 -t julman99/github-self-hosted-runner:$VERSION -t julman99/github-self-hosted-runner:latest .
docker push julman99/github-self-hosted-runner:$VERSION
docker push julman99/github-self-hosted-runner:latest
