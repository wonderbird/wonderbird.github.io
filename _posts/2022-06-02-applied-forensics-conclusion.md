---
layout: post
title:  "Applied Software Forensics - Conclusion"
---

## Recommended Approach

Especially for Open Source projects I would start by analyzing the social aspects of the project:

- Find official project information, e.g. who are the maintainers?
- [What are the development cycles and who are the main contributors](/2022/03/23/applied-forensics-development-cycles.html)?
- [What ist the team's Modus Operandi](/2022/06/02/how-the-team-works.html)?

This provides important insights about

- Is the project still alive?
- Whom to ask in case of questions?
- What is currently on the team's mind?

Next we can dive into the technical aspects by analyzing

- [Hotspots](/2022/02/21/applied-forensics-hotspots.html) and [hotspot complexity (trends)](/2022/02/26/applied-forensics-complexity-of-hotspots.html),
- [Temporal coupling](/2022/04/01/applied-forensics-temporal-coupling.html) and [associated trends](/2022/05/10/applied-forensics-trend-of-coupling.html),
- [Architectural coupling, test coupling and associated trends](/2022/05/23/safety-net-for-architecture.html).

TODO Now that we have an overview about people and technical implementation, we can move to social aspects described in part III of [Your Code as a Crime Scene](https://pragprog.com/titles/atcrime/your-code-as-a-crime-scene/).
