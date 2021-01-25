1. indices.breaker.request.limit logs cloud
(Dynamic) Limit for request breaker, defaults to 60% of JVM heap.

indices.breaker.request.limit to 40%
search.max_buckets=10000
indices.breaker.request.overhead to 2.

curl -XPUT 'http://localhost:9200/_cluster/settings' -d '{ "persistent" : { "indices.breaker.fielddata.limit" : "60%" } }'



PUT _cluster/settings 
{ 
  "persistent": 
  { 
    "search.max_buckets": 10000
  } 
}

GET _cluster/settings

GET _cluster/allocation/explain

PUT /_cluster/settings
{
  "persistent" : {
    "indices.breaker.fielddata.limit" : "40%" 
  }
}




1.1 field data circuit breaker: unbounded
ElasticsearchException[org.elasticsearch.common.breaker.CircuitBreakingException: 
Data too large, data for field [id] would be larger than limit of [19206242304/17.8gb]];

indices.fielddata.cache.size = 40% or Absolute value 12GB, default is Unbounded




1.2 indices.breaker.total.use_real_memory=Defaults to true.

Starting limit for overall parent breaker. Defaults to 70% of JVM heap if indices.breaker.total.use_real_memory is false. If indices.breaker.total.use_real_memory is true, defaults to 95% of the JVM heap.

2. search.max_buckets 10000, default is 65000

 - https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket.html

3. Garbage Collection Hell

	ParallelGCThreads value, changed the size ratio between young and old memory pools, allotted more memory to shards by increasing the indices.memory.index_buffer_size to 20%, and increased the index.refresh_interval to 30 seconds. These changes dramatically reduced CPU and GC/sec, returning performance to a stable and predictable state

4. Error: This aggregation creates too many buckets (10001) and will throw an error in future versions. 
You should update the [search.max_buckets] cluster setting or use the [composite] aggregation to paginate all buckets in multiple requests.

https://plaid.com/blog/how-we-stopped-memory-intensive-queries-from-crashing-elasticsearch/

5. Elasticsearch ERROR relaed to Authentication:  Authentication of [elastic] was terminated by realm [reserved] - failed to authenticate user [elastic]

6. Elasticsearch 7.x circuit breaker - data too large - troubleshoot: 


7. FIELDDATA Data is too large

org.elasticsearch.common.breaker.CircuitBreakingException: [FIELDDATA] Data too large, data for [@timestamp] would be larger than limit of [622775500/593.9mb]

Ans. You can try to increase the fielddata circuit breaker limit to 75% (default is 60%) in your elasticsearch.yml config file and restart your cluster:
indices.breaker.fielddata.limit: 75%

Or if you prefer to not restart your cluster you can change the setting dynamically using:

curl -XPUT localhost:9200/_cluster/settings -d '{
  "persistent" : {
    "indices.breaker.fielddata.limit" : "40%" 
  }
}'


Meet the young minds, of Grama Bharathi's short/long term goals of village development!


Manish when is the appraisal metting date. As you said it will hapen in January first week, I will proceed for withdrawal accordingly. When it is expected to happen. 


2019–03–19T19:48:11,414][WARN][o.e.d.s.a.MultiBucketConsumerService] 
This aggregation creates too many buckets (10001) and will throw an error in future versions. 
You should update the [search.max_buckets] cluster setting or use the [composite] aggregation to paginate all buckets in multiple requests.

Error page: 

1. Scrape new : bot internet, CMS - joomla
2. Automate the process
3. Create a API and expose as a service
4.  

