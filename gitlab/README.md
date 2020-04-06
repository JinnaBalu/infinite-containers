# GitLab as a hosted git service

Deploy gitlab as a docker container using docker compose

```bash
docker-compose up -d

```

The GitLab container uses host mounted volumes to store persistent data

| Local location | Container location | Usage |
| --- | --- | --- |
| `./data/gitlab/config` | `/etc/gitlab` | storing the GitLab configuration files |
| `./data/gitlab/logs` | `/var/log/gitlab` | storing logs |
| `./data/gitlab/data` | `/var/opt/gitlab` | storing application data |

- To configure doing bash into the container with 

```bash
sudo docker exec -it gitlab /bin/bash
```
- To edit files in container, example `/etc/gitlab/gitlab.rb`

```bash
 sudo docker exec -it gitlab editor /etc/gitlab/gitlab.rb

 sudo docker restart gitlab
```

> NOTE: Change the environment variables according to your host
