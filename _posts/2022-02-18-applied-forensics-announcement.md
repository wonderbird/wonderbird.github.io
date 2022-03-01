---
layout: post
title:  "Applied Software Forensics - Start of My Experiment"
---

### Experiment Design

In the following I will describe how to apply the analyses from Adam Tornhill's book [Your Code as a Crime Scene](https://pragprog.com/titles/atcrime/your-code-as-a-crime-scene/) to a new software project.

My intention is to verify the steps recommended in the book on the one hand and to understand the [HospitalRun](https://hospitalrun.io/blog/why-hospitalrun/) project and code base on the other.

In November 2021 I have seen how [CodeScene](https://codescene.io) provides valuable insights for understanding a large code base. Thus want to practice these analysis techniques in order to become faster and better in understanding complex new code. In addition, I hope to find important new issues and improvements for the [HospitalRun System](https://github.com/HospitalRun/hospitalrun).

One positive results of this endeavor would be gaining an architectural overview of the overall system structure of [Hospital Run](https://hospitalrun.io/). I expect to create some chapters from [arc42](https://arc42.org).

In addition I will document identified hotspots of high activity combined with large complexity and information about communication between the project contributors. This documentation will be inspired by the architecture improvement method described by [aim42](https://aim42.org).

Last but not least I hope to learn about the programming paradigms, design patterns and technologies used in the project.

Since this is the first time I am applying the analyses from Adam's book to a new project, I hope to dig out any helpful and relevant information. Also, I hope that there are enough ways to receive answers to my questions - especially about the business logic aspects. I plan to invest at most 3-4 hours per week and hope that this is enough to make and document some helpful progress.

So, after having checked the [HospitalRun Website](https://hospitalrun.io/) I am about to setup an installation on my computer following the [HospitalRun Documentation](https://docs.hospitalrun.io) and the instuctions in the [Github HospitalRun Project](https://github.com/HospitalRun/hospitalrun).

### Analysis Steps

In chapter 15 of [Your Code as a Crime Scene](https://pragprog.com/titles/atcrime/your-code-as-a-crime-scene/), Adam suggests the following steps for an analysis:

#### Start Simple and Then Elaborate As Needed

The links in the following step-by-step instructions lead to the results and the instructions on how perform the corresponding analysis:

1. Perform a [hotspot analysis](2022-02-21-applied-forensics-hotspots.html) to gain a high level view of codebase's condition
1. Inspect [complexity trends](2022-02-26-applied-forensics-complexity-of-hotspots.html) for hotspot candidates
1. Check temporal coupling starting with individual modules
1. If you know the codebase: Specify significant architectural boundaries
1. Analyze temporal coupling on architectural level to spot surprising modification patterns
1. Measure code churn

#### Support Collaboration

1. Use a knowledge map as communication aid
1. If multiple teams are working on the code: Track parallel work and investigate parallel work modules with fractal figures
