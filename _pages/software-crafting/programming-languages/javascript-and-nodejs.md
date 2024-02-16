---
title: JavaScript and Node.js
layout: default
---
## JavaScript and NodeJS

### Installing Node.js

Maintaining your locally installed Node.js versions using the [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm) is recommended. The linked GitHub project page shows instructions to install nvm. Further details on using nvm are documented in section [nvm Commands](#nvm-commands) below.

On Windows you can install `nvm` using [Chocolatey](https://community.chocolatey.org/packages/nvm).

The normal Node.js release cycle is 6 months. Even though the release cycle of the long term stable version of Node.js (LTS) is 30 months, I recommend keeping your projects compatible with a recent version of Node.js. Otherwise you may run into larger work when you want to upgrade from the old to the new LTS version.

### Configuring Node Projects

```sh
npm init
```

- [Creating a package.json file](https://docs.npmjs.com/creating-a-package-json-file)
- [package.json](https://docs.npmjs.com/cli/v8/configuring-npm/package-json) - Specifics of npm's package.json handling.

### nvm Commands

Usage examples and basic instructions are given on the [Github: nvm](https://github.com/nvm-sh/nvm) page.

#### Use a specific node version in the current shell

```shell
nvm use v18.19.1
```

#### Install or upgrade nvm

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
````

This will detect whether you are running ZSH and adapt.

The default installation directory is `$HOME/.nvm`. It can be overwritten by the environment variable `XDG_CONFIG_HOME`.

#### Upgrade Your Node.js Version(s)

```sh
# show currently available versions and installed versions in parentheses.
nvm ls

# show all versions available on the remote (many!)
nvm ls-remote

# show the version you are currently using
nvm current

# install a newer version
nvm install NEW_VERSION --reinstall-packages-from=OLD_VERSION

# e.g. to upgrade your LTS version
nvm install 'lts/*' --reinstall-packages-from="$(nvm current)"

# e.g. to upgrade your LATEST version
nvm install node --reinstall-packages-from=$(nvm current)

# remove the old version
nvm uninstall OLD_VERSION

# set the LTS version as default for all shells
nvm alias default 'lts/*'

# ... or set LATEST as default
nvm alias default 'node'
```

#### Upgrade global npm packages

```shell
# show global packages requiring update
npm outdated -g --depth=0

# Updating a single global package
npm update -g <package_name>

# Updating all globally-installed packages
npm update -g
```

from E. Thomson und L. Karrys, „Updating packages downloaded from the registry | npm Docs“. Zugegriffen: 1. Dezember 2023. [Online]. Available at: [https://docs.npmjs.com/updating-packages-downloaded-from-the-registry](https://docs.npmjs.com/updating-packages-downloaded-from-the-registry)

### Links

- [Node.js Releases](https://nodejs.org/en/about/releases/) - shows the release cycle of Node.js.
- [Node Version Manager](https://github.com/nvm-sh/nvm) - facilitates installing multiple versions of Node.js in parallel.
- GitHub: [wonderbird / nodejs-starter](https://github.com/wonderbird/nodejs-starter) - Template repository you can fork to start new projects.
- GitHub: [hojak / js-kata-base](https://github.com/hojak/js-kata-base) - Another template repository you can fork to start new projects.
- [Linting your TypeScript Codebase](https://typescript-eslint.io/docs/linting/)