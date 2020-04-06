# RUN Postgre

create *docker-compose.yml* file

```bash
version: '2'
services:
    postgresql:
        image: postgres:9.6.5
        # uncomment to maintan persistance
        # volumes:
        # uncomment to maintan persistance
        #    - ~/volumes/jhipster/postgree/postgresql/:/var/lib/postgresql/data/
        # init with the initial sql file
        #    - ./init.sql:/docker-entrypoint-initdb.d/init.sql
        environment:
            - POSTGRES_USER=postgree
            - POSTGRES_PASSWORD=
        ports:
            - 5432:5432

```
RUN

```bash
docker-compose up -d
```

### NOTE #1

Note that you can link multiple scripts into that folder and they will all run (in alphabetical order)

```bash
volumes:
  - ./init1.sql:/docker-entrypoint-initdb.d/1-schema.sql
  - ./init2.sql:/docker-entrypoint-initdb.d/2-data.sql
```
### NOTE #2

Make sure you point to a directory and not a file. So instead of referencing the files directly you can mount directory when you have bulk of files

```bash
volumes:
  - ./path/to/my/host/folder:/docker-entrypoint-initdb.d/
  - ./path/to/my/host/folder:/docker-entrypoint-initdb.d/

```

# IMPORT 

Import schema (.sql file)

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