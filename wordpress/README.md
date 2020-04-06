# Wordpress as Docker container or swarm service

# Prequites
[docker-engine](https://docs.docker.com/install/#server)

[docker-compose](https://docs.docker.com/compose/install/)
  

# Download Wordpress

[Click me to Download](https://wordpress.org/download/) Or download with wget as

```bash
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
rm -rf latest.tar.gz
```
Place the code into wordpress folder

```bash
scp -r wordpress/ wordpress/
```

# Docker-compose with MYSQL

```bash
docker-compose -f docker-compose-mysql.yml up -d
```

# Docker commands help you to check the status of the application

```bash
docker ps -a # to know the status of the Containers
```
