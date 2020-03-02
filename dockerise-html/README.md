# DOCKER + NGINX 

### Option #1

Run the container mounting the static content though the volumes with the following

- Start 

```bash
docker-compose -f docker-compose-without-image.yml up -d
```

### Option #2

A static web app and nginx as the reverse proxy.

Clone this repo run the following command

```
docker build -it platfobs-static .

docker-compose up -d
```

Access app running with

```
http://localhost
```