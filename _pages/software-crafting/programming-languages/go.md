---
title: Learning Go
layout: default
---
# Learning Go

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
- [Language Tools](#language-tools)
  - [Linter](#linter)
  - [Heuristic Source Code Check: `go vet`](#heuristic-source-code-check-go-vet)
- [Go Frameworks, Libraries and Software](#go-frameworks-libraries-and-software)
  - [Exploration Tools](#exploration-tools)
  - [Package Libraries](#package-libraries)
  - [Frequently used Packages](#frequently-used-packages)
- [Go Specific Details](#go-specific-details)
  - [General Aspects](#general-aspects)
  - [Slices, Errors and Reflection](#slices-errors-and-reflection)
  - [Go Maps](#go-maps)
  - [Concurrency](#concurrency)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Getting Started

To get started, either ... or ...

- Work through [For the Love of Go: Fundamentals](https://bitfieldconsulting.com/books/fundamentals) - addresses complete beginners (I have not read it yet).
- [Learn Go with Tests](https://github.com/quii/learn-go-with-tests) - helped me as an experienced developer to learn Go quickly.

Where to go next?

Practice some [code katas](katas.html), follow the documents listed in the section [General Aspects](#general-aspects) and inspect the [Package Libraries](#package-libraries).

### Prerequisites

#### Installing Go

- Mac users: [Install Go](https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/install-go) in [Learn Go with Tests](https://github.com/quii/learn-go-with-tests)
- Other users: [Go Download and Installation](https://golang.org/doc/install)
- [Set GOPATH](https://github.com/golang/go/wiki/SettingGOPATH)
- [Install Golint](http://networkbit.ch/golang-golint/#install_golint)
- [JetBrains Goland](https://www.jetbrains.com/go/) - also available for free in [JetBrains' Early Access Program](https://www.jetbrains.com/resources/eap/)
- [Visual Studio Code](https://code.visualstudio.com/)
  - [Go](https://marketplace.visualstudio.com/items?itemName=golang.Go) - Extension by the Go Team at Google. Follow installation instructions below.
    - [Getting Started with VS Code Go](https://www.youtube.com/watch?v=1MXIGYrMk80) - An 8 min introduction video into using the VS Code Go extension
    - [GitHub: golang/vscode-go/docs/features.md](https://github.com/golang/vscode-go/blob/master/docs/features.md#%23run-and-test-in-the-editor) - Overview and detailed documentation of the Go extension features.
    - [Tools](https://marketplace.visualstudio.com/items?itemName=golang.Go#tools) - Go extension instructions on how to install the required Go tools (tl;dr `Go: Install/Update Tools` command).
    - [Go Debugging Documentation](https://github.com/golang/vscode-go/blob/master/docs/debugging.md) - Explains how to attach the Go extension to Delve, the go debugger.
  - [Test Explorer UI](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer) - Test Explorer for Visual Studio Code
    - [Go Test Explorer](https://marketplace.visualstudio.com/items?itemName=ethan-reesor.vscode-go-test-adapter) - Required Test Explorer adapter for Go.
    - To use VS Code's native testing UI instead by setting `testExplorer.useNativeTesting` to true in your VS Code settings
  - [Go Outliner](https://marketplace.visualstudio.com/items?itemName=766b.go-outliner) - Shows Go file outline in a sidebar. Requires `go get -u github.com/766b/go-outliner`.

#### Installation Notes

- on the Mac I needed to add `$HOME/go/bin` to my `$PATH` manually (`~/.zshrc`)

#### Installing Go Tools

```shell
go get -u golang.org/x/tools/...
```

#### Uninstalling the Go Package on macOS

- [Uninstall Go on macOS](https://blog.dharnitski.com/2019/04/06/uninstall-go-on-mac/)
- Section [Uninstalling Go](https://golang.org/doc/manage-install#uninstalling) in [Managing Go installations](https://golang.org/doc/manage-install)

## Language Tools

### Linter

Check whether error returns are handeled correctly in all method calls:

```shell
go get -u github.com/kisielk/errcheck
errcheck
```

### Heuristic Source Code Check: `go vet`

* [Go Command vet](https://golang.org/cmd/vet/) - Examines suspicious constructs.

## Go Frameworks, Libraries and Software

### Exploration Tools

* [The Go Playground](https://play.golang.org/)
  * [Slices](https://play.golang.org/p/ICCWcRGIO68)
  * [Copy slices](https://play.golang.org/p/bTrRmYfNYCp)
  * [Why copy a large slice](https://play.golang.org/p/Poth8JS28sc)
  * [Sending to nil channels lasts forever](https://play.golang.org/p/IIbeAox5jKA)

### Package Libraries

* [pkg.go.dev](https://pkg.go.dev/) - Search the centralized and curated resources from across the Go ecosystem.
  * Go.dev: [About](https://go.dev/about/#adding-a-package) - How to add your package documentation to Go.dev.
* [The Go Standard Library](https://golang.org/pkg/)
* [Awesome Go](https://awesome-go.com)

### Frequently used Packages

#### Testing

* [Ginkgo](https://onsi.github.io/ginkgo/) - A Golang BDD Testing Framework.
  * [Getting Started with BDD in Go Using Ginkgo](https://semaphoreci.com/community/tutorials/getting-started-with-bdd-in-go-using-ginkgo) - Introduction into the BDD Framework Ginkgo.
* [Package testify](https://pkg.go.dev/github.com/stretchr/testify/assert) - Documentation for assert, mock, suite statements (GitHub: [stretchr / testify](https://github.com/stretchr/testify))
* [David Cheney: How to write benchmarks in Go](https://dave.cheney.net/2013/06/30/how-to-write-benchmarks-in-go) - Introduction to benchmarking.
* [Package quick](https://golang.org/pkg/testing/quick/) - Property based testing (quickcheck / quick.Check).
* [Package fuzz(beta)](https://blog.golang.org/fuzz-beta) - Fuzzing = automated testing which continuously manipulates inputs to a program to find issues such as panics or bugs.
* [Package httptest](https://golang.org/pkg/net/http/httptest/) - Utilities for HTTP testing.
* [Package mattetti / filebuffer](https://github.com/mattetti/filebuffer) - byte buffer backed file-like interfaces, in-memory alternative to io.File


#### Parsing XML

* [Package encoding/xml](https://pkg.go.dev/encoding/xml?utm_source=godoc) - Simple XML 1.0 parser.
* [XML to Go](https://www.onlinetool.io/xmltogo/) - Create a Go struct from an XML document to facilitate reading XML.
  * GitHub: [miku / zek](https://github.com/miku/zek)

#### Miscellaneous

* [Package fmt](https://golang.org/pkt/fmt/) - Formatted I/O with functions analogous to C's printf and scanf.
* [Package bufio](https://golang.org/pkg/bufio/) - Buffered I/O.

## Go Specific Details

### General Aspects

* [A Tour of Go](https://tour.golang.org/welcome/1) - An interactive tutorial.

* [How to Write Go Code](https://golang.org/doc/code) - Demonstrates the development of a simple Go package inside a module and introduces the go tool.

* [Using Go Modules](https://blog.golang.org/using-go-modules) - How to setup a Go module and manage dependencies.
  * [Stackoverflow: How to point Go module dependency in go.mod to a latest commit in a repo?](https://stackoverflow.com/questions/53682247/how-to-point-go-module-dependency-in-go-mod-to-a-latest-commit-in-a-repo)

* [Effective Go](https://golang.org/doc/effective_go) - Tips for writing clear, idiomatic Go code.
  * [Embedding](https://golang.org/doc/effective_go#embedding)

* [The Go Programming Language](https://www.google.de/books/edition/The_Go_Programming_Language/t_rzrQEACAAJ)

* [The Go Language Specification](https://golang.org/ref/spec) - The reference manual for Go.

* Dave Cheney: [Five suggestions for setting up a Go project](https://dave.cheney.net/2014/12/01/five-suggestions-for-setting-up-a-go-project) - Package conventions.

* [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments) - Good practices for Go.

* [Testable Examples in Go](https://blog.golang.org/examples)

* Mitchell Hashimoto: [Advanced Testing with Go](https://speakerdeck.com/mitchellh/advanced-testing-with-go?slide=53) - Slidedeck with various aspects of testing.

* Kyle Quest: [50 Shades of Go: Traps, Gotchas, and Common Mistakes for New Golang Devs](http://devs.cloudimmunity.com/gotchas-and-common-mistakes-in-go-golang/#anameclose_http_resp_bodyaclosinghttpresponsebody)

* Oleg Zaytsev and others: [Unexpected Go](https://unexpected-go.com/) - Unexpected golang behaviors.

### Slices, Errors and Reflection

* [Go Slices: usage and internals](https://blog.golang.org/slices-intro)

* Dave Cheney: [Constant errors](https://dave.cheney.net/2016/04/07/constant-errors)

* Rob Pike: [The Laws of Reflection](https://blog.golang.org/laws-of-reflection)

### Go Maps

* Dave Cheney: [If a map isn’t a reference variable, what is it?](https://dave.cheney.net/2017/04/30/if-a-map-isnt-a-reference-variable-what-is-it)
* Andrew Gerrand: [Go maps in action](https://blog.golang.org/maps) in [The Go Blog](https://blog.golang.org/)

### `defer`

* Inanc Gumus: [Go Defer Simplified with Practical Visuals](https://blog.learngoprogramming.com/golang-defer-simplified-77d3b2b817ff)
* Inanc Gumus: [5 Gotchas of Defer in Go — Part I](https://blog.learngoprogramming.com/gotchas-of-defer-in-go-1-8d070894cb01)
* Inanc Gumus: [5 More Gotchas of Defer in Go — Part II](https://blog.learngoprogramming.com/5-gotchas-of-defer-in-go-golang-part-ii-cc550f6ad9aa)
* Inanc Gumus: [5 More Gotchas of Defer in Go — Part III](https://blog.learngoprogramming.com/5-gotchas-of-defer-in-go-golang-part-iii-36a1ab3d6ef1)

### Concurrency

* Chris James: [Concurrency, Goroutines, Channels, Race Detection and Anonymous Functions](https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/concurrency)
* Rick Beton: [Use a sync.Mutex or a channel?](https://github.com/golang/go/wiki/MutexOrChannel)
* Sameer Ajmani: [Go Concurrency Patterns: Context](https://blog.golang.org/context)
* [Go package context](https://golang.org/pkg/context/)
* Michael Štrba: [Context should go away for Go 2](https://faiface.github.io/post/context-should-go-away-go2/)
* Jack Lindamood: [How to correctly use context.Context in Go 1.7](https://medium.com/@cep21/how-to-correctly-use-context-context-in-go-1-7-8f2c0fafdf39)

## Tools Easing the Programmer's Life

* [Gitpod: Go Quickstart](https://www.gitpod.io/docs/quickstart/go) - Quickly setup a free, cloud hosted go development environment.
