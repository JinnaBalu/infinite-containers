# IMPORT 

Import schema (.cql file)

```bash
cqlsh -e "SOURCE '/path/to/schema.cql'"
```

OR

```bash
cqlsh

use keyspacename; 

source 'table_schema_file.cql';
```

## DOCKER 

```bash

```

# EXPORT

Export keyspace schema

```bash
cqlsh -e "DESC KEYSPACE user" > user_schema.cql
```

Export entire database schema

```bash
cqlsh -e "DESC SCHEMA" > db_schema.cql
```

## DOCKER

```bash
```

# Seeding cassandra for developer with default data

## DOCKER

Docker compose files with volume of db scripts mounted to docker-entrypoint-initdb.d

```bash
version: '2'
services:
    cassandra:
        image: cassandra:3.9
        restart: unless-stopped
        volumes:
            - ./docker-entrypoint.sh:/docker-entrypoint.sh
            - /var/db/cassandra:/var/lib/cassandra
            - ./docker-entrypoint-initdb.d/:/docker-entrypoint-initdb.d/
        ports:
            - 7000:7000
            - 7001:7001
            - 7199:7199
            - 9042:9042
            - 9160:9160
```

