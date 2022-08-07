---
title: Clojure
layout: default
---

## Clojure

### Getting Started

1. Follow Daniel Higginbotham's book [CLOJURE for the BRAVE and TRUE](https://www.braveclojure.com/clojure-for-the-brave-and-true/) to learn the ultimate language and become a better programmer.

### Important Commands

```sh
# Create a new clojure application
lein new app clojure-noob

cd clojure-noob

# Run the application
lein run

# Create a distributable JAR for the Java Virtual Machine
lein uberjar

# Run the JAR
java -jar target/uberjar/clojure-noob-0.1.0-SNAPSHOT-standalone.jar

# Start the REPL - read eval print loop
lein repl
```

### Language and API References

- [Clojure.org](https://clojure.org/) - Main page for Clojure.
- [Clojure Cheat Sheet](https://clojure.org/api/cheatsheet) - Overview of built-ins, data structures etc.
- [ClojureScript Cheat Sheet](https://cljs.info/cheatsheet/) - Cheat Sheet for ClojureScript.
- [ClojureDocs](https://clojuredocs.org/) - documentation and examples repository for Clojure.

### Exercises Specifically for Clojure

- [4ever-clojure](https://4clojure.oxal.org/) - An interactive problem website for learning Clojure.
  - GitHub: [oxalorg / 4ever-clojure](https://github.com/oxalorg/4ever-clojure)
  - GitHub: [4clojure / 4clojure](https://github.com/4clojure/4clojure) - Original 4clojure site can be self-hosted.

### Interesting Clojure Projects

- [SCI - Small Clojure Interpreter](https://github.com/babashka/sci) - limited dialect of Clojure for a single-purpose, scripted application.

### References

The following list shows the tools and reading materials I have encountered while reading [CLOJURE for the BRAVE and
TRUE](https://www.braveclojure.com/clojure-for-the-brave-and-true/).

#### Tools

- [sdkman: Leiningen](https://sdkman.io/sdks#leiningen) - a leiningen sdk for installing with the [sdkman](https://sdkman.io/) package manager.
- [Cursive](https://cursive-ide.com/index.html) - The Clojure(Script) IDE that understands your code - a plugin for [JetBrains IntelliJ IDEA](https://www.jetbrains.com/idea/).
  - [Cursive: User Guide](https://cursive-ide.com/userguide/) - Getting started with Cursive.

#### Reading Material

- [Leiningen](https://leiningen.org/) - the build system automating Clojure projects without setting your hair on fire.
- [Clojure Documentation](https://clojure-doc.org/) - community-driven documentation site for the Clojure programming language.
