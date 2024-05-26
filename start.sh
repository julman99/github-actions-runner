#!/bin/bash
set -e

CONFIGURED_FILE="/actions-runner/.configured"

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

if [ ! -f $CONFIGURED_FILE ]; then
    ./config.sh --unattended --url https://github.com/kluster-ai --token $TOKEN --replace --name "$NAME" --runnergroup "$RUNNER_GROUP"
    touch $CONFIGURED_FILE
fi


./run.sh
