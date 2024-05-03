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

./config.sh --unattended --url https://github.com/kluster-ai --token $TOKEN --replace --name "$NAME" --runnergroup "$RUNNER_GROUP"
./run.sh
