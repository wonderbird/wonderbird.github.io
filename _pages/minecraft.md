---
title: Minecraft
layout: default
---

# Minecraft

## Resources

* [Minecraft Wiki](https://minecraft.gamepedia.com/Minecraft_Wiki)
* [Feed the Beast Wiki](https://ftb.gamepedia.com/FTB_Wiki)

* [Let's Code Minecraft](https://games.jff.de/lets-code-minecraft/)
* [Computercraft Wiki](http://www.computercraft.info/wiki/Main_Page)
* [Computercraft for Minecraft 1.15 (CC Tweaked)](https://www.curseforge.com/minecraft/mc-mods/cc-tweaked)
* [Minecraft: Pi Edition (Raspberry Pi)](https://www.minecraft.net/en-us/edition/pi/)

## Minecraft Mod Programming

**Important**

Forge Mods are compiled using Java 8. Please make sure that the `JAVA_HOME` environment variable points to the correct directory before you run the `gradle` commands.

### Good Intros

* [Minecraft Forge: Getting Started](https://mcforge.readthedocs.io/en/1.15.x/gettingstarted/)<br />*Use this to download the empty examplemod and get it running*<br />

* suppergerrie2: [Forge tutorial (Documentation)](https://suppergerrie2.com/category/forge-tutorial/)<br />*After having an empty examplemod from above, read this to learn the basics*<br />

* suppergerrie2: [Forge tutorial (GitHub)](https://github.com/suppergerrie2/ForgeTutorial)<br />*Contains the source code for the tutorial above*<br />

* David Dodge: [The Ultimate Guide to Minecraft Modding with Java in 2020](https://codakid.com/guide-to-minecraft-modding-with-java/)<br />*Another tutorial based on an older Minecraft version*

* YouTube: [TechnoVision Forge Modding Tutorial 1.16](https://www.youtube.com/watch?v=JOTH1eDP99Y&list=PLDhiRTZ_vnoUI3-9z0Zg-I8tTSp3EfOia) and associated [GitHub Repository](https://github.com/TechnoVisionDev/Forge-Modding-Tutorial-1.16)<br />

I will sort this later ...
http://jabelarminecraft.blogspot.com
https://cubicoder.github.io
https://crafting.thedestruc7i0n.ca

### Advanced Topics

* [Mod Coders Pack](https://minecraft.gamepedia.com/Programs_and_editors/Mod_Coder_Pack)<br />*Helps decompiling the Minecraft Source Code*<br />

* Mojang, Microsoft, Tom Stone: [Programmers: Play with Minecraft's inner workings!](https://www.minecraft.net/en-us/article/programmers-play-minecrafts-inner-workings)<br />*Some Open Sourced Minecraft Game Libraries*<br />

## Minecraft Server

1. Configure the server according to the [Minecraft Wiki instructions](https://minecraft.gamepedia.com/Tutorials/Setting_up_a_server)

1.  If you want to use only a single Minecraft license on two different client computers, then

1.  Configure the server to be offline: [online-mode=false](https://gaming.stackexchange.com/a/351825) in `server.properties`

1. Change the `displayName` in the `minecraft/launcher_profiles.json` file of one of the users so that they have different display names

### Crossplay: Bedrock Edition und Java Edition

see: https://github.com/GeyserMC/Geyser/wiki/Setup

* How-To Geek: [How to Play Multiplayer LAN Games with a Single Minecraft Account](https://www.howtogeek.com/239649/how-to-play-multiplayer-lan-games-with-a-single-minecraft-account/)<br />*Explains how to connect to a personal Minecraft server in your local network from two computers if you have only one Minecraft license*
