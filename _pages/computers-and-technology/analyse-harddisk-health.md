---
title: Analyse Hard Disk Health Using  SmartCTL (S.M.A.R.T.)
layout: default
---

## Analyse Hard Disk Health Using  SmartCTL (S.M.A.R.T.)

```bash
# The smartctl man page shows some examples for usage

# Dump all SMART information about the disk
smartctl --all /dev/sda

# Short self test (about 2 minutes)
smartctl -t short /dev/sda

# Dump the test results (some devices allow to monitor progress using this command)
smartctl -l selftest /dev/sda

# Monitor progress of the short self test
smartctl -c /dev/sda

# Extended test (see output of the --all command to learn how long it will take)
smartctl -t long /dev/sda
```

## References

* Thomas Krenn: [SMART Tests mit smartctl](https://www.thomas-krenn.com/de/wiki/SMART_Tests_mit_smartctl) (German)
* [Smartmontools](https://www.smartmontools.org/wiki/TocDoc)
