---
title: Python
layout: default
---
## Python

<!-- doctoc --maxlevel 4 $HOME/source/wonderbird/wonderbird.github.io/_pages/software-crafting/programming-languages/python.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Links](#links)
- [Installing Python on macOS](#installing-python-on-macos)
- [Pyenv Commands](#pyenv-commands)
- [Style Guides](#style-guides)
  - [Documenting Python Code](#documenting-python-code)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Communities

- [PyData](https://pydata.org/) - A community for developers and users of open source data tools.
- [Python User Group Austria](https://www.meetup.com/de-DE/PYUGAT/)

### Links

- [pytest](https://docs.pytest.org/) - newer unit testing framework.

- [unittest](https://docs.python.org/3/library/unittest.html) - unit testing framework.

- [Structuring Your Project](https://docs.python-guide.org/writing/structure/) - suggested Python 3 project structure.

- [Implementing an Interface in Python](https://realpython.com/python-interface/) - informal and formal interfaces and abstract base classes.

- [Data Classes](https://docs.python.org/3/library/dataclasses.html) - mutable named tuples with default values.

- [PEP 8 -- Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/) - Python code style recommendations.

- [Python Developer’s Guide](https://devguide.python.org/) - The guide for developers **of** Python.

### Installing Python on macOS

Note, that macOS comes with Python 2.7 pre-installed. If you are new to Python, I recommend using version 3 instead.

Further note, that I am managing my python installations using [pyenv](https://github.com/pyenv/pyenv) and I am
developing code using [JetBrains PyCharm](https://www.jetbrains.com/de-de/pycharm/). This combination leads to
using `pyenv` in parallel with the Python built in [venv](https://docs.python.org/3/library/venv.html) ...
and looks strange to me. Probably I'll find a better solution later.

To install Python 3 on macOS the following steps are recommended:

1. Install [pyenv](https://github.com/pyenv/pyenv#installation)
   - Follow the instructions in [Homebrew in macOS](https://github.com/pyenv/pyenv#homebrew-in-macos)
   - Pay special attention to the [verification step](https://github.com/pyenv/pyenv/wiki#how-to-verify-that-i-have-set-up-pyenv-correctly) of [Build Environment einrichten](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)

1. The installation instructions end with installing a python version. Choose the [version number of the latest stable Python build](https://www.python.org/downloads/) here (at the time of writing this was version `3.12`): `pyenv install 3.12.1`.

1. Now you can switch the global python version to the installed one: `pyenv global 3.12.1`

1. Restart your shell and verify the `python --version`

**Remember:**

To re-activate the pre-installed python use `pyenv global system`

Please note that when using `pip` for installing Python applications, you may need to add `$HOME/.local/bin` to your `$PATH`.

### Display the Current venv in Command Prompt

I am using Oh my ZSH with the Powerlevel9k theme. This allows printing the current venv as a part of the command prompt:

![Python Environment on the Right of Command Prompt](/assets/img/python-venv-command-prompt.png)

To set this up, do this in your `~/.zshrc` (adopted from [Stackoverflow](https://stackoverflow.com/a/47016995)):

```text
plugins=(virtualenv)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)
```

Caveats:

1. Add that plugin in addition to other plugins you have.
2. Requires the POWERLEVEL9K theme

### Pyenv Commands

... are described in the [Command Reference](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md).

```shell
# list currently installed versions
pyenv versions

# list common 2.x versions available (excludes other vendors)
pyenv install -l | grep '^\s*2\.' | sort -g

# activate a python version globally
pyenv global 3.10.3
```

### Style Guides

- [PEP 8 - Style Guide for Python Code](https://peps.python.org/pep-0008/)
- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)

#### Documenting Python Code

- [Python Developer's Guide: Documenting Python](https://devguide.python.org/documenting/)
- [PEP 257 - Docstring Conventions](https://peps.python.org/pep-0257/)

- [JetBrains PyCharm Guide: Documenting Code](https://www.jetbrains.com/pycharm/guide/tutorials/sphinx_sites/documentation/)
- [Google Python Styleguide: Docstrings](https://google.github.io/styleguide/pyguide.html#s3.8-comments-and-docstrings)
- [numpy Styleguide: Docstring Standard](https://numpydoc.readthedocs.io/en/latest/format.html#docstring-standard)
- [sphinx.ext.napoleon: Support for NumPy and Google style docstrings](https://www.sphinx-doc.org/en/master/usage/extensions/napoleon.html)

### Interesting Packages

- GitHub: [JulienPalard / Pipe](https://github.com/JulienPalard/Pipe) - Pipelines / stream processing for python.
- [Monkeypatching/mocking modules and environments](https://docs.pytest.org/en/6.2.x/monkeypatch.html) - safely set/delete an attribute, dictionary item or environment variable, or to modify sys.path for importing.

### Creating Packages

- Rogier van der Geer: [A Practical Guide to Setuptools and Pyproject.toml](https://godatadriven.com/blog/a-practical-guide-to-setuptools-and-pyproject-toml/) - The "new" way of setting up python projects.
- Rogier van der Geer: [A Practical Guide to Using Setup.py](https://godatadriven.com/blog/a-practical-guide-to-using-setup-py/) - An older way of setting up python projects.
