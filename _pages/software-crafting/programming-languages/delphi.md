---
title: Delphi
layout: default
---
# Delphi

## Download and Install

To learn and get started with Delphi you can use the [Delphi Community Edition](https://www.embarcadero.com/products/delphi/starter/free-download?aldSet=en-GB).

## Getting Started

* [Learn to Program with Delphi Community Edition: Part 2 - Building and Debugging](https://community.embarcadero.com/blogs/entry/Learn-DelphiCE-Part2) - Learn basic Delphi by writing a simple calculator.

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

Q: Does Delphi have a Garbage Collector? Why do I have to call `<MyObjectInstance>.Free()` in a `TForm.FormDestroy` method? (see section "Wiring the Buttons to the Code" in [Learn to Program with Delphi Community Edition: Part 5 - Putting the Calculator Together](https://community.embarcadero.com/blogs/entry/Learn-DelphiCE-Part5))

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

## General Delphi Links

- [Learn to Program with Community Edition](https://blogs.embarcadero.com/learn-to-program-with-community-edition/) - Learn basic Delphi and C++ Builder by writing a simple calculator.
- [Help for RAD Studio 10.4 Sydney](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Main_Page) - Official documentation wiki for Delphi.
  - [Tutorials](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Tutorials)
- [YouTube: EmbarcaderoTechNet](https://www.youtube.com/user/EmbarcaderoTechNet) - The "Embarcadero Technologies" YouTube channel.
- [RADStudio IDE Keyboard Shortcuts Guide](https://blogs.embarcadero.com/radstudio-ide-keyboard-shortcuts-guide/) - with printable keyboard cheat sheet.
- [GitHub: Embarcadero](https://github.com/Embarcadero) - Embarcadero on GitHub.