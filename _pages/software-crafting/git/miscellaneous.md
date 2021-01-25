---
title: Miscellaneous Git Topics
layout: default
---

# Miscellaneous Git Topics

## Merging An Other Git Repository

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

### References

* Github: [Merging an upstream repository into your fork](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/merging-an-upstream-repository-into-your-fork)

* Github: [Configuring a remote for a fork](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork)

* Stackoverflow: [Git refusing to merge unrelated histories on rebase
](https://stackoverflow.com/questions/37937984/git-refusing-to-merge-unrelated-histories-on-rebase)