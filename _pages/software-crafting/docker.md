---
title: Docker
layout: default
---

# Docker

## Einstiegs-Doku

* [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)
* [Getting Started](https://docs.docker.com/get-started/)
* [Docker katas](https://github.com/eficode-academy/docker-katas) - Workshop from "Hello Docker" to deploying a containerized web application to a server.

## Docker Container unter Apple Silicon (M1 Chip, ARM64 Plattform)

Für manche Docker Container existieren keine `linux/arm64` Images. In diesen Fällen meldet `docker build .` folgenden Fehler (hier am Beispiel von Clojure):

```text
ERROR [internal] load metadata for docker.io/library/clojure:alpine
...
error: failed to solve: failed to solve with frontend dockerfile.v0: failed to create LLB definition: no match for platform in manifest sha256:d7bcb938ec3e6cef737e621e83f82b6ebbf6e60ebf5e4354c2f7d5418bb7cc5c: not found
```

Falls ein alternatives Docker Image für die `linux/arm64` Plattform verfügbar ist, dann ist es am sinnvollsten, die `FROM` Zeile im `Dockerfile` anzupassen. Dadurch bekommt man ein schnelles Image und bezahlt vermutlich mit Größe des Images.

Alternativ kann Docker Desktop für Apple Silicon (M1) die `linux/amd64` Plattform emulieren. Ein Container wird dann mittels 

```sh
docker buildx build --platform linux/amd64 --tag image-tag .
```

erstellt. Der Build dauert allerdings extrem viel länger als ohne die Emulation (ich habe den Code Maat Build nach 12 Minuten abgebrochen).

### Hinweis zur Docker Performance

In der Emulation läuft der Build Prozess langsamer als auf einem Gerät mit entsprechender CPU.

### Links zu Docker und Apple Silicon

* docker docs: [Docker Desktop for Apple silicon](https://docs.docker.com/desktop/mac/apple-silicon/) - Offizielle Docker Dokumentation zu Apple Silicon.

## Häufig genutzte Befehle

* `docker images` zeigt alle geladenen Images an
* `docker stats` Monitoring der laufenden Docker Prozesse incl. CPU und Speicherbedarf
* `docker ps -a` zeigt alle laufenden und beendeten Docker Prozesse an
* `docker run -it container /bin/bash` startet den Container im interaktiven Modus, verbindet ein Terminal und läd eine ~BaSH
* `docker run -it -p 8080:80 --rm --name mycontainer container` startet den Container im interaktiven Modus (-i), verbindet ein Terminal (-t) und führt das im Dockerfile angegebene Programm aus. Port 80 wird an localhost:8080 weitergeleitet. Sobald das ausgeführte Programm beendet wird, wird der laufende Container aufgeräumt. Der Container kann durch den Namen mycontainer identifiziert werden.
* `docker start mycontainer` started einen `exited` Container im Hintergrund. Anschließend kann man den Container mit `docker exec` "betreten".
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
* `docker inspect imagename` zeigt detaillierte Infos über das Image an
    * `docker inspect ubuntu | jq '.[0].Author,.[0].Config.Labels'`

## Interessante Docker Container

* [prom/prometheus](https://hub.docker.com/r/prom/prometheus) Prometheus is a systems and service monitoring system
* [portainer/portainer](https://hub.docker.com/r/portainer/portainer) Making Docker management easy. https://portainer.io
* [dorowu/ubuntu-desktop-lxde-vnc](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc) Provide HTML5 VNC interface to access Ubuntu LXDE and LXQt desktop environment (XWindows, HTTP). [GitHub Repository](https://github.com/fcwu/docker-ubuntu-vnc-desktop)

## Bind Mount Performance

Sowohl unter Windows als auch unter macOS ist die performance von bind mounts deutlich schlechter als von volumes.
Grundsätzlich sind [Docker Volumes](https://docs.docker.com/storage/volumes/) die performantere Alternative.

Unter macOS habe ich so eine 2,25 Stunden dauernde Analyse mit CodeScene dadurch auf 5 min verkürzt. Dabei wurden
1,7 GB Daten verarbeitet.

## Windows WSL2 Empfehlungen - Performance

Docker Container sollten unter Windows aus einer WSL2 Linux Distribution gestartet werden. Außerdem ist es wichtig, dass WSL2, Docker und die Linux Distribution korrekt zusammenarbeiten - siehe [Docker Desktop WSL2 backend](https://docs.docker.com/desktop/windows/wsl/).

Begründung: Siehe Abschnitt **Awesome mounts performance** in [Docker Desktop: WSL 2 Best practices](https://www.docker.com/blog/docker-desktop-wsl-2-best-practices/).

## Aufräumen

see: [How to remove old and unused Docker images](http://stackoverflow.com/questions/32723111/how-to-remove-old-and-unused-docker-images)

### Alles aufräumen

```sh
# Ungenutzte Container, Images, Netzwerke löschen - ohne Volumes:
docker system prune

# Auch ungenutzte Volumes löschen
docker system prune --volumes
```

### Ungenutzte Docker Container löschen

```sh
docker ps
docker ps -a
docker rm $(docker ps -qa --no-trunc --filter "status=exited")
```

### Ungenutzte Docker Images löschen

```sh
docker images
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
docker images | grep "none"
docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')
```

### Ungenutzte Docker Volumes löschen:

```sh
docker volume rm $(docker volume ls -qf dangling=true)
docker volume ls -qf dangling=true | xargs -r docker volume rm
```

## Links

* Docker, Inc.: [Prune unused Docker objects](https://docs.docker.com/config/pruning/)
* [Heise Developer: "Docker aufräumen"](https://www.heise.de/developer/artikel/Docker-aufraeumen-3604106.html)
* [Docker Cleanup Guide](https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430)