---
title: Networking - Some helpful commands
layout: default
---

# Networking - Some helpful commands

## Windows

### Find out which application owns a specific port

```powershell
Get-Process -Id (Get-NetTCPConnection -LocalPort YourPortNumberHere).OwningProcess
```
