# Redis 

## Sentinel 

- Change the permission of the sentinel file `chmod 777 <FILE_PATH>`


Notes:

1. Append-only file
    Snapshotting is not very durable. If your computer running Redis stops, your power line fails, or you accidentally kill -9 your instance, the latest data written on Redis will get lost. While this may not be a big deal for some applications, there are use cases for full durability, and in these cases Redis was not a viable option.

    The append-only file is an alternative, fully-durable strategy for Redis. It became available in version 1.1.

    You can turn on the AOF in your configuration file:

    appendonly yes
    From now on, every time Redis receives a command that changes the dataset (e.g. SET) it will append it to the AOF. When you restart Redis it will re-play the AOF to rebuild the state.


## Warning:

```bash

Redis Warnings:
===============

1. WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.


2. WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.

Sentinel Warning:
=================

1. WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.

2.  WARNING: Sentinel was not able to save the new configuration on disk!!!: Permission denied
```

