---
title:  "Basic command to run with Postgress Container"
metadate: "hide"
categories: [ Database, PostgreSQL ]
description: "Import or export postgress db, how to run the psql commands, Create a database with postgres container"
tags: [ PostgreSQL ]
image: "https://github.com/JinnaBalu/postgreSQL/blob/master/images/postgresql.svg"
---


### Connect to the database itself

If we want to intect with our database we need to interact with postgres database first

```bash
docker exec -it postgres psql -Upostgress
```
### Create user and database with all privileges entering the container

```bash
docker exec -it postgres bash

psql -Upostgress

CREATE USER vibhuvi WITH PASSWORD 'vibhuvi';
CREATE DATABASE vibhuvidata;
GRANT ALL PRIVILEGES ON DATABASE vibhuvidata TO vibhuvi;
```

### Run psql commands without entering the container

- To run `psql`

```bash
docker exec -it postgres psql -U vibhuvi
```

- Create a database

```bash
docker exec -it postgres psql -U vibhuvi -c "create database vibhuvi"
```

- Run Select Query

```bash
docker exec -it postgres psql -Upostgres -a vibhuvi -c 'SELECT * FROM posts;'
```

### Import or Export with psql CLI


- Backup Database

```bash
docker exec -t postgres pg_dumpall -c -U vibhuvi > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
```

- Restore Databases

```bash
cat dump.sql | docker exec -i postgres psql -U postgres
```

