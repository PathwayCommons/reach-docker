# reach-docker

A docker version of the [clulab/reach](https://github.com/clulab/reach/blob/master/README.md) [webservices](http://agathon.sista.arizona.edu:8080/odinweb/api/help).

## System requirements

- Minimum of 8 GB RAM. Strongly recommend 16 GB RAM.

## Software requirements

- [Docker CE](https://docs.docker.com/release-notes/docker-ce/) >= 17.0.09-ce


## Getting started

- Pull the image and start the container. You will need to declare an appropriate \<port\> on your host.

```shell
  $ docker run --tty --detach --name reach_webservices --publish <port>:8080 --restart unless-stopped pathwaycommons/reach-docker:latest
```

- Notes
  - On system boot, restart is enabled via [--restart](https://docs.docker.com/config/containers/start-containers-automatically/) flag
