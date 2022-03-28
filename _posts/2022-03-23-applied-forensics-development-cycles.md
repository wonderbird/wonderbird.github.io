---
title:  "Applied Software Forensics - Development Cycles and Main Authors"
layout: post-with-gallery
---

<!-- doctoc --maxlevel 4 /Users/stefan/source/wonderbird/wonderbird.github.io/_posts/2022-03-23-applied-forensics-development-cycles.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Results](#results)
  - [Development Cycles Over the Entire Project History](#development-cycles-over-the-entire-project-history)
  - [Development Activity in 2019 and 2020](#development-activity-in-2019-and-2020)
  - [Author Activity in 2019 and 2020](#author-activity-in-2019-and-2020)
  - [Conclusion](#conclusion)
- [Identifying Development Cycles and Author Contributions](#identifying-development-cycles-and-author-contributions)
  - [Prerequisites](#prerequisites)
  - [Collecting the Data](#collecting-the-data)
  - [Selecting the Development Cycle Visualization](#selecting-the-development-cycle-visualization)
  - [Focussing on a Development Cycle](#focussing-on-a-development-cycle)
  - [Selecting the Author Contribution Visualisation](#selecting-the-author-contribution-visualisation)
  - [Generating the Author Contribution Table](#generating-the-author-contribution-table)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Results

#### Development Cycles Over the Entire Project History

{% include gallery.html id="FrontendDevCycles" folder="hospitalrun/analysis/development-cycles/alltime"
   images="frontend-commits_by_year_month.png,server-commits_by_year_month.png,components-commits_by_year_month.png"
   captions="Frontend: Commits by Year and Month,Server: Commits by Year and Month,Components: Commits by Year and Month" %}

The [frontend](https://github.com/HospitalRun/hospitalrun-frontend) and the
[server](https://github.com/HospitalRun/hospitalrun-server) components were
started at nearly the same time in spring 2014. Until 2019 these two modules
were developed in parallel, but the number of commits over time shows that the
`frontend` clearly had more attention.

In November 2019 the `components` repository was created.

The diagrams show a yearly development cycle stretching roughly from November to November.

#### Development Activity in 2019 and 2020

The diagrams above indicate that there is a yearly rhythm of development lasting
from November to November. This is emphasised in the commit history of 11/2019
to 11/2020. In this time period the overall number of commits increased a lot.

**No coincidence?** The changes in the development cycle happened after [Maksim
Sinik has become the new Maintainer of the HospitalRun
project](https://hospitalrun.io/blog/a-new-beginning-copy/) on August 7, 2019.

Basically at the same time - on August 6, 2019 - Maksim [reset the frontend
project](https://github.com/HospitalRun/hospitalrun-frontend/commits/8564221bcbfac0b27cfcefa5ed30ef1dc72f5a16).
A branch named `1.0.0-beta` was created and next, all files were deleted from
`master`. Matteo Vivona [committed a similar change to the server
project](https://github.com/HospitalRun/hospitalrun-server/commit/4dfc380e209495cf525201637358e32f48a48f2e)
on August 7, 2019. I have not checked (yet) whether files or file content was
transferred from the `1.0.0-beta` branches back to the new `master`.

As a consequence, the subsequent sections focus on the time period from 11/2019
to 11/2020:

{% include gallery.html id="DevCycles2019" folder="hospitalrun/analysis/development-cycles/2019-2020"
   images="frontend-commits_by_year_month.png,server-commits_by_year_month.png,components-commits_by_year_month.png"
   captions="Frontend: Commits by Year and Month (2019-2020),Server: Commits by Year and Month in (2019-2020),Components: Commits by Year and Month (2019-2020)" %}

Analyzing the repositories using [gitstat](https://github.com/gktrk/gitstats)
shows, that the development activity reached a peak in February 2020. It slowed
down in the summer season. For the `frontend`, there was another period of
increased activity in September. For all components the development activity
decreased towards the date of release `2.0.0-alpha.7`.

#### Author Activity in 2019 and 2020

##### Frontend (2019-2020)

{% include gallery.html id="FrontendActivity20192020" folder="hospitalrun/analysis/development-cycles/2019-2020"
   images="frontend-commits_by_author.png,frontend-loc_by_author.png"
   captions="Frontend: Commits by Author (2019-2020),Frontend: Cumulated Added Lines of Code per Author (2019-2020)" %}

For the `frontend` Jack Meyer and Matteo Vivona show constant development activity
throughout the year. Jack adds significantly more lines of code than any other
author.

The following table shows the top 5 human contributors along with the bots. It
is sorted by number of lines added.

{% include hospitalrun/main-authors-table.html
   component="Frontend"
   years="2010 and 2020"
   author-data=site.data.hospitalrun.main-authors-2019.frontend %}

The table confirms that for `frontend` code Jack Meyer clearly provided the most
churn. He contributed about 27.000 lines of code and deleted nearly 14.000 lines
in 286 commits.

He is followed by Matthew Dorner and Matteo Vivona. Matthew seems to contribute
his share in active cycles of a few days while Matteo creates many small
commits during the entire period.

##### Components (2019-2020)

{% include gallery.html id="ComponentsActivity20192020" folder="hospitalrun/analysis/development-cycles/2019-2020"
   images="components-commits_by_author.png,components-loc_by_author.png"
   captions="Components: Commits by Author (2019-2020),Components: Cumulated Added Lines of Code per Author (2019-2020)" %}

In the `components` module Matteo creates a steady stream of commits.

In spring 2020, Stefano Casasola has contributed most code. However, this
seems to have been his only major activity throughout the development cycle.
ocBruno shows similar activity and Matthew Dorner was mainly active in early
summer. Other developers show a more steady behaviour.

{% include hospitalrun/main-authors-table.html
   component="Components"
   years="2010 and 2020"
   author-data=site.data.hospitalrun.main-authors-2019.components %}

##### Server (2019-2020)

{% include gallery.html id="ServerActivity20192020" folder="hospitalrun/analysis/development-cycles/2019-2020"
   images="server-commits_by_author.png,server-loc_by_author.png"
   captions="Server: Commits by Author (2019-2020),Server: Cumulated Added Lines of Code per Author (2019-2020)" %}

{% include hospitalrun/main-authors-table.html
   component="Server"
   years="2010 and 2020"
   author-data=site.data.hospitalrun.main-authors-2019.server %}

For the `server` component only Maksim, Matteo and Jack provided significant
contributions in 2019. However, the overall evolution of this component is
rather slow when compared to `frontend` and `components`. This is also reflected
in the earlier post on [Hotspot
Analysis](/2022/02/21/applied-forensics-hotspots.html).

#### Conclusion

Compared to the earlier years of the project, the development activity was
increased from 11/2019 to 11/2020. In general, the `frontend` gets most
attention, followed by the `components` module.

Main contributors from 11/2019 to 11/2020 were

- Jack Meyer (frontend)
- Matthew Dorner (frontend, components)
- Matteo Vivona (frontend, components, server)
- ocBruno (frontend, components)
- Maksim Sinik (frontend)
- Stefano Casasola (components)
- Bruno Costa (components)
- Maksim Sinik (server)
- Jack Meyer (server)

If any contributor feels that I have overlooked her or him, please contact me. I
took the numbers from GitHub for the evaluation above. I assume there might be
mistakes in my evaluation.

#### Development Activity in 2020 and 2021

From the development cycle I would have assumed that there was a release in
November 2020. Because there are no associated tags on the repository, I was
afraid that the project received less attention in 2020.

{% include gallery.html id="DevCycles2020" folder="hospitalrun/analysis/development-cycles/2020-2021"
   images="frontend-commits_by_year_month.png,server-commits_by_year_month.png,components-commits_by_year_month.png"
   captions="Frontend: Commits by Year and Month (2020-2021),Server: Commits by Year and Month (2020-2021),Components: Commits by Year and Month (2020-2021)" %}

Note: As of March 25, 2022, the last commit to the [components
repository](https://github.com/hospitalrun/components) was made on October 22,
2021.

#### Author Activity in 2020 and 2021

##### Frontend (2020-2021)

{% include gallery.html id="FrontendActivity20202021" folder="hospitalrun/analysis/development-cycles/2020-2021"
   images="frontend-commits_by_author.png,frontend-loc_by_author.png"
   captions="Frontend: Commits by Author (2020-2021),Frontend: Cumulated Added Lines of Code per Author (2020-2021)" %}

{% include hospitalrun/main-authors-table.html
   component="Frontend"
   years="2020 and 2021"
   author-data=site.data.hospitalrun.main-authors-2020.frontend %}

##### Components (2020-2021)

{% include gallery.html id="ComponentsActivity20202021" folder="hospitalrun/analysis/development-cycles/2020-2021"
   images="components-commits_by_author.png,components-loc_by_author.png"
   captions="Components: Commits by Author (2020-2021),Components: Cumulated Added Lines of Code per Author (2020-2021)" %}

{% include hospitalrun/main-authors-table.html
   component="Components"
   years="2020 and 2021"
   author-data=site.data.hospitalrun.main-authors-2020.components %}

##### Server (2020-2021)

{% include gallery.html id="ServerActivity20202021" folder="hospitalrun/analysis/development-cycles/2020-2021"
   images="server-commits_by_author.png,server-loc_by_author.png"
   captions="Server: Commits by Author (2020-2021),Server: Cumulated Added Lines of Code per Author (2020-2021)" %}

{% include hospitalrun/main-authors-table.html
   component="Server"
   years="2020 and 2021"
   author-data=site.data.hospitalrun.main-authors-2020.server %}


TODO: Describe observations for 2020, 2021, 2022

### Identifying Development Cycles and Author Contributions

#### Prerequisites

```sh
# Prerequisite: Get gitstats (requires gnuplot and python)
brew install gnuplot

# Clone gitstats and export its path to an environment variable
git clone https://github.com/gktrk/gitstats.git
export GITSTATS=$HOME/source/gktrk/gitstats
```

#### Collecting the Data

```sh
# Identify the development cycles for the different modules
for MODULE in frontend server components; do \
  rm -vr "analysis/${MODULE}-gitstats"; \
  cd "$MODULE" || break; \
  python "$GITSTATS/gitstats" ./ "../analysis/${MODULE}-gitstats"; \
  cd ".."
done

# Open the analysis in a browser
open ../analysis/frontend-gitstats/index.html
```

#### Selecting the Development Cycle Visualization

In the top section I am showing the **Analysis &rarr; Commits by Year / Month** diagram for each component.

#### Focussing on a Development Cycle

If you would like to select a specific start date for the analysis, then pass
the `-c start-date` parameter to `gitstats`:

```sh
MODULE=FRONTEND \
python "$GITSTATS/gitstats" -c start_date=2019-11-07  ./ "../analysis/${MODULE}-gitstats"
```

This allows focussing on the time range defined by the start date and the date of the current working directory commit.

In order to find an appropriate end date, you can search the git history, by
a desired month:

```sh
YEAR=2021; \
MONTH=11; \
TIMEZONE=+0100; \
AFTER_DATE=$(date -j -v-1d -f "%4Y-%m-%d %H:%M:%S %z" +%Y-%m-%d "${YEAR}-${MONTH}-01 00:00:00 ${TIMEZONE}"); \
BEFORE_DATE=$(date -j -f "%4Y-%m-%d %H:%M:%S %z" +%Y-%m-%d "${YEAR}-$((MONTH+1))-01 00:00:00 ${TIMEZONE}"); \
git log --pretty=format:'[%h] %ad %s' --date=short --after=$AFTER_DATE --before=$BEFORE_DATE
```

Then you can checkout to the identified commit hash.

#### Selecting the Author Contribution Visualisation

In order to show when the main authors work and how frequently they commit, I
have selected the **Authors &rarr; Commits by Author** diagram for each
component.

The **Authors &rarr; Cumulated Added Lines of Code per Author** diagrams
visualize the amount of effort each main author spends.

Note that the diagrams usually have a transparent background. To remove
transparency and have a white background I use the following command from
imagemagick:

```sh
mogrify -background white -alpha remove -alpha off PNGFILE.png
```

The thumbnails are generated by

```sh
mogrify -format png -auto-orient -thumbnail 320x -path thumbnails '2019-2020-*by_author.png'
```

#### Generating the Author Contribution Table

The table of author contributions shown above has been generated as follows:

1. Sort the table by `+ lines`
1. Copy paste the HTML table **Authors &rarr; List of Authors** into a file
1. Replace all occurrences of the regex `,\s` by ` - `. This will remove the commas from the field **Age**
1. Remove all `\s*↓` occurrences (cosmetics)
1. Replace all `\t` tab characters by `,` comma
1. Save the file as `authors.csv`, if the file covers the entire analysis period or `authors-2019.csv`, if it covers only one development cycle

If you'd like to generate an HTML table from the file using the [Liquid Template
Language](/pages/software-crafting/static-websites/jekyll.html#liquid-template-language),
then the following steps will help:

1. Remove the ` (%)` suffix in the `Commits (%)` column header
1. Replace the `#` character by the word `Rank`
1. Make all column headers lower case, remove special characters (replace `+` by `added` and `-` by `removed`)
1. Change the column headers to single words by replacing spaces with underscores
1. Convert the csv file to json, which was required for this HTML visualization using `csv2json -o authors.json authors.csv`

Note:

If you like, then shorten the csv file. In the analysis shown above, I have
sorted the file by number of **lines added** and kept the top five contributors.
In addition I ensured that the top 5 committers stay in the file (as indicated
by the **rank by commits**). Accordingly I have renamed the file to
`frontend-authors.csv`
