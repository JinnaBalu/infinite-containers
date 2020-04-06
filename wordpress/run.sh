#!/bin/bash
mkdir -p db-data/
mkdir -p logs/nginx/
mkdir -p wordpress/

docker stack deploy -c docker-compose.yml wp

