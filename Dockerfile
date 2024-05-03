FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y ca-certificates curl rsync && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

RUN mkdir /actions-runner
WORKDIR /actions-runner
RUN curl -o actions-runner-linux-x64-2.316.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.0/actions-runner-linux-x64-2.316.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.316.0.tar.gz && \
    rm ./actions-runner-linux-x64-2.316.0.tar.gz
ADD start.sh .
RUN chmod +x start.sh

ENV RUNNER_ALLOW_RUNASROOT=1

ENTRYPOINT /actions-runner/start.sh
