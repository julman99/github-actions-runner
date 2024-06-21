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


if [ -z "${RUNNER_GROUP}" ]; then
    RUNNER_GROUP="default"
fi

if [ ! -f "/actions-runner/config.sh" ]; then
    echo "Copying actions-runner directory..."
    cp -R /actions-runner-download/actions-runner/. /actions-runner/
fi

cd /actions-runner

if [ ! -f "/actions-runner/.runner" ]; then
    ./config.sh --unattended --url https://github.com/kluster-ai --token $TOKEN --replace --name "$NAME" --runnergroup "$RUNNER_GROUP"
fi


./run.sh
