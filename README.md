_This is NOT an original piece of work, just a snap of Mimir_

Grafana Mimir is an open source software project that provides a scalable long-term storage for Prometheus.

Read the doc at https://grafana.com/docs/mimir/latest/ on how to get started.

### Connect the interfaces

```
sudo snap connect mimir-gael:hardware-observe
sudo snap connect mimir-gael:network-observe
```

### Configure the server (Example)

```
sudo vi /var/snap/mimir-gael/current/mimir.yaml

# Do not use this configuration in production.
# It is for demonstration purposes only.
multitenancy_enabled: false

blocks_storage:
  backend: filesystem
  bucket_store:
    sync_dir: /var/snap/mimir-gael/common/tsdb-sync
  filesystem:
    dir: /var/snap/mimir-gael/common/data/tsdb
  tsdb:
    dir: /var/snap/mimir-gael/common/tsdb

compactor:
  data_dir: /var/snap/mimir-gael/common/compactor
  sharding_ring:
    kvstore:
      store: memberlist

distributor:
  ring:
    instance_addr: 127.0.0.1
    kvstore:
      store: memberlist

ingester:
  ring:
    instance_addr: 127.0.0.1
    kvstore:
      store: memberlist
    replication_factor: 1

ruler_storage:
  backend: filesystem
  filesystem:
    dir: /var/snap/mimir-gael/common/rules

server:
  http_listen_port: 9009
  log_level: error

store_gateway:
  sharding_ring:
    replication_factor: 1

sudo snap restart mimir-gael.mimir-server
```

