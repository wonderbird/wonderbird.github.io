---
title: Git
layout: default
---
# Git

## Table of Contents

* <a href="#visual-logs">Visual Log or Graphic Logs for the Command Line</a>
* <a href="#lost-commits">Restoring Lost Commits</a>

## Visual Log or Graphic Logs for the Command Line

Git visual log displays commit tree view with who did what when and in which branch

```
# all commits
$ git vlog

# last 6 commits
$ git vlog -n 6
```

### With light console background

```
git config --global alias.vlog 'log --graph --date-order --date=relative --pretty=format:"%C(cyan)%h: %Cblue - %an - %Cgreen%d - %C(cyan)%ar:%Creset%n%s%n" --color'
```

### With dark console background

```
git config --global alias.vlog 'log --graph --date-order --date=relative --pretty=format:"%C(white)%h: %Cgreen - %an - %Cred%d – %C(cyan)%ar:%Creset%n%s%n" --color'
```

### See also

* https://gist.github.com/asabaylus/1468122

<a name="lost-commits"></a>

## Restoring Lost Commits

copied from [git ready: restoring lost commits](http://gitready.com/advanced/2009/01/17/restoring-lost-commits.html)

So, you just did a `git reset --hard HEAD^` and threw out your last commit. Well, it turns out you really did need those changes. You’ll never be able to implement that algorithm that perfectly twice, so you need it back. Don’t fear, git should still have your commit. When you do a reset, the commit you threw out goes to a “dangling” state. It’s still in git’s datastore, waiting for the next garbage collection to clean it up. So unless you’ve ran a `git gc` since you tossed it, you should be in the clear to restore it.
For these examples, I’m working with the code for this blog. From the top, we just ran:

```
$ git show-ref -h HEAD
  7c61179cbe51c050c5520b4399f7b14eec943754 HEAD

$ git reset --hard HEAD^
  HEAD is now at 39ba87b Fixing about and submit pages so they don't look stupid

$ git show-ref -h HEAD
  39ba87bf28b5bb223feffafb59638f6f46908cac HEAD
```

So our `HEAD` has been backed up by one commit. At this point if we wanted it back we could just `git pull`, but we’re assuming that only our local repository knows about the commit. We need the SHA1 of the commit so we can bring it back. We can prove that git knows about the commit still with the `fsck` command:

```
$ git fsck --lost-found
  [... some blobs omitted ...]
  dangling commit 7c61179cbe51c050c5520b4399f7b14eec943754
```

You can also see the that git knows about the commit still by using the `reflog` command:

```
$ git reflog
  39ba87b... HEAD@{0}: HEAD~1: updating HEAD
  7c61179... HEAD@{1}: pull origin master: Fast forward
  [... lots of other refs ...]
```

So, we now have our SHA1: `7c61179`. If we want to get immediately apply it back onto our current branch, doing a `git merge` will recover the commit:

```
$ git merge 7c61179
  Updating 39ba87b..7c61179
  Fast forward
    css/screen.css |    4 ++++
    submit.html    |    4 ++--
    2 files changed, 6 insertions(+), 2 deletions(-)
```

This command will bring your lost changes back and make sure that `HEAD` is pointing at the commit. From here you can continue to work as normal! You could also checkout the SHA1 into a new branch, but really a merge is the fastest and easiest way to restore that lost commit once you have the hash.

### References

* [git: Reset Demystified](https://git-scm.com/blog/2011/07/11/reset.html)