---
title: Jekyll
layout: default
---
## Generating Websites with Jekyll

<!-- doctoc --maxlevel 4 /Users/stefan/source/wonderbird/wonderbird.github.io/_pages/software-crafting/static-websites/jekyll.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Prerequisites](#prerequisites)
  - [Ruby](#ruby)
  - [Jekyll](#jekyll)
- [Local Development](#local-development)
- [Troubleshooting](#troubleshooting)
- [Liquid Template Language](#liquid-template-language)
- [Authentication and Restricted Access](#authentication-and-restricted-access)
- [Further Information](#further-information)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Prerequisites

#### Ruby

Jekyll requires a recent **Ruby** installation. For **macOS**, it is recommended to use an installation different from the **Ruby** provided by Apple.

See [Jekyll on macOS](https://jekyllrb.com/docs/installation/macos/) for instructions and [Stackoverflow: You don't have write permissions for the /Library/Ruby/Gems/2.3.0 directory. (mac user)](https://stackoverflow.com/questions/51126403/you-dont-have-write-permissions-for-the-library-ruby-gems-2-3-0-directory-ma) if you'd like to have several **Ruby** versions installed in parallel.

For single version installation:

```sh
brew install ruby

# Register ruby and gem paths
echo 'export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH"' >> ~/.zshrc
```

#### Jekyll

Then install **bundler** and **jekyll** as described on then [Jekyll Homepage](https://jekyllrb.com/).

```sh
ruby --version

# Should be > 3 - otherwise see above
gem install bundler jekyll
bundle install
```

If you are on Ruby 3 with Jekyll 4.2.0, then an [issue with `webrick`](https://github.com/jekyll/jekyll/issues/8523) might hit you. To cure it, run

```sh
bundle add webrick
```

from inside the Jekyll site directory.

### Local Development

To watch your changes while editing:

```sh
bundle exec jekyll serve --livereload
```

### Troubleshooting

If you encounter an error like

```sh
$ bundle exec jekyll serve --livereload
/usr/local/opt/ruby/bin/bundle:23:in `load': cannot load such file -- /usr/local/lib/ruby/gems/3.0.0/gems/bundler-2.2.20/exe/bundle (LoadError)
        from /usr/local/opt/ruby/bin/bundle:23:in `<main>'
```

and

```sh
$ ruby -v     
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-darwin20]

$ ls -l /usr/local/lib/ruby/gems/3.0.0/gems/bundler-*
zsh: no matches found: /usr/local/lib/ruby/gems/3.0.0/gems/bundler-*
```

you need to re-install the bundler

```sh
$ gem install bundler
Fetching bundler-2.2.33.gem
Successfully installed bundler-2.2.33
Parsing documentation for bundler-2.2.33
Installing ri documentation for bundler-2.2.33
```

delete the `Gemfile.lock`

```sh
$ rm Gemfile.lock
```

and re-install your Ruby gems

```sh
$ bundle install
```

### Liquid Template Language

- [Liquid](https://shopify.github.io/liquid/) - Template language description at Shopify.
- [Liquid (Shopify) Cheat Sheet](https://www.shopify.com/partners/shopify-cheat-sheet)

### Authentication and Restricted Access

The [jekyll-auth](https://github.com/benbalter/jekyll-auth) module allows to restrict access. It uses GitHub OAuth and allows to manage user access via GitHub organizations and teams.

Note, that the [Getting Started](https://github.com/benbalter/jekyll-auth/blob/master/docs/getting-started.md) guide needs some further explanations. You can find the necessary details in my personal repository [wonderbird / experiment-with-jekyll-auth](https://github.com/wonderbird/experiment-with-jekyll-auth). I have commented an [issue for jekyll-auth](https://github.com/benbalter/jekyll-auth/issues/141#issuecomment-870213536) in this context.

### Further Information

- [Jekyll Homepage](https://jekyllrb.com/) - Getting started.
- [Jekyll Codex](https://jekyllcodex.org/)
