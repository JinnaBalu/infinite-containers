
How to setup mappings efficiently
How to leverage the node query cache and shard request cache
When to use keyword, wildcard or text field types
How to secure node and client communications efficiently
How to leverage ingest pipelines to transform data transparently
How to set up zone awareness for shards of an index
How to create data streams
How to efficiently manage the lifecycle of indexes
How to leverage transforms (aka data frames)
How to roll up your data
How to properly set up a hot/warm/(cold) architecture

# How to setup mappings efficiently

# The Efficient Mappings in Elasticsearch Index 

## Mappings
Mappings, are the core element of any index creation and it acts as a skeleton structure that represents the documents and the definition of the each field on how the document is getting indexed or searched. Mappings is a set of the key-value pairs, where key is the field and value is the type of the field. 

Elasticsearch gives us a freedom to index the document without defining the mappings and settings before indexing document is called as Dynamic Mappings, where as Explicit Mapping is a process of creating the mappings and setting before any document getting indexed.  

Each mapping can be either a metadata field, or a custom fields added. There are different types of mapping field types available to define with elasticsearch. 


### Implicit/Dynamic Mappings vs Explicit Mappings

*Implicit/Dynamic Mapping:* Indexing the document without defining the mappings, new fields will be added to the top level and nested. Helps to index data faster, becomes bad when you exceed the the number of fields and leads to mapping explosion. 

```bash
curl -X PUT "localhost:9200/customer/_doc/1?pretty" -H 'Content-Type: application/json' -d'
{ 
    "email": "help@customer-one.com",
    "name": "Customer One",
    "subscriptionStartDate": "2020-01-01",
    "subscriptionEndDate": "2022-01-01"
}
'
```

Let's get the mappings which saved dynamically

```bash
curl -XGET "http://localhost:9200/customer/_mappings?pretty"

{
  "customer" : {
    "mappings" : {
      "properties" : {
        "email" : {
          "type" : "text",
          "fields" : {
            "keyword" : {
              "type" : "keyword",
              "ignore_above" : 256
            }
          }
        },
        "name" : {
          "type" : "text",
          "fields" : {
            "keyword" : {
              "type" : "keyword",
              "ignore_above" : 256
            }
          }
        },
        "subscriptionEndDate" : {
          "type" : "date"
        },
        "subscriptionStartDate" : {
          "type" : "date"
        }
      }
    }
  }
}
```
- Here when we index the document we have got the mappings implicit, elasticsearch can recognize the type of data and assigns a field type to every field.

Dynamic mappings will give bad results when indexing a document unaware. We'll discuss the best efficient way of defining mappings for indexing and searching.

 *Explicit Mappings:* Defining the mappings before indexing the document, all new fields will be added using [PUT MAPPING API](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-put-mapping.html)

```bash
curl -X PUT "localhost:9200/employee?pretty" -H 'Content-Type: application/json' -d'
{
  "mappings": {
    "properties": {
      "age":    { "type": "integer" },  
      "email":  { "type": "keyword"  }, 
      "name":   { "type": "text"  }     
    }
  }
}
'
```

Adding new field to the existing index

```bash
curl -X PUT "localhost:9200/employee/_mapping?pretty" -H 'Content-Type: application/json' -d'
{
  "properties": {
    "employee-id": {
      "type": "keyword"
    }
  }
}
'
```


Index per document Migrate multi-type indices to single type
Index Templating
Effective Mappings for Searching
    - boost
Effective Mappings for Indexing
    - Ignore Malformed,  Ambiguous data can be indexed for the single field, will be resolved, like sending a phone number to the email field can be ignored. Other data ill be indexed.
    - Coerce
    - dynamic ['true' / 'false' / 'strict']

Mapping Explosion:

| ------------- | ------------- | ----------- | ------- |
| Index Mapping | Default Value | Explanation | Effects |
|index.mapping.total_fields.limit |   1000 | Maximum number of field in an index |



Dynamic Mapping - Indexing without mapping

Yes we can index the document without mappings, but elasticsearch is not as smart as you think, and it saves some of the fields as strings where it is expected to be a date type or a numeric type, which will result in not making aggrigations. Analytics by date is not an easy job. So it is bad practice to index the documents without mappings which will not provide the search, analyse or visualise the data in kibana as expected.

	If you have done this already, we can still make it done, by reindexing by defining the new mappings with specified type of fields.


Disable Dynamic Mappings
https://discuss.elastic.co/t/how-to-disable-dynamic-mapping-in-5-1-1/69019
Mapping Explosion : 






Elasticsearch also introduced index templating, is a composition of mappings, settings and alias as a template which is a predefined  in 7.8 Intro to Indexing Templating  in 7.8, 

Index Templates
Component Template


Cleanup Dirty Data 
