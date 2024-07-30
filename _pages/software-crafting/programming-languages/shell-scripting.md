---
title: Shell Scripting
layout: default
---
# Shell Scripting

For shell scripts executed in CI/CD pipelines or other production relevant environments, use

```sh
#!/bin/sh
set -Eeuxfo pipefail
```

- `-E` ensures that the ERR trap is fired correctly if the -e parameter is present [[eyckSaferBashScripts2018]]
- `-e` exits immediately when a command fails [[eyckSaferBashScripts2018]]
- `-u` treat unset variables as error [[eyckSaferBashScripts2018]]
- `-x` print every command before executing it [[eyckSaferBashScripts2018]]
- `-f` disables file name globbing (expansion of `*, ?, etc.` ) [[mitsipbSafeShellScripts2019]]
- `-o pipefail` exits if any command of a pipeline failed. Without this option only the last command of a pipeline is checked. [[eyckSaferBashScripts2018]]

For detailed explanation and other tips regarding safe shell scripts, refer to

- [Safer bash scripts with 'set -euxo pipefail'](https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/) - v[[eyckSaferBashScripts2018]]
- [Writing Safe Shell Scripts](https://sipb.mit.edu/doc/safe-shell/) - [[mitsipbSafeShellScripts2019]]
- Philipp Weissmann: [Skripte schöner abbrechen](https://philipp-weissmann.de/skripte-schoener-abbrechen/) (in German)
