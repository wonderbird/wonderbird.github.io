---
title: VPN Connection to Synology DS218+
layout: default
---
# VPN Connection to Synology DS218+

## Lessons learned

* If you have a DS-Lite tunnel, then L2TP / IPSec does not work. Below you can find instructions for later, when mobile networks provide IPv6.
* Though the VPN connection works for macOS, it does not work on iOS (iPad) using `OpenVPN Connect` (this information may be obsolete, it is dated December 2018)

## Install OpenVPN and get the OpenVPN configuration file

1. Install the VPN server with OpenVPN following the instructions (see [Set up VPN Server](https://kb.synology.com/en-us/DSM/help/VPNCenter/vpn_setup?version=6)).

   1. Activate the option **[x] Clients den Server-LAN-Zugriff erlauben**<br>_This will allow accessing the local network behind the VPN server_

1. Ensure that the user of the VPN server of the NAS has the user right to use OpenVPN. I have created a user named `Vpn` for that purpose and stored the password in my password safe. Note that the first letter must be capitalized on macOS.

1. Download the OpenVPN configuration from the server using **Konfigurationsdateien exportieren** and unzip the `openvpn.zip` file.

1. (optional): Rename the `VPNconfig.ovpn` to `BoosRoesrath.ovpn` (corresponds to the identifier I want to see in Tunnelblick)

1. Edit the `*.ovpn` file and replace the word `YOUR_SERVER_IP` by the (dynamic) DNS address of your NAS (for me this is `myhostname.synology.me`)

## VPN Client for macOS

1. Install [Tunnelblick](https://tunnelblick.net/downloads.html)

1. Import the configuration file into Tunnelblick

1. Connect

  1. Connecting works using LTE via T-Mobile
  1. As of July 9, 2021 Vodafone seemed not to support IPv6. The IPv4 address of my dynamic DNS server was shown in the connection logs.

## VPN Client for iPad and iPhone

1. Install [OpenVPN Connect App for iOS](https://itunes.apple.com/de/app/openvpn-connect/id590379981?mt=8)

1. Connect the device to your computer (iTunes or Finder) and locate the app ~OpenVPN Connect in `Dateifreigabe` (`File share`?)

1. Drag and drop the configuration file `BoosRoesrath.ovpn` into that pane of iTunes

1. After you have disconnected iTunes you can connect to your OpenVPN

**Note:**

If the connection cannot be established, then try rebooting the iPad.

## References

* Synology: [Set up VPN Server](https://kb.synology.com/en-us/DSM/help/VPNCenter/vpn_setup?version=6), last visited July 9, 2021

* [Tunnelblick UI for OpenVPN on Mac OS](https://tunnelblick.net/index.html), zuletzt aufgerufen am 27.12.2018<br><br>

* Chip: [OpenVPN unter iOS einrichten - so geht's](https://praxistipps.chip.de/openvpn-unter-ios-einrichten-so-gehts_50891), zuletzt aufgerufen am 27.12.2018<br><br>

### L2TP / IPSec

* [Pritunl Open Source ~OpenVPN Client](https://client.pritunl.com/), zuletzt aufgerufen am 27.12.2018<br><br>

* Chip: [VPN auf dem iPad einrichten](https://praxistipps.chip.de/vpn-auf-dem-ipad-einrichten_33384), zuletzt aufgerufen am 26.12.2018<br><br>

* Feste IP.net: [DS-Lite IPv6 Geräte im Heimnetz erreichbar machen !](http://www.feste-ip.net/dslite-ipv6-portmapper/allgemeine-informationen/), zuletzt aufgerufen am 27.12.2018<br><br>

* Datamate: [Zugriff ins LAN trotz IPv6 und Dual Stack Lite](https://www.datamate.org/zugriff-ins-lan-trotz-ipv6-und-dual-stack-lite/), zuletzt aufgerufen am 27.12.2018<br><br>

* Apple: [Informationen zu VPN-Protokollen für iPhone, iPad und iPod touch](https://support.apple.com/de-de/HT201533), zuletzt aufgerufen am 27.12.2018