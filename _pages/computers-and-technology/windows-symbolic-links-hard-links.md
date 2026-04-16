---
title: Hard Links and Symbolic Links on Windows
layout: default
---
# Junctions and Symbolic Links

From a practical aspect, symbolic links and junctions are similar.

Junctions only work for targets on local volumes but work for a normal user. Symbolic links are more flexible but require elevated privileges or Developer Mode.

To create a junction:

```shell
mklink /j "TARGET" "SOURCE"
```

To create a symbolic link to a directory

```shell
mklink /d "TARGET" "SOURCE"
```

Example: [wonderbird / ai-agent-workspace / scripts / create-skills-links-in-home-win.sh](https://github.com/wonderbird/ai-agent-workspace/blob/main/scripts/create-skills-links-in-home-win.sh)

# Hard Links and Symbolic Links on Windows

* Superuser.com: [How can I delete a symbolic link?](https://superuser.com/questions/167076/how-can-i-delete-a-symbolic-link)<br>*Also explains how to create a symbolic link and `mklink /d`*
* Microsoft: [Windows Developer / Win32 API / Hard Links and Junctions](https://docs.microsoft.com/en-us/windows/win32/fileio/hard-links-and-junctions)
* Microsoft: [Windows Developer / Win32 API / Creating Symbolic Links](https://docs.microsoft.com/en-us/windows/win32/fileio/creating-symbolic-links)
* Microsoft: [Windows Developer / Win32 API / CreateSymbolicLinkA function (winbase.h)](https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-createsymboliclinka)
