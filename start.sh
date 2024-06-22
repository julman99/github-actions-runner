#!/bin/bash
set -e

if [ -z "${NAME}" ]; then
    echo "Error, NAME must be specified via envvar"
    exit 1
fi

if [ -z "${TOKEN}" ]; then
    echo "Error, TOKEN must be specified via envvar"
    exit 1
fi

if [ -z "${REPO_URL}" ]; then
    echo "Error, REPO_URL must be specified via envvar with the repository url"
    exit 1
fi


if [ -z "${RUNNER_GROUP}" ]; then
    RUNNER_GROUP="default"
fi

if [ ! -f "/actions-runner/config.sh" ]; then
    echo "Copying actions-runner directory..."
    cp -R /actions-runner-download/actions-runner/. /actions-runner/
fi

cd /actions-runner

if [ ! -f "/actions-runner/.runner" ]; then
    ./config.sh --unattended --url $REPO_URL --token $TOKEN --replace --name "$NAME" --runnergroup "$RUNNER_GROUP"
fi


./run.sh
