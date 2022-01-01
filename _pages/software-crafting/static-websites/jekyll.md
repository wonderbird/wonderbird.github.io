---
title: Jekyll
layout: default
---
## Generating Websites with Jekyll

### Prerequisites

#### Ruby

Jekyll requires a recent **Ruby** installation. For **macOS**, it is recommended to use an installation different from the **Ruby** provided by Apple. See [Jekyll on macOS](https://jekyllrb.com/docs/installation/macos/) for instructions and [Stackoverflow: You don't have write permissions for the /Library/Ruby/Gems/2.3.0 directory. (mac user)](https://stackoverflow.com/questions/51126403/you-dont-have-write-permissions-for-the-library-ruby-gems-2-3-0-directory-ma) if you'd like to have several **Ruby** versions installed in parallel.

#### Jekyll

Then install **bundler** and **jekyll** as described on then [Jekyll Homepage](https://jekyllrb.com/).

If you are on Ruby 3 with Jekyll 4.2.0, then an [issue with `webrick`](https://github.com/jekyll/jekyll/issues/8523) might hit you. To cure it, run

```sh
bundle add webrick
```

from inside the Jekyll site directory.

#### Authentication and Restricted Access

The [jekyll-auth](https://github.com/benbalter/jekyll-auth) module allows to restrict access. It uses GitHub OAuth and allows to manage user access via GitHub organizations and teams.

Note, that the [Getting Started](https://github.com/benbalter/jekyll-auth/blob/master/docs/getting-started.md) guide needs some further explanations. You can find the necessary details in my personal repository [wonderbird / experiment-with-jekyll-auth](https://github.com/wonderbird/experiment-with-jekyll-auth). I have commented an [issue for jekyll-auth](https://github.com/benbalter/jekyll-auth/issues/141#issuecomment-870213536) in this context.

### Further Information

- [Jekyll Homepage](https://jekyllrb.com/) - Getting started.
- [Jekyll Codex](https://jekyllcodex.org/)
