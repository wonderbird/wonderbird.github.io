---
title: Software Testing
layout: default
---

# Software Testing

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Books on Testing](#books-on-testing)
- [Rationale](#rationale)
- [Websites and Articles on Testing](#websites-and-articles-on-testing)
- [Research on TDD](#research-on-tdd)
- [Miscellaneous](#miscellaneous)
- [Tools and Ideas](#tools-and-ideas)
  - [Property Based Testing](#property-based-testing)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Books on Testing

* Andreas Spillner, Tilo Linz: [Basiswissen Softwaretest](https://www.google.de/books/edition/Basiswissen_Softwaretest/kl-bDwAAQBAJ?hl=de&gbpv=0) (in German) - Aus- und Weiterbildung zum Certified Tester – Foundation Level nach ISTQB®-Standard.

* Roy Osherove: The Art of Unit Testing, 2nd Edittion, Manning Publications Co. November 2013. ISBN 9781617290893. https://www.manning.com/books/the-art-of-unit-testing-second-edition

## Rationale for Testing (in General)

All literature I have found up to now agrees that automated software testing is an essential integral part of the software development process.

In chapter 4 "Technical Practices" of [Accelerate: The Science of DevOps](https://itrevolution.com/book/accelerate/) the authors state:

> Testing is not something that we should only start once a feature or a release is “dev complete.” Because testing is so essential, we should be doing it all the time as an integral part of the development process. Automated unit and acceptance tests should be run against every commit to version control to give developers fast feedback on their changes. Developers should be able to run all automated tests on their workstations in order to triage and fix defects. Testers should be performing exploratory testing continuously against the latest builds to come out of CI. No one should be saying they are “done” with any work until all relevant automated tests have been written and are passing.

More prominent and widely accepted opinions are given in the following works (sorted by descending date):

* David Thomas and Andrew Hunt: [The Pragmatic Programmer, 20th Anniversary Edition](https://pragprog.com/titles/tpp20/the-pragmatic-programmer-20th-anniversary-edition/), The Pragmatic Bookshelf, September 2019. ISBN 9780135957059.

* Nicole Forsgen, Jez Humble and Gene Kim: [Accelerate: The Science of DevOps](https://itrevolution.com/book/accelerate/), IT Revolution Press, 2018. ISBN 9781942788331.

* Martin Fowler, Don Roberts, John Brant, William Opdyke, Kent Beck, Paul Becker, Erich Gamma: [Refactoring - Improving the Design of Existing Code](https://www.google.de/books/edition/Refactoring/1MsETFPD3I0C?hl=de). 2nd Edition, Addison-Wesley, 2018.

* Jez Humble: [Evidence and case studies](https://continuousdelivery.com/evidence-case-studies/) in Jez Humble: [Continuous Delivery](https://continuousdelivery.com/), Website, pulished presumably in 2017, last visited on May 31, 2021.

* Gene Kim, Jez Humble, Patrick Debois, and John Willis: [The DevOps Handbook](https://itrevolution.com/the-devops-handbook/), IT Revolution Press, 2016. ISBN 1942788002.

* Michael Feathers: [Working Effectively with Legacy Code](https://www.google.de/books/edition/Working_Effectively_with_Legacy_Code/fB6s_Z6g0gIC?hl=de&gbpv=0). USA, Pearson Education, 2004. ISBN 9780132931755, 0132931753

* Robert C. Martin: [Clean Code: A Handbook of Agile Software Craftsmanship](https://www.google.de/books/edition/Clean_Code/_i6bDeoCQzsC?hl=de&gbpv=0), Pearson Education, 2008. ISBN 978-0132350884.

## Websites and Articles on Testing

* [ISTQB: International Software Testing Qualification Board](https://www.istqb.org/) - The international standard in training and certification of software testers.

* Roy Osherove: [The four most common root causes that slow down enterprise continuous delivery](https://pipelinedriven.org/article/the-four-most-common-root-causes-that-slow-down-enterprise-continuous-delivery) - Anti-Patterns reducing team performance.

## Research on TDD

**Annotations**

| Annotation | Description |
| ---------- | ----------- |
| 🤝 | Link was provided by [Daniel Spicher](https://twitter.com/dsp_de) via [Michael Mahlberg](https://twitter.com/MMahlberg). Thank you! :-) |
| 🔓 | Open Access Publication :-) |

* Caspers Jones: "Chapter 59: Test-Driven Development (TDD)" in Caspers Jones: [Software Methodologies - A Quantitative Guide](https://www.routledge.com/Software-Methodologies-A-Quantitative-Guide/Jones/p/book/9781138033085), pp. 467 - 471, CRC Press Taylor & Francis Group, LLC, 2018. ISBN 978-1-138-03308-5.

* 🤝🔓 Mohammad Ghafari, Timm Gross, Davide Fucci, and Michael Felderer: [Why Research on Test-Driven Development is Inconclusive?](https://arxiv.org/abs/2007.09863) in Proceedings of the 14th ACM / IEEE International Symposium on Empirical Software Engineering and Measurement (ESEM) (ESEM '20). Association for Computing Machinery, New York, NY, USA, Article 25, 1–10. 2020. DOI:https://doi.org/10.1145/3382494.3410687

  * this current **meta** study is somewhat pessimistic about the current state of research
  * objective: identify factors contributing to the inconclusing research results on tdd so that scientists can improve their study design
  * value: use this study as a starting point for further research
    
* 🤝🔓 D. Fucci, H. Erdogmus, B. Turhan, M. Oivo and N. Juristo: [A Dissection of the Test-Driven Development Process: Does It Really Matter to Test-First or to Test-Last?](https://arxiv.org/abs/1611.05994) in IEEE Transactions on Software
Engineering, vol. 43, no. 7, pp. 597-614, 1 July 2017, DOI:https://doi.org/10.1109/TSE.2016.2616877.

  * "Conclusion: The claimed benefits of TDD may not be due to its distinctive test-first dynamic, but rather due to the fact that TDD-like processes encourage fine-grained, steady steps that improve focus and flow."
  * refers to caveats regarding refactoring
  * discusses the tdd approach and variations of it

* 🤝 [Old studies by Laurie Williams regarding TDD](https://scholar.google.com/scholar?q=Laurie+Williams+test)

## Miscellaneous

* Lisa Crispin: [Using the Agile Testing Quadrants](https://lisacrispin.com/2011/11/08/using-the-agile-testing-quadrants/)

## Tools and Ideas

- [TextTest regression tests](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/main/texttests) - Test-Based Approval tests for the GildedRose refactoring kata.

- [MailDev](https://github.com/maildev/maildev) - test your project's generated emails during development.

### Property Based Testing

* Koen Claessen: [QuickCheck: Automatic testing of Haskell programs](https://hackage.haskell.org/package/QuickCheck) - Property based testing for Haskell ([associated GitHub project](https://github.com/nick8325/quickcheck))

* David R. MacIver: [HypothesisWorks / hypothesis](https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python) - Property based testing for python.

* [Go Package quick](https://golang.org/pkg/testing/quick/) - Property based testing for Go.

### Fuzzing / Fuzz Testing

* Vincent Blanchon: [Go: Fuzz Testing in Go](https://medium.com/a-journey-with-go/go-fuzz-testing-in-go-deb36abc971f) - A short introductory article for Go.
* Dmitry Vyukov: [go-fuzz](https://github.com/dvyukov/go-fuzz) - A coverage-guided fuzzing solution for testing of Go packages.
* Google: [gofuzz](https://github.com/google/gofuzz) - A library for populating go objects with random values.
* [Jazzer](https://github.com/CodeIntelligenceTesting/jazzer) - A coverage-guided, in-process fuzzer for the JVM platform.
* [Atheris](https://github.com/google/atheris) - A Coverage-Guided, Native Python Fuzzer.
* [OSS-Fuzz](https://google.github.io/oss-fuzz/) - Combining modern fuzzing techniques with scalable, distributed execution for open source projects.
