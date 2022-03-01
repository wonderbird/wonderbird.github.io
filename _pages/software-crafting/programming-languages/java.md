---
title: Java
layout: default
---

## Java

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Documentation](#documentation)
- [Tools and Frameworks](#tools-and-frameworks)
- [Installing Java on Windows](#installing-java-on-windows)
- [Installing Java on macOS](#installing-java-on-macos)
- [Links](#links)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Documentation

- Rheinwerk&lt;openbook&gt;: [Java ist auch eine Insel](https://openbook.rheinwerk-verlag.de/javainsel/)

- [Baeldung](https://www.baeldung.com/start-here) - Baeldung Learning Materials, Courses and Guides

### Tools and Frameworks

- [JUnit5 class Assertions](https://junit.org/junit5/docs/5.0.1/api/org/junit/jupiter/api/Assertions.html)

- Baeldung: [A Guide to JUnit5](https://www.baeldung.com/junit-5)

### Installing Java on Windows

(Just some links for now:)

- [Chocolatey: temurin](https://community.chocolatey.org/packages/temurin) - Eclipse Temurin is a part of the Adoptium Enterprise Java Platform replacing AdopOpenJDK.

- [Chocolatey: maven](https://community.chocolatey.org/packages/maven)

### Installing Java on macOS

#### One Java Version Only

On macOS I am installing java by means of [Homebrew](https://brew.io):

```shell
brew install temurin
```

This will download and install the latest OpenJDK provided by the [Adoptium](https://adoptium.net/index.html?variant=openjdk16&jvmVariant=hotspot) project.

For code development I am using [JetBrains IntelliJ IDEA](https://www.jetbrains.com/?from=RemoteControlledProcess) whom I wish to thank for the free license they grant to me because of [my open source contributions](https://github.com/wonderbird).

Please check the list of [IntelliJ IDEA Plugins](../plugins/jetbrains-intellij-idea-plugins.html) I recommend.

#### Switching Between Multiple Versions of Java

##### Works For Both Java And Gradle

1. Install [sdkman](https://sdkman.io)

1. Install java and gradle

   ```sh
   # Install latest
   sdk install java
   sdk install gradle

   # Install an alternative version
   sdk install java 11-ms
   sdk install gradle 6.7.1
   ```

1. Select a default version for java and gradle

   ```sh
   sdk default java 11.0.14-ms
   sdk default gradle 6.7.1
   ```

1. Use a different version of java and gradle in the current shell (restored to `default` in the next shell)

   ```sh
   sdk use java 11-ms
   sdk use gradle 6.7.1
   ```

##### Works For Java, Doesn't Work For Gradle

1. Install [jenv](htts://jenv.be)

   ```shell
   brew install jenv
   # Remember to add the initialization code to .zshrc or .bashrc
   # Restart your shell
   ```

1. Install some Java versions using [Homebrew](htts://brew.io)

   ```shell
   brew tap homebrew/cask-versions
   brew install temurin
   brew install temurin11
   ```

1. Find out the Java version paths

   ```shell
   /usr/libexec/java_home -V
   ```

1. Register the Java version paths with jenv

   ```shell
   jenv add ... # for each Java version you'd like to switch to
   ```

1. Verify

   ```shell
   jenv versions
   ```

1. Switch Java version (e.g. 11)

   ```shell
   jenv global 11
   ```

1. In a specific directory, select a different Java version (e.g. 17)

   ```shell
   jenv local 17
   ```

### Links

- [Adoptium](https://adoptium.net/index.html?variant=openjdk16&jvmVariant=hotspot) - Prebuilt OpenJDK Binaries for Free.
- [JetBrains IntelliJ IDEA](https://www.jetbrains.com/idea/) - Java IDE.
- Stackoverflow: [Mac OS X and multiple Java versions](https://stackoverflow.com/questions/26252591/mac-os-x-and-multiple-java-versions)
