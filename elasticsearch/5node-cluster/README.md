# Elasticsearch 5 Node cluster

## Issues

- max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]

add the varibale to /etc/sysctl.conf

vm.max_map_count=262144

OR

sysctl -w vm.max_map_count=262144

Security must be explicitly enabled when using a [basic] license. Enable security by setting [xpack.security.enabled] to [true] in the elasticsearch.yml file and restart the node.
