FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl rsync ca-certificates ssh && \
    apt-get clean

RUN mkdir /actions-runner
WORKDIR /actions-runner
RUN curl -o actions-runner-linux-x64-2.316.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.0/actions-runner-linux-x64-2.316.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.316.0.tar.gz && \
    rm ./actions-runner-linux-x64-2.316.0.tar.gz && \
    bin/installdependencies.sh  && \
    apt-get clean

ADD start.sh .
RUN chmod +x start.sh

ENV RUNNER_ALLOW_RUNASROOT=1

ENTRYPOINT /actions-runner/start.sh
