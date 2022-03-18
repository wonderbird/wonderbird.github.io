---
title:  "Applied Software Forensics - Main Author Profiles and Development Cycles"
layout: post
---

<!-- doctoc --maxlevel 4 /Users/stefan/source/wonderbird/wonderbird.github.io/_posts/ -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Results](#results)
  - [Sum of Coupling (SoC)](#sum-of-coupling-soc)
  - [Coupling of Individual Modules](#coupling-of-individual-modules)
  - [Development Cycles for Frontend](#development-cycles-for-frontend)
- [Performing a Temporal Coupling Analysis](#performing-a-temporal-coupling-analysis)
  - [Overview: Sum of Coupling (SoC)](#overview-sum-of-coupling-soc)
  - [Measure Temporal Coupling on File Level](#measure-temporal-coupling-on-file-level)
  - [Find Development Cycles](#find-development-cycles)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Results

#### Main Author Profiles in 2019 and 2020

The following table shows the top 5 contributors and is sorted by number of lines added.

<table>
  <thead>
    <caption>Main Author Contributions in 2019 and 2020</caption>
    <tr>
      <th>Author</th>
      <th>Commits (%)</th>
      <th>+ lines</th>
      <th>- lines</th>
      <th>First commit</th>
      <th>Last commit</th>
      <th>Age</th>
      <th>Active days</th>
      <th>Rank by commits</th>
    </tr>
  </thead>

  <tbody>
    {% for author in site.data.hospitalrun.main-authors-2019 %}
    <tr>
      <td>{{ author.author }}</td>
      <td>{{ author.commits }}</td>
      <td>{{ author.added_lines }}</td>
      <td>{{ author.removed_lines }}</td>
      <td>{{ author.first_commit }}</td>
      <td>{{ author.last_commit }}</td>
      <td>{{ author.age }}</td>
      <td>{{ author.active_days }}</td>
      <td>{{ author.rank_by_commits }}</td>
    </tr>
    {% endfor %}
  </tbody>

</table>

For frontend code Jack Meyer clearly provided the most churn. He contributed
about 27.000 lines of code and deleted nearly 14.000 lines in 286 commits.

He is followed by Matthew Dorner and Matteo Vivona. Matthew seems to contribute
his share in active cycles of a few days while Matteo creates many small
commits during the entire period.

TODO: Show the diagrams about Commits by Author and Lines of Code added by Author

#### Development Cycles Over the Entire Project History

![Frontend Commits by Year and Month](/assets/img/hospitalrun/analysis/development-cycles/alltime-frontend-commits_by_year_month.png)

Figure 2: **Frontend** Commits by Year and Month

![Server Commits by Year and Month](/assets/img/hospitalrun/analysis/development-cycles/alltime-server-commits_by_year_month.png)

Figure 3: **Server** Commits by Year and Month

![Components Commits by Year and Month](/assets/img/hospitalrun/analysis/development-cycles/alltime-components-commits_by_year_month.png)

Figure 4: **Components** Commits by Year and Month

From figure 1 and 2 we clearly see: The `frontend` and the `server` were started at the same time in 2014.
Until 2019 these two modules were developed in parallel, but the `frontend` clearly had more attention.

In 2019 the `components` repository was created.

The diagrams show a yearly development cycle stretching roughly from November to November.

#### Development Cycles in 2019 and 2020

The diagrams above indicate that there is a yearly rhythm of development lasting from November to November.
This is emphasised in the commit history of 2020 and 2019 where the number of commits increased much. Thus,
this section focusses on that time period:

![Frontend Commits by Year and Month](/assets/img/hospitalrun/analysis/development-cycles/2019-2020-frontend-commits_by_year_month.png)

Figure 5: **Frontend** Commits by Year and Month in 2019 - 2020

![Server Commits by Year and Month](/assets/img/hospitalrun/analysis/development-cycles/2019-2020-server-commits_by_year_month.png)

Figure 6: **Server** Commits by Year and Month in 2019 - 2020

![Components Commits by Year and Month](/assets/img/hospitalrun/analysis/development-cycles/2019-2020-components-commits_by_year_month.png)

Figure 7: **Components** Commits by Year and Month in 2019 - 2020

Analyzing the repositories using gitstat shows, that the development activity
reached a peak in February 2020. It slowed down in the summer season. For the
frontend, there was increased activity in September. For all components the
development activity decreased towards the date of release 2.0.0-alpha.7.

### Identifying Development Cycles

#### Prerequisites

```sh
# Prerequisite: Get gitstats (requires gnuplot and python)
brew install gnuplot

# Clone gitstats and export its path to an environment variable
git clone https://github.com/gktrk/gitstats.git
export GITSTATS=$HOME/source/gktrk/gitstats
```

#### Identify Development Cycles

##### Collecting the Data

```sh
# Identify the development cycles for the different modules
for module in frontend server components; do \
  rm -vr "analysis/${module}-gitstats"; \
  cd "$module" || break; \
  python "$GITSTATS/gitstats" ./ "../analysis/${module}-gitstats"; \
  cd ".."
done

# Open the analysis in a browser
open ../analysis/frontend-gitstats/index.html
```

##### Generating the Author Contribution Table

The table of author contributions shown above has been generated as follows:

1. Copy paste the HTML table **Authors &rarr; List of Authors** into a file
1. Replace all occurrences of the regex `,\s` by ` - `. This will remove the commas from the field **Age**
1. Remove all `\s*↓` occurrences (cosmetics)
1. Replace all `\t` tab characters by `,` comma
1. Save the file as `authors.csv`, if the file covers the entire analysis period or `authors-2019.csv`, if it covers only one development cycle

If you'd like to generate an HTML table from the file using the [Liquid Template
Language](/pages/software-crafting/static-websites/jekyll.html#liquid-template-language),
then the following steps will help:

1. Replace the `#` character by the word `Rank`
1. Make all column headers lower case, remove special characters (replace `+` by `added` and `-` by `removed`)
1. Change the column headers to single words by replacing spaces with underscores
1. Convert the csv file to json, which was required for this HTML visualization using `csv2json -o authors.json authors.csv`

Note:

If you like, then shorten the csv file. In the analysis shown above, I have
sorted the file by number of **lines added** and kept the top five contributors.
In addition I ensured that the top 5 committers stay in the file (as indicated
by the **rank by commits**). Accordingly I have renamed the file to
`main-authors.csv`

##### Selecting the Development Cycle Visualization

In the top section I am showing the **Analysis &rarr; Commits by Year / Month** diagram for each component.

##### Focussing on a Development Cycle

If you would like to select a specific start date for the analysis, then pass
the `-c start-date` parameter to `gitstats`:

```sh
python "$GITSTATS/gitstats" -c start_date=2019-11-07  ./ "../analysis/${module}-gitstats"
```

This allows focussing on the time range defined by the start date and the date of the current working directory commit.
