---
title: Delphi
layout: default
---
# Delphi

<!-- doctoc --maxlevel 3 _pages/software-crafting/programming-languages/delphi.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Getting Started](#getting-started)
  - [Download and Install](#download-and-install)
  - [Getting Started by Example](#getting-started-by-example)
  - [Next Things to Read and Do](#next-things-to-read-and-do)
- [Improving Daily Work](#improving-daily-work)
  - [Language References](#language-references)
  - [Keyboard Shortcuts](#keyboard-shortcuts)
  - [Know How, Tips and Tricks](#know-how-tips-and-tricks)
  - [Coding Support: Components and IDE Extensions for Delphi RAD Studio](#coding-support-components-and-ide-extensions-for-delphi-rad-studio)
  - [Visual Studio Code Plugins](#visual-studio-code-plugins)
- [Techniques](#techniques)
  - [Unit Testing](#unit-testing)
  - [Services and Microservices](#services-and-microservices)
  - [FireDAC Database Access](#firedac-database-access)
  - [Accessing a SQL Lite Database via FireDAC](#accessing-a-sql-lite-database-via-firedac)
  - [Miscellaneous Programming Libraries](#miscellaneous-programming-libraries)
- [Links and References](#links-and-references)
  - [Link Collections on Delphi and Pascal](#link-collections-on-delphi-and-pascal)
  - [Books](#books)
  - [Blogs](#blogs)
  - [Magazines](#magazines)
- [Criticism and Troubleshooting](#criticism-and-troubleshooting)
  - [Delphi 10.4 IDE](#delphi-104-ide)
  - [DUnitX and TestInsight](#dunitx-and-testinsight)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Getting Started

### Download and Install

To learn and get started with Delphi you can use the [Delphi Community Edition](https://www.embarcadero.com/products/delphi/starter/free-download?aldSet=en-GB).

### Getting Started by Example

- [Learn to Program with Delphi Community Edition: Part 2 - Building and Debugging](https://community.embarcadero.com/blogs/entry/Learn-DelphiCE-Part2) - Learn basic Delphi by writing a simple calculator.

- [Samples Repositories](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Samples_Repositories) - Information about the samples repositories on Embarcadero RAD Studio.

### Next Things to Read and Do

- [Delphi Basics](http://www.delphibasics.co.uk/) - introduction to Delphi for newcomers, and ready reference for experienced programmers.

- [Learn to Program with Community Edition](https://blogs.embarcadero.com/learn-to-program-with-community-edition/) - Learn basic Delphi and C++ Builder by writing a simple calculator.

- [Delphi Boot Camp Recording](https://blogs.embarcadero.com/delphi-boot-camp-with-100-off-delphi/) - 5 videos introducing Delphi development.

- [Developer Skill Sprints](https://www.youtube.com/playlist?list=PLwUPJvR9mZHhZTajVWsgaFPLtDA-t1Xwc) - Fast programming tips, tricks and techniques.

- [Help for RAD Studio 10.4 Sydney](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Main_Page) - Official documentation wiki for Delphi.
  - [Tutorials](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Tutorials)

- [YouTube: EmbarcaderoTechNet](https://www.youtube.com/user/EmbarcaderoTechNet) - The "Embarcadero Technologies" YouTube channel.

- [GitHub: Embarcadero](https://github.com/Embarcadero) - Embarcadero on GitHub.

At the end of the page you can find further references including the [Books](#books) section.

The Object Pascal Handbook is a good read [[1](#ref-1)].

## Improving Daily Work

### Language References

- [RTL](https://docwiki.embarcadero.com/RADStudio/Sydney/en/RTL) - Reference about the standard libraries.

- [System](https://docwiki.embarcadero.com/Libraries/Sydney/en/System) - Contains the Delphi run-time library (RTL) units, classes, functions, types, variables, and constants.

- [Date and Time Support](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Date_and_Time_Support) - Delphi types, routines, and variables that add Date and Time support.

### Keyboard Shortcuts

- [Default Keyboard Shortcuts](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Default_Keyboard_Shortcuts) - a table showing all shortcuts.

- [RADStudio IDE Keyboard Shortcuts Guide](https://blogs.embarcadero.com/radstudio-ide-keyboard-shortcuts-guide/) - with printable keyboard cheat sheet.

### Static Code Analysis

- [Robust and Powerful Pascal Analyzer for Delphi on Windows](https://blogs.embarcadero.com/robust-and-powerful-pascal-analyzer-for-delphi-on-windows/) - Product presentation for Pascal Analyzer (PAL).

- [New Major Release for Delphi Code Analyzer v2.4 with Free Download](https://blogs.embarcadero.com/new-major-release-for-delphi-code-analyzer-v2-4-with-free-download/) - Product presentation for a DelphiParser, a static code analyzer.

### Know How, Tips and Tricks

#### Good Practices

- From every constructor call the base constructor first. This ensures that all members are initialized when a derived constructor expects them to be [[1](#ref-1)], p. 389
- Every destructor should be virtual. This ensures that all memory allocated by derived classes gets freed even if you call `Free` for a base type [[1](#ref-1)], p. 389
- From every destructor call the base destructor last. This ensures that all memory allocated by parent classes gets freed after depending memory has been freed in derived classes [[1](#ref-1)], p. 389
- In a destructor never assume the object has been fully initialized, because the constructor might throw an exception while still allocating objects. Thus, always check `assigned(object)` before `object.Free` in the destructor [[1](#ref-1)], p.390

#### Tips and Tricks

- Create line breaks in string messages: `'Hello'#13#10'World'`
- Path and file name operations: `TPath`, `TFile` (cross platform)
- Path of the current executable: `TPath.GetLibraryPath` (on iOS this may be the ZIP file containing the executable)
- Implementing Smart Pointers is described in [[1](#ref-1)], pp. 436

#### Memory Management Insights

While learning Delphi I have encountered the following questions:

Q: Does Delphi have a Garbage Collector? Why do I have to call `<MyObjectInstance>.Free()` in a `TForm.FormDestroy` method? (see section "Wiring the Buttons to the Code" in [Learn to Program with Delphi Community Edition: Part 5 - Putting the Calculator Together](https://community.embarcadero.com/blogs/entry/Learn-DelphiCE-Part5))

A: If you use an interface as the variable type, then reference counters are used and the instance is freed automatically. If you don't use an interface as the variable type, then the instance is must be cleaned up. The entire story about memory management with ownership, weak references and reference counting is told in chapter "13 Objects and Memory" in Maco Cantú: [Object Pascal Handbook](https://lp.embarcadero.com/Object-Pascal-Handbook-2021) [[1](#ref-1)].

Note that in chapter "Smart Pointers in Object Pascal" [[1](#ref-1)], Marco Cantú introduces a Smart Pointer implementation for Delphi &lt; 10.4 and another one for Delphi &gt;= 10.4. Erik Bilsen disucsses the latter solution in his blog entry [Custom Managed Records for Smart Pointers](https://blog.grijjy.com/2020/08/12/custom-managed-records-for-smart-pointers/).

### Coding Support: Components and IDE Extensions for Delphi RAD Studio

#### Open Source OR Free for Personal Use

- [CodeSite](https://raize.com/codesite/) - logging system with specialized log viewers.
- [https://bitbucket.org/sglienke/dsharp](https://bitbucket.org/sglienke/dsharp/src/master/) - MVVM and mocks for Delphi.
- [JEDI Component Library JCL](https://github.com/project-jedi/jcl) - thoroughly tested and fully documented utility functions and non-visual classes.
- [JEDI Visual Component Library](https://github.com/project-jedi/jvcl) - over 600 Delphi visual and non-visual Delphi/C++Builder components.
- [LockBox 3](https://github.com/TurboPack/LockBox3) - cryptography library.
- [MMX Code Explorer](https://www.mmx-delphi.de/) - refactoring Browser with Delphi Pascal support.
- [Spring4d](https://bitbucket.org/sglienke/spring4d/src/master/) - collections, enumberables, dependency injection, encryption, reflection, inversion of control / IoC container.
- [Virtual Treeview](https://www.jam-software.de/virtual-treeview) - treeview control.

#### License Required

- [madExcept](http://madshi.net/madExceptDescription.htm) - exception reporter facilitating crash analysis.

### Visual Studio Code Plugins

[Visual Studio Code](https://code.visualstudio.com/) is an alternative to using the Embarcadero RAD Studio code editor.

The following extensions are useful:

- [Pascal](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal) - Note the extension's instructions on installing dependencies.
- [Pascal-Formatter](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal-formatter) - installs automatically together with [Pascal](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal).

Apart from that, refer to the language agnostic extensions in [Visual Studio Code Plugins](../plugins/vs-code-plugins.html)

## Techniques

### Unit Testing

#### Test Insight

[Test Insight](https://bitbucket.org/sglienke/testinsight/wiki/Home) is a unit testing IDE Plugin for Delphi which eases unit test development.

After installation you can access TestInsight in the IDE by selecting **View &rarr; TestInsight Explorer**.

##### Bug: TestInsight Explorer does not consider `--include` and `--exclude` filters.

Stefan Glienke has provided a workaround here: [TestInsights seems to not recognize runParam to exclude DUnitX Tests by
category](https://bitbucket.org/sglienke/testinsight/issues/160/testinsights-seems-to-not-recognize).

Apply the suggested fix in the file(s)
`C:\Users\<your-user-name>\AppData\Local\Programs\TestInsight\Source\TestInsight.DUnit*.pas` matching your test
framework.

##### Adapting your Project

In order to make TestInsight work with your project it needs to have the `TESTINSIGHT` compiler directive 
defined in the project. You can do that quickly with the context menu in the project manager.

In your application you need to use the TestInsight.&lt;framework&gt; unit for the framework you are using.
Just call the RunRegisteredTests routine or manually register the Listener/Logger to your test framework.

##### Continously Testing (Watch Tests)

In **Tools &rarr; Options / Fremdhersteller (3rd party providers?) &rarr; TestInsight** check the **Run Continous Tests Silently** checkbox.

##### Other Topics

- **Tools &rarr; Options / Fremdhersteller (3rd party providers?) &rarr; TestInsight** allows changing the ports used by TestInsight at a later point of time.

#### DUnitX

- [Von 0 auf 100 - DUnitX - Ein Testframework für Delphi](https://www.youtube.com/watch?v=2WPlVAz-cTU) - German video introduction to DUnitX and Test Insight.
  - [Delphi-PRAXIS: Von 0 auf 100 - DUnitX - Ein Testframework für Delphi](https://www.delphipraxis.net/202317-von-0-auf-100-dunitx-ein-testframework-fuer-delphi-3.html) - Forum to discuss questions regarding DUnitX.

##### Installing the DUnitX Expert into Delphi

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

#### Mock Frameworks

##### Spring4D (Spring.Mocking)

###### Attention

If you are using the Community Edition of Delphi, then you need to compile the Spring4D projects from within the Delphi IDE. Otherwise, the `Build.exe` will not create `.dcu` files in the `Library` subfolder.

1. In the Delphi IDE create all projects in `...\spring4d\Packages\Delphi10Sydney\Spring4D.groupproj`
2. Run `Build.exe` with build configuration `Debug` and `Update Delphi Registry` checked for your Delphi version

###### Spring4D Links

- [GitHub: Spring4D](https://bitbucket.org/sglienke/spring4d/src/master/)
  - [docs.spring4d.org](http://docs.spring4d.org/) - Spring4D reference documentation.

- [Mocking in Spring4D](https://probucon.de/blog/2019/12/mocking-with-spring4d/) - Getting started with Mocking in Spring4D.

- [Quickly Learn Mocking In Delphi With Spring4D](https://blogs.embarcadero.com/quickly-learn-mocking-in-delphi-with-spring4d/) - Video introduction to mocking with Spring4D

##### Delphi.Mocks

- [GitHub: Delphi.Mocks](https://github.com/VSoftTechnologies/Delphi-Mocks) - GitHub project of Delphi.Mocks.

- [Introducing Delphi Mocks](https://www.finalbuilder.com/resources/blogs/introducing-delphi-mocks) - What is an automatic mock framework?

- [Von 0 auf 100 - Delphi.Mocks ein Mock-Framework für Delphi](https://www.youtube.com/watch?v=BjMW4VW1UgA) - video introduction to Delphi.Mocks.

- [Delphi-Mocks Parameter Matchers](https://www.finalbuilder.com/resources/blogs/delphi-mocks-parameter-matchers) - place tighter controls on verifying that a mocked interface/object method is called.

#### Delphi Code Coverage

- [Delphi Code Coverage](https://github.com/DelphiCodeCoverage/DelphiCodeCoverage) - creates code coverage reports based on detailed MAP files.

- [Delphi Code Coverage Wizard](https://github.com/trident-job/delphi-code-coverage-wizard) - wizard to setup and build scripts for [Delphi Code Coverage](https://github.com/DelphiCodeCoverage/DelphiCodeCoverage).

#### Further Information on Unit Testing

- [Unit Testing Overview](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Unit_Testing_Overview) - Getting started with DUnit based unit testing.
- [DUnitX Overview](https://docwiki.embarcadero.com/RADStudio/Sydney/en/DUnitX_Overview)
- [GitHub: DUnitX](https://github.com/VSoftTechnologies/DUnitX) - Test framework, taking ideas from DUnit, NUnit and other test frameworks.
  - [GitHub: DUnitX / Examples](https://github.com/VSoftTechnologies/DUnitX/tree/master/Examples) - Examples for using DUnitX.
  - [Delphi-Praxis: DUnitX Forum](https://en.delphipraxis.net/forum/36-dunitx/) - Disucss DUnitX topics.
- [Test Insight](https://bitbucket.org/sglienke/testinsight/wiki/Home) - Delphi plugin simplifying unit test development.

### Services and Microservices

#### Links Regarding Services and Microservices

- [Überblick über RAD Server](https://docwiki.embarcadero.com/RADStudio/Sydney/de/%C3%9Cberblick_%C3%BCber_RAD_Server) - Overview on RAD Server for developing service oriented architectures.
  - [RAD Server Deep Dive Webinar](https://www.youtube.com/playlist?list=PLwUPJvR9mZHgccq4EfTcsCngRqpTmm_wn) - Detailed introduction into service oriented architecture development in Delphi.
    - [Demo: RAD Server Development](https://youtu.be/f8rAGLnop4s?t=1008) - Starting point of "Develop a RAD Server application package" in the first video. Uses a "Retail Store" business scenario - users check-in via mobile app and receive special offers of the day by their location.
    - [Demo: Embedded Auto Documentation API](https://www.youtube.com/watch?v=f8rAGLnop4s&t=2085s) - Starting point of Swagger API documentation generator.
  - [DockerHub: radstudio/paserver](https://hub.docker.com/r/radstudio/paserver) - Docker container to host RAD Server services.
- [Docker-Bereitstellung für RAD Server](https://docwiki.embarcadero.com/RADStudio/Sydney/de/Docker-Bereitstellung_f%C3%BCr_RAD_Server) - Overview on hosting Delphi services in Linux based Docker containers.

### FireDAC Database Access

- [Quickly Learn How To Connect And Manage A SQLite Database For Delphi/C++ Builder With SQLite Sample App](https://blogs.embarcadero.com/quickly-learn-how-to-connect-and-manage-a-sqlite-database-for-delphi-c-builder-with-sqlite-sample-app) - Blog Article.
- [Defining Connection (FireDAC)](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Defining_Connection_(FireDAC)) - Shows how to create a connection programmatically.
- [FireDAC](https://docwiki.embarcadero.com/RADStudio/Sydney/en/FireDAC) - Overview page regarding FireDAC.
  - [General (FireDAC)](https://docwiki.embarcadero.com/RADStudio/Sydney/en/General_(FireDAC)) - Overview on FireDAC architecture.
  - [Executing Commands (FireDAC)](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Executing_Commands_(FireDAC)) - ExecSQL.
- [Using SQLite with FireDAC](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Using_SQLite_with_FireDAC) - Introduction and overview on using SQLite databases with FireDAC.
- [DLL-Entwicklung (FireDAC)](https://docwiki.embarcadero.com/RADStudio/Sydney/en/DLL_Development_(FireDAC)) - Considerations for using FireDAC within a DLL (Wait Cursor, FFDGUIxSilentMode, prevent TFDGUIxWaitCursor exception)

### Accessing a SQL Lite Database via FireDAC

- [GitHub: Repository Pattern](https://github.com/wonderbird/gof-patterns/tree/main/Repository) - Programmatically using a SQLite DB via FireDAC.

#### Step by Step: Using FireDAC from the Visual Designer

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

##### Prepare the Application at Runtime

1. In the `BeforeConnect` event handler check whether the DB file exists and then assign the path to `Connection.Params.Database`.

### Miscellaneous Programming Libraries

- [MVVM Starter Kit](https://blog.grijjy.com/2018/01/22/mvvm-starter-kit-part-1-of-3/) - part 1 of 3 blog posts introducing MVVM.

- [System.Assert (RTL)](https://docwiki.embarcadero.com/Libraries/Sydney/en/System.Assert) - Create an assertion, i.e. make an expectation (invariant) explicit.

## Links and References

### Link Collections on Delphi and Pascal

- [Awesome Delphi](https://project-awesome.org/Fr0sT-Brutal/awesome-delphi) - A snapshot of the Awesome Pascal list just before it changed its scope from Delphi to Pascal.
- [Awesome Pascal](https://github.com/Fr0sT-Brutal/awesome-pascal)

### Books

<a name="ref-1">[1]</a> Marco Cantú: [Object Pascal Handbook](https://lp.embarcadero.com/Object-Pascal-Handbook-2021) - A compendium introducing object pascal and Delphi to beginners.
  - [ObjectPascalHandbook104](https://github.com/MarcoDelphiBooks/ObjectPascalHandbook104) - GitHub Code Repository accompanying the book.
  - [Object Pascal Handbook Delphi 10.4 Sydney Edition](https://www.marcocantu.com/objectpascal/) - Official homepage of the book.

<a name="ref-2">[2]</a> Nick Hodges: [Coding in Delhpi](https://isbnsearch.org/isbn/1941266037)

<a name="ref-3">[3]</a> Nick Hodges: [More Coding in Delhpi](https://isbnsearch.org/isbn/194126610X)

<a name="ref-4">[4]</a> Huw Collingbourne: [The Little Book Of Delphi Programming: Learn To Program with Object Pascal](https://www.amazon.de/Little-Book-Delphi-Programming-Program/dp/1913132099/)

### Blogs and Forums

- [Delphi-PRAXIS](https://www.delphipraxis.net/) - German forum on Delphi and associated development tools.

- [Delphi Sorcery](https://delphisorcery.blogspot.com/) - blog by Stefan Glienke, the developer behind TestInsight and Spring4D).

- [Uwe Raabe](https://www.uweraabe.de/Blog/) - by the author of the MMX Code Explorer.

- [tmssoftware.com](https://www.tmssoftware.com/site/blog.asp) - software development company providing Delphi components, project work and training services.

- [grijjy](https://blog.grijjy.com/) - software development company.

- [VSoft Technologies Blog](https://www.finalbuilder.com/resources/blogs) - the authors of [Delphi Mocks](#delphi.mocks).

### Magazines

- [Delphi Magazine](http://www.delphimagazine.com/)

## Criticism and Troubleshooting

After having used Delphi 10.4 for several weeks, the following issues are bothering me:

### Delphi 10.4 IDE

- The refactoring tool seems unreliable. Sometimes the refactoring is incomplete and I have to rename types or methods by hand.
  - **Refactoring &rarr; Inline Variable** does not work.
- Introducing folders into an existing project is not intuitive. When trying to do so I had issues with removing an obsolete file from the project - it turned out that the project view just didn't refresh properly.
- In some cases, the code editor does not refresh compiler warnings once they have been cured.

### DUnitX and TestInsight

- TestInsight sometimes does not refresh test status correctly. Sometimes I need to clear the TestInsight window, re-run all tests and then only see that a test has turned from red to green.
