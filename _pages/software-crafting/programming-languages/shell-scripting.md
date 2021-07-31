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

For detailed explanation and other tips regarding safe shell scripts, refer to

- Tom van Eyck: [Safer bash scripts with 'set -euxo pipefail'](https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/)
- MIT Student Information Processing Board: [Writing Safe Shell Scripts](https://sipb.mit.edu/doc/safe-shell/)
- Philipp Weissmann: [Skripte schöner abbrechen](https://philipp-weissmann.de/tag/pipefail/) (in German)
