---
title: Forward X11 from Linux to macOS
layout: default
---
# Forward X11 from Linux to macOS

The following steps helped me forwarding the DISPLAY of a linux VM hosted in Azure to my local macBook:

1. Install XQuartz
1. Launch XQuartz and configure XQuartz &rarr; Security to allow remote connections
1. Restart XQuartz
1. If you don't want to reboot, then `export DISPLAY=localhost:0.0` in the terminal you'll use for connecting to the VM. Note, that after rebooting this is not neccessary any longer.
1. Connect to the remote: `ssh -X yourname@yourlinuxbox`
