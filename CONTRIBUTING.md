# Contributing

Guide for developers who just cloned this repo and want to preview the Jekyll site locally.

## Prerequisites

- Ruby (tested with 3.2.3)
- Bundler

Check if Bundler is installed:

```bash
bundle -v
```

If missing:

```bash
gem install bundler --user-install
```

If using a Ruby version manager (rbenv, rvm, asdf, chruby), its shim directory is already on `PATH` and you can skip the rest of this step.

Otherwise, if `gem install --user-install` puts executables outside your `PATH` (e.g. `bundle: command not found`), find the bin directory it printed (or run `gem environment` and look at `EXECUTABLE DIRECTORY`) and add it to your shell profile (`~/.bashrc` or `~/.bash_profile`), for example:

```bash
export PATH="$PATH:<executable-directory-from-gem-environment>"
```

Place this line **above** any "if not running interactively, don't do anything" early-return guard in `~/.bashrc`, otherwise it won't take effect for non-interactive shells (scripts, `bash -lc`, CI).

You also need a C compiler and build tools to compile native gem extensions (e.g. `bigdecimal`):

```bash
sudo apt-get install -y build-essential   # Debian/Ubuntu
sudo dnf groupinstall "Development Tools" # Fedora/RHEL
sudo pacman -S base-devel                 # Arch
xcode-select --install                    # macOS
```

## Install dependencies

From the repo root:

```bash
bundle config set --local path 'vendor/bundle'
bundle install
```

`vendor/bundle` is already gitignored, so this keeps gems local to the repo without touching system gem directories.

## Run the live preview (with auto-update)

```bash
bundle exec jekyll serve --livereload
```

- Site: http://localhost:4000/
- `--livereload` injects a script that auto-refreshes the browser when you edit source files, so you don't need to manually restart the server or reload the page.
- Auto-regeneration of the site on file changes is enabled by default; `--livereload` adds the browser auto-refresh on top of that.

Stop the server with `Ctrl-C`.

## Updating dependencies

Update all gems to the latest versions allowed by `Gemfile`:

```bash
bundle update
```

This rewrites `Gemfile.lock` with the new resolved versions. After updating:

```bash
bundle exec jekyll build
```

to confirm the site still builds. If it does, commit the updated `Gemfile.lock`. If it breaks, either fix the incompatibility or revert with `git checkout -- Gemfile.lock` and update gems one at a time (`bundle update <gem-name>`) to isolate the offending one.

To check what's outdated without updating:

```bash
bundle outdated
```

## Troubleshooting

- **`bundle: command not found`** — Bundler installed but not on `PATH`. See the Prerequisites section above.
- **Native extension build fails (e.g. `bigdecimal`)** — install `build-essential` (see Prerequisites).
- **Port 4000 already in use** — pass a different port: `bundle exec jekyll serve --livereload --port 4001`.
- **First `bundle` command hangs or fails with no network** — Bundler auto-detects the `BUNDLED WITH` version in `Gemfile.lock` and transparently installs/re-execs that exact version if it differs from the one you have. This needs network access to rubygems.org on first run, even if you already installed a different Bundler version yourself.
