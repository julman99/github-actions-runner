# Run a self hosted runner easily

https://hub.docker.com/repository/docker/julman99/github-self-hosted-runner

## How to use

```
docker run -it --rm \
  -e TOKEN=<your-runner-token> \
  -e NAME=<your-runner-name> \
  -e RUNNER_GROUP=<your-runner-group-optional> \
  -v <local-path>=/actions-runner \
  julman99/github-self-hosted-runner
```
