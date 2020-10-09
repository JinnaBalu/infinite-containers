# Benchmarking Elasticsearch - Rally Docker Container

This repository assists in building containers for running Elasticsearch Rally.

## Running rally

With docker cli:

```bash
docker run -v ./tracks:/root/.rally/benchmarks/tracks \
  -v ./rally.ini:/root/.rally/rally.ini \
  elastic/rally \
  esrally --pipeline=benchmark-only --target-hosts=elasticsearch:9200 --track=my-track
```

Or with docker-compose:

```.yml
    version: "3.7"
    services:
      rally:
        image: elastic/rally
        volumes:
          - ./rally.ini:/root/.rally/rally.ini
          - ./tracks:/root/.rally/benchmarks/tracks
        command: esrally --pipeline=benchmark-only --target-hosts=localhost:9200 --track=my-track

```