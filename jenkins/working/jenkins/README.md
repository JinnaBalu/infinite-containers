# Jenkins as swarm service

### Running Jenkins through Docker Flow Proxy

### Building Custom Jenkins Image

Running with persistency

```bash
docker-comppose -f jenkins.yml up -d
```

OR 

### Run Jenkins

```bash
docker stack deploy -c jenkins.yml jenkins
```