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

1. Run the commands in section **Git Repository Access** of [[2]](ref-2) to generate an SSH key allowing the `codescene` user read access to the git repositories.


#### Special Use Cases

- [github://empear-analytics/docker-codescene-nginx-self-signed-ssl](https://github.com/empear-analytics/docker-codescene-nginx-self-signed-ssl#prepare-the-host-and-reverse-proxy-configuration-for-letsencrypt-ssl-certificate) - Example: Using SSL with CodeScene behind an nginx reverse proxy on Docker

### Maintenance

- [Database Backup](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#db-backup)

### Troubleshooting

- [DB Performance](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#external-db-performance) - hints addressing the performance (the DB is usually not a bottleneck).

- [Enable full stack traces](https://docs.enterprise.codescene.io/versions/4.5.0/getting-started/installation.html#avoid-missing-stack-traces) - ensure that full stack traces are printed to facilitate troubleshooting java exceptions.

### References

<a name="ref-1">[1]</a> [CodeScene.com](https://codescene.com) - The official CodeScene website.

<a name="ref-2">[2]</a> [dockerhub://empear/codescene](https://hub.docker.com/r/empear/codescene) - run CodeScene (with license) inside docker container(s).
