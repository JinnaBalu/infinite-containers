# RUN Mysql

create *docker-compose.yml* file

```bash
version: '2'
services:
    mysql:
        image: mysql:5.7.20
        # volumes:
        #     - ~/volumes/jhipster/mysql/mysql/:/var/lib/mysql/
        environment:
            - MYSQL_USER=root
            - MYSQL_ALLOW_EMPTY_PASSWORD=yes
            - MYSQL_DATABASE=mysql
        ports:
            - 3306:3306
        command: mysqld --lower_case_table_names=1 --skip-ssl --character_set_server=utf8 --explicit_defaults_for_timestamp

```

RUN

```bash
docker-compose up -d
```

# IMPORT 

Import schema (.cql file)

```bash
mysql -u username -p new_database < data-dump.sql
```
- data-dump.sql is the data dump file to be imported, located in the current directory

## DOCKER 

```bash
docker exec -i CONTAINER_ID /bin/bash -c "export TERM=xterm && mysql -proot -uroot database" < data-dump.sql
```

# EXPORT

Export database schema

```bash
mysqldump -u username -p database_name > data-dump.sql
```
- data-dump.sql is the file in the current directory that the output will be saved to


## DOCKER

```bash
docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > data-dump.sql
```
