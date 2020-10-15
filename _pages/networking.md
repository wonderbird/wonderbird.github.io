# Networking - Some helpful commands

## Windows

### Find out which application owns a specific port

```
Get-Process -Id (Get-NetTCPConnection -LocalPort YourPortNumberHere).OwningProcess
```
