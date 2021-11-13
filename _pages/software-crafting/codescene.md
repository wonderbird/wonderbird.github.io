---
title: CodeScene
layout: default
---

## CodeScene

### Request Free Trial Period

To request a free trial period, click **Try for Free** on [CodeScene Pricing](https://codescene.com/pricing)

### Installation

#### Overview

- [Getting Started Guide](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/index.html)

- [Deployment Options](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/deployment-options.html) - shows system requirements.

- [Installation](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#) - Installation instructions for different hosting options.
  - [JAR file execution](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#run-the-standalone-codescene-application) - run the standalone CodeScene application.
  - **[recommended]** [dockerhub://empear/codescene](https://hub.docker.com/r/empear/codescene) - run CodeScene (with license) inside docker container(s).
  - [github://empear-analytics/codescene-kubernetes](https://github.com/empear-analytics/codescene-kubernetes) - run CodeScene (with license) on Kubernetes

#### Running on Docker

##### Warning

 The docker instance will contain an **unprotected SSH key** saved in `codescene/.ssh`. This will allow the `codescene` user read access to your git repositories. For your repositories, create a **separate dedicated user** with **minimal access rights** and think about information security. In addition, consider this problematic key in your **backup strategy**.

##### Running

- Follow the instructions in section **Example: Run CodeScene using docker** of of [[2]](ref-2)

- For git repository access the instructions include the commands showing in section **Git Repository Access** of [[2]](ref-2).

#### Special Use Cases

- [github://empear-analytics/docker-codescene-nginx-self-signed-ssl](https://github.com/empear-analytics/docker-codescene-nginx-self-signed-ssl#prepare-the-host-and-reverse-proxy-configuration-for-letsencrypt-ssl-certificate) - Example: Using SSL with CodeScene behind an nginx reverse proxy on Docker

### Configuration

#### Configuration of the Trial Version

- Add [Users and Roles](https://docs.enterprise.codescene.io/versions/4.5.0/configuration/users-and-roles.html)

#### Configuration of the Final Installation

- Configuring LDAP is described in section **Single Sign-On** of [Users and Roles](https://docs.enterprise.codescene.io/versions/4.5.0/configuration/users-and-roles.html#single-sign-on)

- Follow the instructions in [CodeScene usage pattern: workflows, users, and how to successfully roll-out CodeScene](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/codescene-usage-patterns.html)

### Create Projects

- [Run an Analysis](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/run-an-analysis.html)
  - Note: SSH remotes don't start with `ssh://` but directly with the user name

### Maintenance Considerations

- How to securely backup the **unprotected private SSH key** stored in the `codescene/.ssh` directory?

- [Database Backup](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#db-backup)

#### Inspecting the Running CodeScene Container

```shell
# display and follow the container logs
docker logs --follow codescene

# display the resources allocated by the container continuously
docker stats codescene

# display the running processes and their resource allocation
docker exec -it codescene /bin/bash
$ top
```

### Troubleshooting

- [Java Memory Configuration](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#configure-the-available-memory) - RAM is critical! The JVM should have 50-60% of a 4 GB machine or 300-500 MB in a kubernetes pod.

- [Enable full stack traces](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#avoid-missing-stack-traces) - ensure that full stack traces are printed to facilitate troubleshooting java exceptions.

- [DB Performance](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#external-db-performance) - hints addressing the performance (the DB is usually not a bottleneck).

### Outlook

[dockerhub://empear/codescene](https://hub.docker.com/r/empear/codescene) suggests configuring the following plugins:

- Code Coverage Plugin
- SonarQube Plugin

### References

<a name="ref-1">[1]</a> [CodeScene.com](https://codescene.com) - The official CodeScene website.

<a name="ref-2">[2]</a> [dockerhub://empear/codescene](https://hub.docker.com/r/empear/codescene) - run CodeScene (with license) inside docker container(s).
