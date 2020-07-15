# Jenkins as a service in docker

## Run jenkins as container

```bash
docker container run -d --name jenkins -p 8080:8080 jenkins:alpine
```

## Create a service in docker swarm

```bash
docker service create --name jenkins -p 8080:8080 jenkins:alpine
```

**NOTE : TO GET DEFAULT PASSWORD**

- password will be in  */var/jenkins_home/secrets/initialAdminPassword*, of the container.

- bash into container

```bash
docker exec -it <DOCKER_CONTAINER_NAME> bash
```

Above command will take you to the container, cat the default password file with 

```bash
cat /var/jenkins_home/secrets/initialAdminPassword
```

## 1 Jenkins as a docker stack

```bash
cd tutorial/1/

docker stack deploy -c jenkins.yml jenkins
```

- Check with the stack services

```bash
docker stack ps jenkins
```

stop stack to go further

```bash
docker stack rm jenkins
```

## 2 Running Jenkins through DFP

```bash
cd tutorial/2/

docker network create -d overlay proxy

docker stack deploy -c proxy.yml proxy

docker stack ps proxy
```

Integrate jenkins with proxy

```bash
cd tutorial/2/

docker stack deploy -c jenkins.yml jenkins
```

## 3 Running Jenkins without manual setup

### Building Custom Jenkins Image

Running with persistency

```bash
cd tutorial/3/

docker build -t jinnabalu/jenkins .

docker push jinnabalu/jenkins
```

NOTE: jinnabalu is my docker hub user name.

### Create secrets

```bash
echo "admin" | docker secret create jenkins-user -

echo "admin" | docker secret create jenkins-pass -
```

### Run Jenkins

```bash
docker stack deploy -c jenkins.yml jenkins
```

## 4 Simulating Failure

Create job and and restart the machine or exit the jenkis as

In the browser *http://IP_OR_HOSTNAME/jenkins/exit*

it restarts in few minutes but looses it state when there are no volumes mounted in step 3.


