---
title: Python
layout: default
---
# Python

## Installing Python on macOS

Note, that macOS comes with Python 2.7 pre-installed. If you are new to Python, I recommend using version 3 instead.

To install Python 3 on macOS the following steps are recommended:

1. Install [pyenv](https://github.com/pyenv/pyenv#installation)
1. The installation instructions end with installing a python version. Choose the [version number of the latest stable Python build](https://www.python.org/downloads/) here (at the time of writing this was version `3.9.6`).
1. Now you can switch the global python version to the installed one: `pyenv global 3.9.6`
1. Restart your shell and verify the `python --version`

**Remember:**

To re-activate the pre-installed python use `pyenv global system`

Please note that when using `pip` for installing Python applications, you may need to add `$HOME/.local/bin` to your `$PATH`.
