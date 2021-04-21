### Installation

```
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo rm -rf /var/lib/docker

sudo rm -rf /var/lib/containerd

sudo apt-get purge docker-ce docker-ce-cli containerd.io

sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world
```

### checking images/containers

```
docker image ls
docker container ls
```

### removing images/containers

```
docker image prune
docker image rm (-f to force remove) --tag-- 
docker container rm --tag--
```


### Example hello world docker file

```
FROM centos:latest
MAINTAINER Romit rmaulik@anl.gov

WORKDIR /hello_world

RUN yum update -y
RUN yum groupinstall -y "Development Tools"
RUN yum install -y gcc-c++

COPY source/hello_world.cpp .
COPY submit.sh .

RUN chmod +x submit.sh

RUN g++ -o hello_world hello_world.cpp

ENTRYPOINT ["/hello_world/submit.sh"]
```

#### Submission script

```
#!/bin/bash
# submit.sh

./hello_world
```

### Building
from in the directory that contains Dockerfile

```
docker build -t hello_world .

# Without cache
docker build --no-cache -t hello_world .
```
-t provides tag (or name of image)

### To run

```
docker run hello_world args
```

### To build on dockerhub

Push to a repository that is linked with your dockerhub account


## Retrieving stuff on ALCF Theta
```
singularity build mpi_app.img docker://romitmaulik1/alcftutorial1:mpi_app
```