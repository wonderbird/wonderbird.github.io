---
title: Software Testing
layout: default
---

# Software Testing

> Testing is not something that we should only start once a feature or a release is “dev complete.” Because testing is so essential, we should be doing it all the time as an integral part of the development process. Automated unit and acceptance tests should be run against every commit to version control to give developers fast feedback on their changes. Developers should be able to run all automated tests on their workstations in order to triage and fix defects. Testers should be performing exploratory testing continuously against the latest builds to come out of CI. No one should be saying they are “done” with any work until all relevant automated tests have been written and are passing.

in [Accelerate: The Science of DevOps](https://itrevolution.com/book/accelerate/), p. 79 f.

**Annotations**

| Annotation | Description |
| ---------- | ----------- |
| 🤝 | Link was provided by [Daniel Spicher](https://twitter.com/dsp_de) via [Michael Mahlberg](https://twitter.com/MMahlberg). Thank you! :-) |
| 🔓 | Open Access Publication :-) |

## Websites and Articles on Testing

* [ISTQB: International Software Testing Qualification Board](https://www.istqb.org/) - The international standard in training and certification of software testers.

* Roy Osherove: [The four most common root causes that slow down enterprise continuous delivery](https://pipelinedriven.org/article/the-four-most-common-root-causes-that-slow-down-enterprise-continuous-delivery) - Anti-Patterns reducing team performance.

## Books on Testing

* Roy Osherove: The Art of Unit Testing, 2nd Edittion, Manning Publications Co. November 2013. ISBN 9781617290893. https://www.manning.com/books/the-art-of-unit-testing-second-edition

## Research on TDD

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

### Property Based Testing

* Koen Claessen: [QuickCheck: Automatic testing of Haskell programs](https://hackage.haskell.org/package/QuickCheck) - Property based testing for Haskell ([associated GitHub project](https://github.com/nick8325/quickcheck))

* David R. MacIver: [HypothesisWorks / hypothesis](https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python) - Property based testing for python.

* [Go Package quick](https://golang.org/pkg/testing/quick/) - Property based testing for Go.
