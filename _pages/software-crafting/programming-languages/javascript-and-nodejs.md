---
title: JavaScript and Node.js
layout: default
---
# JavaScript and NodeJS

## Installing Node.js

Maintaining your locally installed Node.js versions using the [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm) is recommended. The linked GitHub project page shows instructions to install nvm.

On Windows you can install `nvm` using [Chocolatey](https://community.chocolatey.org/packages/nvm).

The normal Node.js release cycle is 6 months. Even though the release cycle of the long term stable version of Node.js (LTS) is 30 months, I recommend keeping your projects compatible with a recent version of Node.js. Otherwise you may run into larger work when you want to upgrade from the old to the new LTS version.

## Configuring Node Projects

```sh
npm init
```

- [Creating a package.json file](https://docs.npmjs.com/creating-a-package-json-file)
- [package.json](https://docs.npmjs.com/cli/v8/configuring-npm/package-json) - Specifics of npm's package.json handling.

## Links

- [Node.js Releases](https://nodejs.org/en/about/releases/) - shows the release cycle of Node.js.
- [Node Version Manager](https://github.com/nvm-sh/nvm) - facilitates installing multiple versions of Node.js in parallel.
- GitHub: [wonderbird / nodejs-starter](https://github.com/wonderbird/nodejs-starter) - Template repository you can fork to start new projects.
- GitHub: [hojak / js-kata-base](https://github.com/hojak/js-kata-base) - Another template repository you can fork to start new projects.
- [Linting your TypeScript Codebase](https://typescript-eslint.io/docs/linting/)