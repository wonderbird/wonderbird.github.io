---
title: Learning Go
layout: default
---
# Learning Go

To get started ...

- [Learn Go with Tests](https://github.com/quii/learn-go-with-tests)

Where to go next?

Read ...

- [A Tour of Go](https://tour.golang.org/welcome/1) *an interactive tutorial*
- [How to Write Go Code](https://golang.org/doc/code) *demonstrates the development of a simple Go package inside a module and introduces the go tool*
- [Effective Go](https://golang.org/doc/effective_go) *gives tips for writing clear, idiomatic Go code*
- [The Go Programming Language](https://www.google.de/books/edition/The_Go_Programming_Language/t_rzrQEACAAJ)

and inspect [The Go Standard Library](https://golang.org/pkg/)

## Prerequisites

### Installing Go

- Mac users: [Install Go](https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/install-go) in [Learn Go with Tests](https://github.com/quii/learn-go-with-tests)
- Other users: [Go Download and Installation](https://golang.org/doc/install)
- [JetBrains Goland](https://www.jetbrains.com/go/) - also available for free in [JetBrains' Early Access Program](https://www.jetbrains.com/resources/eap/)

### Installation Notes

- on the Mac I needed to add `$HOME/go/bin` to my `$PATH` manually (`~/.zshrc`)

### Installing Go Tools

```shell
go get -u golang.org/x/tools/...
```

### Uninstalling the Go Package on macOS

- [Uninstall Go on macOS](https://blog.dharnitski.com/2019/04/06/uninstall-go-on-mac/)
- Section [Uninstalling Go](https://golang.org/doc/manage-install#uninstalling) in [Managing Go installations](https://golang.org/doc/manage-install)

## Linters

Check whether error returns are handeled correctly in all method calls:

```shell
go get -u github.com/kisielk/errcheck
errcheck
```

## go vet

... tbd

## Go Frameworks, Libraries and Software

* [The Go Standard Library](https://golang.org/pkg/)
* [Awesome Go](https://awesome-go.com)
* [Testify (assert, mock, suite)](https://github.com/stretchr/testify)
* [The Go Playground](https://play.golang.org/)

## Go Specific Details

### General Language Aspects

* [The Go Language Specification](https://golang.org/ref/spec) *... is the reference manual for Go*

* Dave Cheney: [Five suggestions for setting up a Go project](https://dave.cheney.net/2014/12/01/five-suggestions-for-setting-up-a-go-project) *Package conventions*

* [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments#named-result-parameters) *Good practices for Go*

* [Testable Examples in Go](https://blog.golang.org/examples)

### Specific Language Aspects

* [Go Slices: usage and internals](https://blog.golang.org/slices-intro)

* [The Go Playground](https://play.golang.org/)
  * [Slices](https://play.golang.org/p/ICCWcRGIO68)
  * [Copy slices](https://play.golang.org/p/bTrRmYfNYCp)
  * [Why copy a large slice](https://play.golang.org/p/Poth8JS28sc)
  * [Sending to nil channels lasts forever](https://play.golang.org/p/IIbeAox5jKA)

* Go `map`s
  * Dave Cheney: [If a map isn’t a reference variable, what is it?](https://dave.cheney.net/2017/04/30/if-a-map-isnt-a-reference-variable-what-is-it)
  * Andrew Gerrand: [Go maps in action](https://blog.golang.org/maps) in [The Go Blog](https://blog.golang.org/)

* Dave Cheney: [Constant errors](https://dave.cheney.net/2016/04/07/constant-errors)

* Concurrency
  * Chris James: [Concurrency, Goroutines, Channels, Race Detection and Anonymous Functions](https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/concurrency)
  * Rick Beton: [Use a sync.Mutex or a channel?](https://github.com/golang/go/wiki/MutexOrChannel)

* Rob Pike: [The Laws of Reflection](https://blog.golang.org/laws-of-reflection)
