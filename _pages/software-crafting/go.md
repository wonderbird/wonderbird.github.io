---
title: Learning Go
layout: default
---
# Learning Go

- [Learn Go with Tests](https://github.com/quii/learn-go-with-tests)
- [Go Slices: usage and internals](https://blog.golang.org/slices-intro)
- [The Go Playground](https://play.golang.org/)
  - [Slices](https://play.golang.org/p/ICCWcRGIO68)
  - [Copy slices](https://play.golang.org/p/bTrRmYfNYCp)
  - [Why copy a large slice](https://play.golang.org/p/Poth8JS28sc)

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

## Go Frameworks, Libraries and Software

- [Awesome Go](https://awesome-go.com)
- [Testify (assert, mock, suite)](https://github.com/stretchr/testify)

## Go Specific Details

* Dave Cheney: [Five suggestions for setting up a Go project](https://dave.cheney.net/2014/12/01/five-suggestions-for-setting-up-a-go-project) *Package conventions*

* [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments#named-result-parameters) *Good practices for Go*

* [Testable Examples in Go](https://blog.golang.org/examples)
