---
title: Delphi
layout: default
---
# Delphi

<!-- doctoc --maxlevel 2 _pages/software-crafting/programming-languages/delphi.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Download and Install](#download-and-install)
- [Getting Started](#getting-started)
- [Books](#books)
- [Unit Testing](#unit-testing)
- [Simplify Daily Work](#simplify-daily-work)
- [Visual Studio Code Plugins](#visual-studio-code-plugins)
- [Know How](#know-how)
- [Questions](#questions)
- [Services and Microservices](#services-and-microservices)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Download and Install

To learn and get started with Delphi you can use the [Delphi Community Edition](https://www.embarcadero.com/products/delphi/starter/free-download?aldSet=en-GB).

## Getting Started

* [Learn to Program with Delphi Community Edition: Part 2 - Building and Debugging](https://community.embarcadero.com/blogs/entry/Learn-DelphiCE-Part2) - Learn basic Delphi by writing a simple calculator.

### Getting Started Documentation

- [Learn to Program with Community Edition](https://blogs.embarcadero.com/learn-to-program-with-community-edition/) - Learn basic Delphi and C++ Builder by writing a simple calculator.
- [Delphi Boot Camp Recording](https://blogs.embarcadero.com/delphi-boot-camp-with-100-off-delphi/) - 5 videos introducing Delphi development.
- [Help for RAD Studio 10.4 Sydney](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Main_Page) - Official documentation wiki for Delphi.
  - [Tutorials](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Tutorials)
- [YouTube: EmbarcaderoTechNet](https://www.youtube.com/user/EmbarcaderoTechNet) - The "Embarcadero Technologies" YouTube channel.
- [GitHub: Embarcadero](https://github.com/Embarcadero) - Embarcadero on GitHub.

## Books

- Maco Canttú: [Object Pascal Handbook](https://lp.embarcadero.com/Object-Pascal-Handbook-2021) - A compendium introducing object pascal and Delphi to beginners.

## Unit Testing

### Test Insight

[Test Insight](https://bitbucket.org/sglienke/testinsight/wiki/Home) is a unit testing IDE Plugin for Delphi which eases unit test development.

After installation you can access TestInsight in the IDE by selecting **View &rarr; TestInsight Explorer**.

#### Adapting your Project

In order to make TestInsight work with your project it needs to have the `TESTINSIGHT` compiler directive 
defined in the project. You can do that quickly with the context menu in the project manager.

In your application you need to use the TestInsight.&lt;framework&gt; unit for the framework you are using.
Just call the RunRegisteredTests routine or manually register the Listener/Logger to your test framework.

#### Continously Testing (Watch Tests)

In **Tools &rarr; Options / Fremdhersteller (3rd party providers?) &rarr; TestInsight** check the **Run Continous Tests Silently** checkbox.

#### Miscellaneous

- **Tools &rarr; Options / Fremdhersteller (3rd party providers?) &rarr; TestInsight** allows changing the ports used by TestInsight at a later point of time.

### DUnitX

- [Von 0 auf 100 - DUnitX - Ein Testframework für Delphi](https://www.youtube.com/watch?v=2WPlVAz-cTU) - German video introduction to DUnitX and Test Insight.
  - [Delphi-PRAXIS: Von 0 auf 100 - DUnitX - Ein Testframework für Delphi](https://www.delphipraxis.net/202317-von-0-auf-100-dunitx-ein-testframework-fuer-delphi-3.html) - Forum to discuss questions regarding DUnitX.

#### Installing the DUnitX Expert into Delphi

[DUnitX](https://github.com/VSoftTechnologies/DUnitX) includes a UI component.

The following installation steps are taken from the video [Von 0 auf 100 - DUnitX - Ein Testframework für Delphi](https://www.youtube.com/watch?v=2WPlVAz-cTU):

1. Clone the DUnitX master branch: `git clone https://github.com/VSoftTechnologies/DUnitX.git`
1. Open the Delphi project matching your IDE from `DUnitX\Expert`
1. Right click the `DUnitX_IDE_Expert_...bpl` project and select **Install**
1. **File &rarr; New &rarr; Other** now contains **Delphi Projects &rarr; DUnitX &rarr; DUnitX Project** and **DUnitX Test Unit**
1. Select **Tools &rarr; Options / Environment Options &rarr; Environment Variables** and add a **User Environment Variable** named **DUnitX** with the path to the checked out sources as its value.

Notes:

- When installing the expert, I received an exception about the expert being registered twice. I ignored it ... Is it possible that the DUnitX Expert is already present in Delphi 10.4.2 Sydney?

- DUnitX can create NUnit compatible output for use in a build server and test result monitoring environment.

### Delphi.Mocks

- [Von 0 auf 100 - Delphi.Mocks ein Mock-Framework für Delphi](https://www.youtube.com/watch?v=BjMW4VW1UgA) - video introduction to Delphi.Mocks.

### Further Information on Unit Testing

- [Unit Testing Overview](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Unit_Testing_Overview) - Getting started with DUnit based unit testing.
- [DUnitX Overview](https://docwiki.embarcadero.com/RADStudio/Sydney/en/DUnitX_Overview)
- [GitHub: DUnitX](https://github.com/VSoftTechnologies/DUnitX) - Test framework, taking ideas from DUnit, NUnit and other test frameworks.
  - [GitHub: DUnitX / Examples](https://github.com/VSoftTechnologies/DUnitX/tree/master/Examples) - Examples for using DUnitX.
  - [Delphi-Praxis: DUnitX Forum](https://en.delphipraxis.net/forum/36-dunitx/) - Disucss DUnitX topics.
- [Test Insight](https://bitbucket.org/sglienke/testinsight/wiki/Home) - Delphi plugin simplifying unit test development.

## Simplify Daily Work

- [Default Keyboard Shortcuts](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Default_Keyboard_Shortcuts) - a table showing all shortcuts.

- [RADStudio IDE Keyboard Shortcuts Guide](https://blogs.embarcadero.com/radstudio-ide-keyboard-shortcuts-guide/) - with printable keyboard cheat sheet.

## Visual Studio Code Plugins

[Visual Studio Code](https://code.visualstudio.com/) is an alternative to using the Embarcadero RAD Studio code editor.

The following extensions are useful:

- [Pascal](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal) - Note the extension's instructions on installing dependencies.
- [Pascal-Formatter](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal-formatter) - installs automatically together with [Pascal](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal).

Apart from that, refer to the language agnostic extensions in [Visual Studio Code Plugins](../plugins/vs-code-plugins.html)

## Know How

- Create line breaks in string messages: `'Hello'#13#10'World'`
- Path and file name operations: `TPath`, `TFile` (cross platform)
- Path of the current executable: `TPath.GetLibraryPath` (on iOS this may be the ZIP file containing the executable)


## Questions

While learning Delphi I have encountered the following questions:

### Memory Management

Q: Does Delphi have a Garbage Collector? Why do I have to call `<MyObjectInstance>.Free()` in a `TForm.FormDestroy` method? (see section "Wiring the Buttons to the Code" in [Learn to Program with Delphi Community Edition: Part 5 - Putting the Calculator Together](https://community.embarcadero.com/blogs/entry/Learn-DelphiCE-Part5))

A: If you use an interface as the variable type, then reference counters are used and the instance is freed automatically. If you don't use an interface as the variable type, then the instance is must be cleaned up.
## Services and Microservices

### Links Regarding Services and Microservices

- [Überblick über RAD Server](https://docwiki.embarcadero.com/RADStudio/Sydney/de/%C3%9Cberblick_%C3%BCber_RAD_Server) - Overview on RAD Server for developing service oriented architectures.
  - [RAD Server Deep Dive Webinar](https://www.youtube.com/playlist?list=PLwUPJvR9mZHgccq4EfTcsCngRqpTmm_wn) - Detailed introduction into service oriented architecture development in Delphi.
    - [Demo: RAD Server Development](https://youtu.be/f8rAGLnop4s?t=1008) - Starting point of "Develop a RAD Server application package" in the first video. Uses a "Retail Store" business scenario - users check-in via mobile app and receive special offers of the day by their location.
    - [Demo: Embedded Auto Documentation API](https://www.youtube.com/watch?v=f8rAGLnop4s&t=2085s) - Starting point of Swagger API documentation generator.
  - [DockerHub: radstudio/paserver](https://hub.docker.com/r/radstudio/paserver) - Docker container to host RAD Server services.
- [Docker-Bereitstellung für RAD Server](https://docwiki.embarcadero.com/RADStudio/Sydney/de/Docker-Bereitstellung_f%C3%BCr_RAD_Server) - Overview on hosting Delphi services in Linux based Docker containers.

### Example: Customer Relationship Management

This example is explained in detail in the video "Delphi Apps als Docker-Container bereitstellen" which Olaf Monien and Holger Flick presented during the [Code Rage 2021](https://lp.embarcadero.com/CodeRageGermany2021).

#### Accessing a SQL Lite Database

##### Configure the DB Connection

1. Drag a `FireDAC Connection` onto the designer of your DataSource (Repository) class. Note that the right (grey) side of the FireDAC configuration dialog shows the default settings.
2. Select **Driver ID** `sQLite`
3. Configure **Locking Mode** `Normal` (`Exclusive` mode will hinder development because the running application will lock the DB. However `Exclusive` mode may be the best for a production ready application)
4. Configure **Database** file path
5. Caveat: **JournalMode** facilitates logging all activities on the DB. If you are using many insert / delete operations, the DB will grow quickly. Also inserting many records at once will take much time, if **JournalMode** is `Persist`. If you don't need the Journal, then select `Delete` here.
6. In the FireDAC **Object Inspector** set **LoginPrompt** to `False`. SQLite does not provide username / password authentication, but you may want to consider encrypting the DB.

##### Create a Query

1. Drag a `FireDAC Query` onto your DataSource (Repository) class designer.
2. From the **Object Inspector** dialog open the `FireDAC Query Editor`
3. Configure your SQL query with parameters and design time defaults for the parameters

##### Preparing the Application at Runtime

1. In the `BeforeConnect` event handler check whether the DB file exists and then assign the path to `Connection.Params.Database`.

