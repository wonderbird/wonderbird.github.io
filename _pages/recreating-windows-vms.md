# Setting up Virtual Machines Rapidly with Chocolatey

## Rationale

As a Mac user I have a Parallels virtual machine for my Windows applications. Every now and then the machine has accumulated so many applications I install for test purposes, that it consumes a large amount of disk space, is slow and the software is outdated. Thus, I destroy the machine regularly and set it up from scratch. In this, the [Chocolatey](https://www.chocolatey.org) package manager comes in as a great helper. It streamlines the re-installation of my virtual machine.

## Recreate a Windows VM

The following shows my steps for recreating virtual Windows machines:

1. From my current instance export all Chocolatey packages (see below)

1. Remove all the packages from the exported list, which you don't need any longer

1. Install the base Windows system from CD (or restore it from a backup)

1. Install Parallels Tools and activate the shared clipboard

1. Install Chocolatey

1. Install the Chocolatey packages you have exported previously

1. Update all install Chocolatey packages

## Export Installed Chocolatey Packages

Follow the instructions Ammaar Limbada has published on GitHub: [alimbada / ExportChocolatey.ps1](https://gist.github.com/alimbada/449ddf65b4ef9752eff3)

```
#Put this in Export-Chocolatey.ps1 file and run it:
#.\Export-Chocolatey.ps1 > packages.config
#You can install the packages using
#choco install packages.config -y

Write-Output "<?xml version=`"1.0`" encoding=`"utf-8`"?>"
Write-Output "<packages>"
choco list -lo -r -y | % { "   <package id=`"$($_.SubString(0, $_.IndexOf("|")))`" version=`"$($_.SubString($_.IndexOf("|") + 1))`" />" }
Write-Output "</packages>"
```
