---
title: docToolchain, docs-as-co.de, arc42 and asciidoctor reveal.js
layout: default
---

## docToolchain, docs-as-co.de, arc42 and asciidoctor reveal.js

The following procedure describes how to set up the [arc42](https://arc42.org) template and a sample [Asciidoctor
reveal.js](https://docs.asciidoctor.org/reveal.js-converter/latest/) presentation from scratch.

It uses the [docToolchain](http://doctoolchain.org/docToolchain/v2.0.x/) as suggested by
[docs-as-co.de](https://docs-as-co.de).

This tutorial has been tested with an Apple Silicon based mac. This architecture is not yet supported by the docker
based [docToolchain](http://doctoolchain.org/docToolchain/v2.0.x/). Instead the [docToolchain
repository](https://github.com/docToolchain/docToolchain) branch `ng` is used.

### 1 Clone docToolchain and Git Submodules

```shell
git clone https://github.com/docToolchain/docToolchain.git
cd docToolchain
git submodule init
git submodule update
```

The default branch `ng` should be used.

Now add the `bin` folder to your `PATH`. You might need to restart your shell.

### 2 Create an arc42 Based Documentation Repository

```shell
mkdir <your-doc-folder>
cd <your-doc-folder>

# Setup the correct Java and Gradle versions in .sdkmanrc
# For more information, see https://sdkman.io
cat << EOF > .sdkmanrc
# Enable auto-env through the sdkman_auto_env config
# Add key=value pairs of SDKs to use below
java=11.0.14-ms
gradle=6.9.2
EOF

# Activate the configured Java and Gradle versions for the current shell
sdk env

# Initialize arc42 in your current directory
docToolchain . downloadTemplate
```

Now answer all the questions, the tool prints. Make sure to reed the highlighted lines - they are printed in between the
other output of the `docToolchain` command.

```text
Config file '.../Config.groovy' does not exist
do you want me to create a default one for you? (y, n)

Install arc42 documentation template.
Which language do you want to install? (EN, DE, ES, IT, NL)

Do you want the template with or without help?
```

Finally, generate the HTML version of the template

```shell
docToolchain . generateHTML
open open build/html5/arc42/arc42.html
```

### 3 Create the AsciiDoctor reveal.js Presentation

1. Create a `presentation.adoc` file

   ```shell
   mkdir src/docs
   cat << EOF >> src/docs/presentation.adoc
   = Title Slide

   == Slide 1

   * This is the first slide
   
   == Slide 2
   
   * This is the second slide
   
   EOF
   ```

2. Add the following entry into the `inputFiles` section of `Config.groovy` (note the
   ","   at the end of the line):

   ```groovy
   [file: 'presentation.adoc', formats: ['revealjs']],
   ```

3. Generate the slide deck

   ```shell
   docToolchain . generateDeck
   ```

4. Host the slides in a server, e.g. using [browsersync](https://browsersync.io/):

   ```shell
   browser-sync start --server --files "build/**/*.html" --startPath /build/decks/html5/presentation.html
   ```

### Troubleshooting

If `docToolchain` reports an error like

```text
BUG! exception in phase 'semantic analysis' in source unit 'script16562611848591859871238.groovy' Unsupported class file major version 61
```

you are likely using newer version of Java and / or Gradle than supported by the tool. Please make sure you have configured [sdkman](https://sdkman.io) to use the correct versions of Java and Gradle (see above).
