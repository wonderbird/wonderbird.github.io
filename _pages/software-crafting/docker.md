---
title: Docker
layout: default
---

# Docker

## Einstiegs-Doku

* [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)
* [Getting Started](https://docs.docker.com/get-started/)

## Häufig genutzte Befehle

* `docker images` zeigt alle geladenen Images an
* `docker ps -a` zeigt alle laufenden und beendeten Docker Prozesse an
* `docker run -it container /bin/bash` startet den Container im interaktiven Modus, verbindet ein Terminal und läd eine ~BaSH
* `docker run -it -p 8080:80 --rm --name mycontainer container` startet den Container im interaktiven Modus (-i), verbindet ein Terminal (-t) und führt das im Dockerfile angegebene Programm aus. Port 80 wird an localhost:8080 weitergeleitet. Sobald das ausgeführte Programm beendet wird, wird der laufende Container aufgeräumt. Der Container kann durch den Namen mycontainer identifiziert werden.
* `docker build -t friendlyhello .` baut das Dockerfile im Verzeichnis "." und gibt dem Image das Tag (-t) "friendlyhello"
* `docker exec -it foo /bin/bash` verbindet eine Bash mit dem Container foo
* `docker cp` kopiert eine Datei vom Docker Container auf den Host
* `docker logs --follow codescene` hängt sich an die logs des containers "codescene" an
* `docker logs -t myprometheus` zeigt die letzten logs des containers "myprometheus" (auch dann, wenn der container beendet wurde).
* `docker run ... -v /some/path/file.txt:/target/in/container/file.txt ...` macht file.txt im container verfügbar
* `docker run ... --env MYVARIABLE=value` run a container with environment variable configured
* `docker run ... --network="mynetwork"` startet den Container im angegebenen Docker Netzwerk
* `docker run ... --memory="4096m"` weißt dem Container beim Start 4GB RAM zu
* `docker network list` zeigt alle Docker Netzwerke an

## Interessante Docker Container

* [prom/prometheus](https://hub.docker.com/r/prom/prometheus) Prometheus is a systems and service monitoring system
* [portainer/portainer](https://hub.docker.com/r/portainer/portainer) Making Docker management easy. https://portainer.io
* [dorowu/ubuntu-desktop-lxde-vnc](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc) Provide HTML5 VNC interface to access Ubuntu LXDE and LXQt desktop environment (XWindows, HTTP). [GitHub Repository](https://github.com/fcwu/docker-ubuntu-vnc-desktop)

## Windows WSL2 Empfehlungen - Performance

Docker Container sollten unter Windows aus einer WSL2 Linux Distribution gestartet werden. Außerdem ist es wichtig, dass WSL2, Docker und die Linux Distribution korrekt zusammenarbeiten - siehe [Docker Desktop WSL2 backend](https://docs.docker.com/desktop/windows/wsl/).

Begründung: Siehe Abschnitt **Awesome mounts performance** in [Docker Desktop: WSL 2 Best practices](https://www.docker.com/blog/docker-desktop-wsl-2-best-practices/).

## Aufräumen

see: [How to remove old and unused Docker images](http://stackoverflow.com/questions/32723111/how-to-remove-old-and-unused-docker-images)

### Alles aufräumen

```shell
# Ungenutzte Container, Images, Netzwerke löschen - ohne Volumes:
docker system prune

# Auch ungenutzte Volumes löschen
docker system prune --volumes
```

### Ungenutzte Docker Container löschen

```shell
$ docker ps
$ docker ps -a
$ docker rm $(docker ps -qa --no-trunc --filter "status=exited")
```

### Ungenutzte Docker Images löschen

```shell
$ docker images
$ docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

$ docker images | grep "none"
$ docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')
```

### Ungenutzte Docker Volumes löschen:

```shell
$ docker volume rm $(docker volume ls -qf dangling=true)
$ docker volume ls -qf dangling=true | xargs -r docker volume rm
```

## Links

* Docker, Inc.: [Prune unused Docker objects](https://docs.docker.com/config/pruning/)
* [Heise Developer: "Docker aufräumen"](https://www.heise.de/developer/artikel/Docker-aufraeumen-3604106.html)
* [Docker Cleanup Guide](https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430)