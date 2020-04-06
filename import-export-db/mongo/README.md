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