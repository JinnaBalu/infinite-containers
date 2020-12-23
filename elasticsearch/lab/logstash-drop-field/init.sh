#!/bin/bash

# Bootstraps Elasticsearch and run the containers

docker-compose up -d

while ! curl -s "localhost:9200/_cat/indices?v" | grep green; do
    sleep 0.1
done

curl -sXPUT 'https://k888lg3eg0:aukhzxugw1@wisestep-5166814538.us-east-1.bonsaisearch.net:443/customer/?pretty' -H 'Content-Type: application/json' -d '
{
    "settings" : {
        "index" : {
            "number_of_shards" : 5,
            "number_of_replicas" : 0
        }
    }
}'
for i in `seq 1 10`; do
  curl -X PUT "192.31.2.108:9200/jinna_customer/external/$i?pretty" -H 'Content-Type: application/json' -d"
  {
    \"number\": $i,
    \"name\": \"John Doe - $i\",
    \"email\": \"vi@vi.com\",
    \"dob\": \"12012020\",
    \"pdob\": \"12011990\"
  }"
done
