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
