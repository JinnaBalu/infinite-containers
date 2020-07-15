# Jenkins as a docker container

- Create a jenkins.yml file

```yml
version: '3'
services:
  main:
    image: jenkinsci/jenkins:${TAG:-lts-alpine}
    ports:
      - ${UI_PORT:-8080}:8080
      - ${AGENTS_PORT:-50000}:50000
    environment:
      - JENKINS_OPTS="--prefix=/jenkins"
```

- Run as container with compose

```bash
docker-compose -f jenkins.yml up -d
```

# Jenkins as a swarm service

- Use the same jenkins file and run as a stack

```bash
docker stack deploy -c jenkins.yml jenkins
```