---
title: Visual Logs
layout: default
---
# Visual Log or Graphic Logs for the Command Line

Git visual log displays commit tree view with who did what when and in which branch

```
# all commits
$ git vlog

# last 6 commits
$ git vlog -n 6
```

## With light console background

```
git config --global alias.vlog 'log --graph --date-order --date=relative --pretty=format:"%C(cyan)%h: %Cblue - %an - %Cgreen%d - %C(cyan)%ar:%Creset%n%s%n" --color'
```

## With dark console background

```
git config --global alias.vlog 'log --graph --date-order --date=relative --pretty=format:"%C(white)%h: %Cgreen - %an - %Cred%d – %C(cyan)%ar:%Creset%n%s%n" --color'
```

## See also

* https://gist.github.com/asabaylus/1468122