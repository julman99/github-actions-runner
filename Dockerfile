FROM ubuntu:22.04

ARG RUNNER_VERSION=2.317.0

RUN apt-get update && \
    apt-get install -y curl rsync ca-certificates ssh && \
    apt-get clean

RUN mkdir -p /actions-runner-download/actions-runner
WORKDIR /actions-runner-download/actions-runner
RUN curl -o actions-runner-linux-x64-$RUNNER_VERSION.tar.gz -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && \
    tar xzf ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && \
    rm ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && \
    bin/installdependencies.sh  && \
    apt-get clean


WORKDIR /actions-runner-download
ADD start.sh .
RUN chmod +x start.sh

ENV RUNNER_ALLOW_RUNASROOT=1

ENTRYPOINT /actions-runner-download/start.sh
