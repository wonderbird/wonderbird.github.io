---
title: Setting up Virtual Machines Rapidly with Chocolatey
layout: default
---

# Setting up Virtual Machines Rapidly with Chocolatey

## Rationale

As a Mac user I have a Parallels virtual machine for my Windows applications. Every now and then the machine has accumulated so many applications I install for test purposes, that it consumes a large amount of disk space, is slow and the software is outdated. Thus, I destroy the machine regularly and set it up from scratch. In this, the [Chocolatey](https://www.chocolatey.org) package manager comes in as a great helper. It streamlines the re-installation of my virtual machine.

## Recreate a Windows VM

The following shows my steps for recreating virtual Windows machines:

### Save the Current State

From your current VM instance ...

1. Export all Chocolatey packages (see below)

1. Export the list of all Plugins you have installed for your development environments

1. Remove all the packages from the exported lists, which you don't need any longer

**Note:**¥

At the moment I do not save Application Settings

### Setting Up the VM From Scratch

1. Install the base Windows system from CD (or restore it from a backup)

1. Install all pending Windows Updates

1. Install Parallels Tools and activate the shared clipboard

1. Install Chocolatey

1. Install the Chocolatey packages you have exported previously: `choco install packages.config -y`

1. Update all install Chocolatey packages: `choco upgrade all`

1. Cleanup: `cleanmgr`

### Finetuning

1. For Docker-Desktop the Windows Subsystem for Linux is required

## Appendix

### Export Installed Chocolatey Packages

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

### Interesting Visual Studio Plugins

* Resharper - installed via Chocolatey
* [SpecFlow](https://specflow.org/)
* [CodeMetrics](https://marketplace.visualstudio.com/items?itemName=Elisha.CodeMetrices)
