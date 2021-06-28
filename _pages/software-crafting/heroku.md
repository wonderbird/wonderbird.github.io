---
title: Heroku
layout: default
---
# Hosting Applications on Heroku

* [Jekyll Auth: Getting Started](https://github.com/benbalter/jekyll-auth/blob/master/docs/getting-started.md) - Showcase for getting started on Heroku using Jekyll and the jekyll-auth module.

Notes:

* As of June 28, 2021, the automatic heroku hosting setup didn't work. The command shown there had no effect. The manual setup worked though.
* If your branch is named `main`, then you can simply use `git push heroku`. Using `main` on the remote heroku repository works.
* Pushing the first deployment to heroku takes some minutes. Especially installing em-websocket takes a lot of time.

## Prerequisites

* [Create a free Heroku account](https://signup.heroku.com/)

## Further Documentation

* [Heroku Dev Center: Heroku Architecture](https://devcenter.heroku.com/categories/heroku-architecture)
* [Heroku Dev Center: Command Line](https://devcenter.heroku.com/categories/command-line)
  * [The Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
