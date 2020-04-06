---
title: Wordpress as Docker container or swarm service
description: Deploying and developing wordpress as a container. Seting up a local wordpress from a app/wordpress directory using Docker Cotainer
---

## Preface

Environment setup and management is a tedious task in every project, we use docker to shift between any technology in no time with containerization. [What problem does docker solve?]()

1. Install [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
2. install [docker-compose](https://docs.docker.com/compose/install/)

## Download Wordpress

[Click me to Download](https://wordpress.org/download/) Or download with wget as

```bash
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
rm -rf latest.tar.gz
```
Place the code into wordpress folder

```bash
scp -r wordpress/ wordpress/
```

## Docker-compose with MYSQL

```bash
docker-compose -f docker-compose-mysql.yml up -d
```

## Docker commands help you to check the status of the application

```bash
docker ps -a # to know the status of the Containers
```

[![Try in PWD](https://cdn.rawgit.com/play-with-docker/stacks/cff22438/assets/images/button.png)](http://play-with-docker.com?stack=https://raw.githubusercontent.com/JinnaBalu/wordpress/master/docker-compose-wordpress-mysql.yml)


