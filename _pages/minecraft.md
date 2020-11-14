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

### Tools Simplifying Mod Development

* [Crafting recipe generator for Minecraft Java and Bedrock](https://crafting.thedestruc7i0n.ca)
* [Advancements generator for Minecraft](https://advancements.thedestruc7i0n.ca/)

### Other Tutorial Pages ...

... which I have encountered while creating my first mods. I have not read them in depth but I use them as a reference.

* [Jabelar's Minecraft Forge Modding Tutorials](http://jabelarminecraft.blogspot.com)
* [Cubicoder's Minecraft Forge Tutorials](https://cubicoder.github.io)

### Advanced Topics

* [bedrock.dev](https://bedrock.dev/)<br />*How to mod the Minecraft Bedrock Edition*<br />

* [Mod Coders Pack](https://minecraft.gamepedia.com/Programs_and_editors/Mod_Coder_Pack)<br />*Helps decompiling the Minecraft Source Code*<br />

* Mojang, Microsoft, Tom Stone: [Programmers: Play with Minecraft's inner workings!](https://www.minecraft.net/en-us/article/programmers-play-minecrafts-inner-workings)<br />*Some Open Sourced Minecraft Game Libraries*<br />

## Minecraft Server

### Local Setup Using The Server

1. I recommend using the SpigotMC server

1. Configure the server according to the [Minecraft Wiki instructions](https://minecraft.gamepedia.com/Tutorials/Setting_up_a_server)

1.  If you want to use only a single Minecraft license on two different client computers, then

1.  Configure the server to be offline: [online-mode=false](https://gaming.stackexchange.com/a/351825) in `server.properties`

1. Change the `displayName` in the `minecraft/launcher_profiles.json` file of one of the users so that they have different display names (see How-To Geek: [How to Play Multiplayer LAN Games with a Single Minecraft Account](https://www.howtogeek.com/239649/how-to-play-multiplayer-lan-games-with-a-single-minecraft-account/)<br />*Explains how to connect to a personal Minecraft server in your local network from two computers if you have only one Minecraft license*)

### Hosting a Server On Docker in the Cloud

* Guillaume Tardif: [Deploying a Minecraft Docker Server to the cloud](https://www.docker.com/blog/deploying-a-minecraft-docker-server-to-the-cloud/)<br />*How to host a Minecraft Server on Azure*<br />

* Geoff Bourne on GitHub: [itzg/docker-minecraft-server](https://github.com/itzg/docker-minecraft-server)<br />*Docker image of a minecraft server*

* Minecraft Wiki: [server.properties](https://minecraft.gamepedia.com/Server.properties)<br />*Description of the parameters configured in the `server.properties`*

* [The RCON protocol for Minecraft Remote Control](https://wiki.vg/RCON)<br />*The protocol description Wiki*

* Michael Chiang: [Setting Up a Minecraft Server Using Docker – Part 1](https://www.docker.com/blog/minecraft-server-docker-1/)<br />*An older description of how to host a Minecraft Server on Azure*<br />

### Backing Up Your Server Data

* Microsoft: [Introducing backup for Azure file shares](https://azure.microsoft.com/de-de/blog/introducing-backup-for-azure-file-shares/)

### Extending Your Minecraft Server

* [SpigotMC](https://www.spigotmc.org/wiki/about-spigot/)<br />*The leading community for Minecraft server owners and content creators.*<br />

#### BungeeCord: Switch From Server To Server

* SpigotMC Wiki: [BungeeCord](https://www.spigotmc.org/wiki/bungeecord/)<br />*Proxy between the player's client and the connected Minecraft servers*<br />

* SpigotMC: [BungeeCord Disucssion Thread](https://www.spigotmc.org/threads/1-8-1-15-bungeecord.392/)<br />*Help and information on BungeeCord*<br />

* Geoff Bourne on GitHub: [itzg/docker-bungeecord](https://github.com/itzg/docker-bungeecord)<br />*Docker image of Docker image of BungeeCord*

* SpigotMC on Github: [Spigot/BungeeCord](https://github.com/SpigotMC/BungeeCord)<br />*The BungeeCord source code repository*<br />

#### Portals From Server to Server

* SpigotMC: [Advanced Portals](https://www.spigotmc.org/resources/advanced-portals.14356/)<br />*Create portals to send you to places inside and outside your server*<br />

#### Plugins

* [Advanced Portals](https://www.spigotmc.org/resources/advanced-portals.14356/)
* [WorldGuard](https://worldguard.enginehub.org/en/latest/regions/flags/)
* [WorldEdit](https://dev.bukkit.org/projects/worldedit)
* [TeleCraft]
* [SetSpawns]

### Crossplay: Bedrock Edition und Java Edition

see: https://github.com/GeyserMC/Geyser/wiki/Setup
