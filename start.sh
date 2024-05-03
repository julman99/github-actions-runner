#!/bin/bash

if [ -z "${TOKEN}" ]; then
    echo "Error, TOKEN must be specified via envvar"
    exit 1
fi

./config.sh --unattended --url https://github.com/kluster-ai --token $TOKEN
./run.sh
