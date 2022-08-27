---
title: Lego
layout: default
---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Lego Models](#lego-models)
- [Lego Mindstorms](#lego-mindstorms)
  - [Books](#books)
  - [Alternative Operating Systems and Programming Environments for Lego Mindstorms EV3](#alternative-operating-systems-and-programming-environments-for-lego-mindstorms-ev3)
    - [Open Roberta supports different Platforms](#open-roberta-supports-different-platforms)
    - [leJOS LEGO Java Operating System (and Open Roberta)](#lejos-lego-java-operating-system-and-open-roberta)
    - [Preparing ev3dev for Python Programming](#preparing-ev3dev-for-python-programming)
    - [Ev3 Simulators](#ev3-simulators)
  - [Further links](#further-links)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Lego Models

* [Brick Link](https://www.bricklink.com/v2/main.page)
* [Great Ball Contraption (GBC)](https://www.greatballcontraption.com/) - A machine which receives soccer balls or basketballs from one module and passes them to another module, rather like a bucket brigade.
* [Held der Steine](https://www.held-der-steine.de/) - Informationen, Modelle, Rezensionen, Shop.
* [MOCs Market](https://www.mocsmarket.com/) - Break the monotony with the most amazing LEGO® instructions.
* [The Unofficial LEGO Technic Builder’s Guide](http://amzn.to/2s6vGKf) by Pawel "Sariel" Kmiec

## Lego Mindstorms

### Books

[Christoph Bartneck schreibt](http://www.bartneck.de/2017/06/04/tutorial-on-how-to-install-and-run-java-on-lego-mindstorms-ev3-using-eclipse-on-mac-os-x/):

You might want to dive much deeper into Java development for the EV3. These books might be useful for you:

* [Maximum LEGO EV3: Building Robots with Java Brains](http://amzn.to/2rSuomm) by Brian Bagnall
* [Beginning Robotics Programming in Java with LEGO Mindstorms](http://amzn.to/2rpniUT) by Wei Lu

### Alternative Operating Systems and Programming Environments for Lego Mindstorms EV3

#### Open Roberta supports different Platforms

* [Roberta Initiative](https://www.roberta-home.de)
* [Open Roberta Lab](https://www.roberta-home.de/lab/)
* [Open Roberta Wiki: Programmieren (German)](https://jira.iais.fraunhofer.de/wiki/pages/viewpage.action?pageId=92341373)
  * [Buch: Roberta - EV3 Programmieren mit Java](https://www.roberta-home.de/fileadmin/user_upload/WebBooks/JavaBand/RobertaBuch.html#RobertaBuchch12.html)

#### leJOS LEGO Java Operating System (and Open Roberta)

Installation Instructions (as of May 2020)

1. If starting from scratch, ''Follow the instructions'' by Christoph Bartneck: [Tutorial on how to install and run Java on Lego Mindstorms EV3 using Eclipse on Mac OS X](http://www.bartneck.de/2017/06/04/tutorial-on-how-to-install-and-run-java-on-lego-mindstorms-ev3-using-eclipse-on-mac-os-x/) **but** install **OpenRoberta** onto the SD Card (see step 3)

1. Next try out the debugger: [Developing with leJOS](https://sourceforge.net/p/lejos/wiki/Developing%20with%20leJOS/)

1. Now switch to Open Roberta: [Instructions for Open Roberta leJOS Connection](https://jira.iais.fraunhofer.de/wiki/display/ORInfo/Vorbereitung+EV3+-+System+leJOS+0.9.1)

1. Use the WLAN dongle to connect

##### Further information

* [http://www.lejos.org](http://www.lejos.org)
* [leJOS API Documentation (lejos.org)](http://www.lejos.org/ev3/docs/)
* [leJOS API Documentation with Examples (ev3dev-lang-java)](https://ev3dev-lang-java.github.io/#/)
* [leJOS Wiki](https://sourceforge.net/p/lejos/wiki/Home/)

#### Preparing ev3dev for Python Programming

1. Follow the instructions on [EV3dev.org](https://www.ev3dev.org/]] to install Debian on the brick<br/>Attention: Use [balena Etcher](https://etcher.io/) with **native Windows**. Neither the macOS version nor the Windows version running with Parallels did flash my sd card (May 2020).<br><br>

1. Clone [vscode-hello-python](https://github.com/ev3dev/vscode-hello-python) and follow the **Step-by-Step** instructions in the README.md<br>This will help you install the following Visual Studio Code extensions:
   1. [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
   1. [EditorConfig for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
   1. [ev3dev browser for Visual Studio Code](https://github.com/ev3dev/vscode-ev3dev-browser)
   1. [Setup Instructions on a running ev3dev environment](https://github.com/OpenRoberta/robertalab-ev3dev/blob/develop/README.md)

##### Python Reference

* Overview, Getting Started and FAQ: [Python language bindings for ev3dev](https://python-ev3dev.readthedocs.io/en/ev3dev-stretch/index.html)
  * Jump to the [Library documentation](https://python-ev3dev.readthedocs.io/en/ev3dev-stretch/#library-documentation)

##### Connect two LEGO Bricks

Not yet tried out. Sorted by promising approach probability:

* [Sending and Receiving Messages with MQTT](https://www.ev3dev.org/docs/tutorials/sending-and-receiving-messages-with-mqtt/) (requires TCP/IP networking)
  * leJOS variant: [leJOS News: Publishing data to MQTT](https://lejosnews.wordpress.com/2015/11/16/publishing-data-to-mqtt/)
* [RPyC on ev3dev](https://ev3dev-lang.readthedocs.io/projects/python-ev3dev/en/stable/rpyc.html) (supports bluetooth connections)
* [Discussion on Stack Exchange](https://bricks.stackexchange.com/questions/8888/how-to-connect-two-lego-bricks-ev3-by-usb-using-python)

##### Getting Help

* From the ev3dev browser extension, select "Open user guide and examples"
* Getting started: [ev3dev-lang-python on GitHub](https://github.com/ev3dev/ev3dev-lang-python)

#### Ev3 Simulators

* [A Posteriori - EV3DEV Python SImulator](https://www.aposteriori.com.sg/Ev3devSim/index.html)
* [Open Roberta Simulator](https://lab.open-roberta.org/)
* [ev3dev2 Simulator](https://github.com/ev3dev-python-tools/ev3dev2simulator)

### Further links

* [EV3 MicroPython](file:///Users/stefan/.vscode/extensions/lego-education.ev3-micropython-1.0.3/resources/docs/startinstall.html)
* [Setting up VS Code](https://sites.google.com/site/ev3python/setting-up-vs-code)
