---
title: Java
layout: default
---
# Java

## Installation

On macOS I am installing java by means of [Homebrew](https://brew.io):

```shell
brew install temurin
```

This will download and install the latest OpenJDK provided by the [Adoptium](https://adoptium.net/index.html?variant=openjdk16&jvmVariant=hotspot) project.

For code development I am using [JetBrains IntelliJ IDEA](https://www.jetbrains.com/?from=RemoteControlledProcess) whom I wish to thank for the free license they grant to me because of [my open source contributions](https://github.com/wonderbird).

Please check the list of [IntelliJ IDEA Plugins](../plugins/jetbrains-intellij-idea-plugins.html) I recommend.

## Switching Between Multiple Versions of Java

1. Install [jenv](htts://jenv.be)

```shell
brew install jenv
# Remember to add the initialization code to .zshrc or .bashrc
# Restart your shell
```

2. Install some Java versions using [Homebrew](htts://brew.io)

```shell
brew tap homebrew/cask-versions
brew install temurin
brew install temurin11
```

3. Find out the Java version paths

```shell
/usr/libexec/java_home -V
```

4. Register the Java version paths with jenv

```shell
jenv add ... # for each Java version you'd like to switch to
```

5. Verify

```shell
jenv versions
```

6. Switch Java version (e.g. 11)

```shell
jenv global 11
```

## Links

- [Adoptium](https://adoptium.net/index.html?variant=openjdk16&jvmVariant=hotspot) - Prebuilt OpenJDK Binaries for Free.
- [JetBrains IntelliJ IDEA](https://www.jetbrains.com/idea/) - Java IDE.
- Stackoverflow: [Mac OS X and multiple Java versions](https://stackoverflow.com/questions/26252591/mac-os-x-and-multiple-java-versions)
