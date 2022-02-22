---
title: Miscellaneous Git Topics
layout: default
---

## Miscellaneous Git Topics

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Getting Started](#getting-started)
- [Links](#links)
- [Transfer Uncommited Changes Via Patch File](#transfer-uncommited-changes-via-patch-file)
- [Merge With An Other Git Repository](#merge-with-an-other-git-repository)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Cheat Sheet

```sh
# Which files have changed after a special date?
# This is actually also the input format for code maat (https://github.com/adamtornhill/code-maat)
git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --after="2022-01-21 10:00"
```

## Getting Started

As an introduction I recommend chapters 1 (Overview, History), 2 (Basics) and 3 (Branching, Merging) of the [Pro Git Book](https://git-scm.com/book/en/v2).

## Writing Commit Messages

- [How to Write a Git Commit Message](https://cbea.ms/git-commit/)
- [Conventional Commits](conventional-commits.html)
- [Using Git Commit Message Templates to Write Better Commit Messages](https://gist.github.com/lisawolderiksen/a7b99d94c92c6671181611be1641c733)
- [Creating a commit with multiple authors](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)

## Transfer Uncommited Changes Via Patch File

If you don't want to use branches, merging and pull requests to bring changes over, then you can resort to patch files.

### Quick Solution

Assume you are in a branch A of your repository on machine A

```shell
# Export all unstaged changes to a file "some.patch"
git diff > some.patch
```

Then on machine B, check out the same branch A and

```shell
# Apply the patch to the other repository
git apply some.patch
```

### Special Cases

```shell
# Consider the staged files only
git diff --cached > some.patch

# Include binary files like .mp3 files
git diff --cached --binary > some.patch

# Consider both staged and unstaged files
git diff HEAD > some.patch
```

### References Regarding Patch File Transfer

- Stackoverflow: [Create a git patch from the uncommitted changes in the current working directory](https://stackoverflow.com/questions/5159185/create-a-git-patch-from-the-uncommitted-changes-in-the-current-working-directory?answertab=votes#tab-top)

## Merge With An Other Git Repository

Assume you have created a local git repository on your computer. Now you want to upload it to your favorite host. For this purpose you create a fresh repository at the remote.

Now you want to merge the new remote into your local repository and push everything back:

```shell
# The following command requires your local repository not to
# have an "origin" remote configured
git remote add origin https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

# Force to merge the unrelated histories
# Caveat: Only do this if you know that the remote is really
#         fitting to your current branch!
git pull origin main --allow-unrelated-histories

# Rename "master" to "main", if applicable
git branch -m main

# Push your local changes to the remote
git push --set-upstream origin main
git push
```

### References Regarding Merging With An Other Git Repository

- Github: [Merging an upstream repository into your fork](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/merging-an-upstream-repository-into-your-fork)

- Github: [Configuring a remote for a fork](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork)

- Stackoverflow: [Git refusing to merge unrelated histories on rebase
](https://stackoverflow.com/questions/37937984/git-refusing-to-merge-unrelated-histories-on-rebase)

- [Git rebase from remote fork repo](https://gist.github.com/ravibhure/a7e0918ff4937c9ea1c456698dcd58aa) - How to sync your fork (containing open pull requests).
