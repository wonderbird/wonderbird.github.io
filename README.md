# Wonderbird's Homepage

## Build Instructions

### Prerequisites

Install the following tools once:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)<br>macOS users need to add ruby and the gem folder to the path as described during the installation with Homebrew.

Then execute the following commands in the working directory:

```sh
gem install bundler jekyll
bundle install
```

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

## References

An overview of Jekyll and all relevant references are collected on the sub-page [Generating Websites with Jekyll](_pages/computers-and-technology/jekyll.md).
