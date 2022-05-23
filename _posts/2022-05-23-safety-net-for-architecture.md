---
layout: post
title:  "Applied Software Forensics - HospitalRun Architecture Safety Net"
---

<!-- doctoc --maxlevel 4 $HOME/source/wonderbird/wonderbird.github.io/_posts/2022-05-13-safety-net-for-architecture.md -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Results](#results)
  - [Level 1: Coupling on System Level](#level-1-coupling-on-system-level)
  - [Level 2: Coupling in the Frontend](#level-2-coupling-in-the-frontend)
  - [Coupling of Frontend Code and Tests](#coupling-of-frontend-code-and-tests)
  - [Trend of Frontend and Test Coupling](#trend-of-frontend-and-test-coupling)
  - [Trend of Frontend and Test Growth](#trend-of-frontend-and-test-growth)
  - [Detailed View of Coupling Between Frontend Modules and Associated Tests](#detailed-view-of-coupling-between-frontend-modules-and-associated-tests)
- [Analyze Coupling on an Architectural Level](#analyze-coupling-on-an-architectural-level)
  - [Configuration](#configuration)
  - [Analyze Level 1: Coupling on System Level](#analyze-level-1-coupling-on-system-level)
  - [Analyze Level 2: Coupling in the Frontend](#analyze-level-2-coupling-in-the-frontend)
  - [Analyze Coupling of Frontend Code and Tests](#analyze-coupling-of-frontend-code-and-tests)
  - [Analyze the Trend of Frontend and Tests Coupling](#analyze-the-trend-of-frontend-and-tests-coupling)
  - [Analyze Trend of Frontend and Test Growth](#analyze-trend-of-frontend-and-test-growth)
  - [Get a Detailed View of Coupling Between Frontend Modules and Associated Tests](#get-a-detailed-view-of-coupling-between-frontend-modules-and-associated-tests)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
### Results

#### Level 1: Coupling on System Level

For the time period of Nov. 2019 to Nov. 2020 Code Maat does not report any temporal coupling across the repositories
[frontend](https://github.com/HospitalRun/hospitalrun-frontend/tree/v2.0.0-alpha.7),
[server](https://github.com/HospitalRun/hospitalrun-server/tree/v2.0.0-alpha.5) and
[components](https://github.com/HospitalRun/components/tree/v3.0.3).

#### Level 2: Coupling in the Frontend

The remaining analyses focus on the `frontend`, because it is the largest subsystem and it shows the most active
development.

##### Advice: Separate Inter-Module Coupling Analysis from Module-Test Coupling Analysis

My first analysis of top level module coupling included the `__tests__` folder. Code Maat showed only one entry: The
degree of coupling between `patients` and `__tests__` is 51 %.

This is expected, because in a project with solid tests, a feature file will always be coupled to the assoicated
test to some degree. Whether the value of 51 % is good, can be debated.

However, the absence of other coupling entries puzzled me first. I was expecting to see coupling between the top level
`frontend` modules as well. So, I suspected that the module-test coupling overshadowed inter-module coupling. To avoid
this confusion, I decided to analyze inter-module coupling separately from module-test coupling.

##### Coupling of Top Level Frontend Modules

Code Maat does not report significant coupling among the top level modules of the `frontend`.

In order to see whether I configured Code Maat correctly, I reduced the minimum coupling considered by Code Maat to 10
%. Now some modules with a small amount of coupling are listed. Numbers below 30 % are ok for a healthy code base.

{% include hospitalrun/change-coupling-table.html
   caption="Coupling of Top Level Frontend Modules"
   coupling-data=site.data.hospitalrun.coupling.frontend %}

#### Coupling of Frontend Code and Tests

For the entire period from November 2019 to November 2020 the overall coupling of code and tests was 37 %. Of the 2204
commits in the git history file, 633 referred to a module file and a test file at the same time. According to Section
"Differentiate Between the Level of Tests" in [Your Code as a Crime
Scene](https://pragprog.com/titles/atcrime/your-code-as-a-crime-scene/) (pp. 94), this is a healthy value.

#### Trend of Frontend and Test Coupling

Inspecting how the coupling between frontend and test code evolved on a quarterly basis shows that it stays basically
constant. I consider that a good sign.

In the following "Trend of Coupling of Frontend Code and Tests" diagram, the quarter is shown on the horizontal axis
while the percent of coupling is shown on the vertical axis.

![Trend of Coupling of Frontend Code and Tests](/assets/img/hospitalrun/coupling/frontend_code_test_trend.png)

#### Trend of Frontend and Test Growth

TODO Write section

#### Detailed View of Coupling Between Frontend Modules and Associated Tests

When the `__tests__` and `__mocks__` folders are included in the top level analysis, then a quite strong value of 51%
is shown for `__tests__` and the `patients` module. Other significant coupling is not shown.

Digging deeper shows that several top level frontend modules are coupled to their associated tests:

{% include hospitalrun/change-coupling-table.html
   caption="Coupling Between Components and Associated Tests"
   coupling-data=site.data.hospitalrun.coupling.frontend-modules-tests %}

The **average-revs** column shows the highest development activity for the `patients` module. This explains why the
previous higher level coupling analysis showed only coupling between `patients` and `__tests__`.

In general, the table above looks ok to me. It shows the modules with development activity and it shows, that tests are
maintained for those modules.

As I do not know the code base well enough, I cannot judge whether coupling values above 50 % indicate too tight coupling
or just a "test first" coding style.

### Analyze Coupling on an Architectural Level

#### Configuration

```sh
export MAAT_SCRIPTS=$HOME/source/learn/your-code-as-a-crime-scene/maat-scripts; \
cd $HOME/source/hospitalrun/analysis
```

#### Analyze Level 1: Coupling on System Level

Capture the system level design in `hospitalrun_boundaries.txt`:

```sh
# Specify architectural boundaries on top level
cat << EOF > hospitalrun_boundaries.txt
frontend => frontend
components => components
server => server
EOF

# Analyse coupling
# (note: the all_evo.log contains the development from Nov. 2019 - Nov. 2020)
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a coupling -g /data/hospitalrun_boundaries.txt
```

For me, the output is empty. There is no significant coupling on the top level :-)
Even reducing the minimum coupling considered by Code Maat to 0 does not show any coupling (use the parameter
`--min-coupling 0`):

```sh
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a coupling --min-coupling 0 -g /data/hospitalrun_boundaries.txt
```

#### Analyze Level 2: Coupling in the Frontend

##### Analyze Coupling of Top Level Frontend Modules

The following statement produces the `frontend_boundaries.txt` file containing only the modules on the top level of
`frontend`. For the moment, the `__tests__` and `__mocks__` directories are ignored.

```sh
# Run the following command from the "analysis" folder
#
# Create a boundaries file from all module folders within a directory.
#
# Algorithm:
#   Find all directories below ../frontend/src
#     skip the directories ../frontend/src, ../frontend/src/__tests__ and ../frontend/src/__mocks__
#     let \1 be the parent directory of the module
#     let \2 be the module directory
#     remove leading '../frontend/'
#     print \1\2 => \2
find ../frontend/src -type d -maxdepth 1 \
  | grep -E --invert-match '(^.*\/src$)|(__)' \
  | sed 's/^\.\.\/frontend\/\(.*\/\)\(.*\)/\1\2 => \2/' \
  > frontend_boundaries.txt

# Analyse coupling
# (note: the frontend_evo.log contains the development from Nov. 2019 - Nov. 2020)
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo.log -c git -a coupling -g /data/frontend_boundaries.txt
```

Again, there is no significant coupling.

This time, reducing the minimum coupling considered by Code Maat, shows that there is a bit of coupling between some
modules (note that output is redirected to the file `frontend_coupling.csv`):

```sh
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo.log -c git -a coupling --min-coupling 10 -g /data/frontend_boundaries.txt > frontend_coupling.csv
```

Check the output file `frontend_coupling.csv` to see:

```text
entity,coupled,degree,average-revs
shared,user,18,43
labs,scheduling,18,43
patients,scheduling,17,118
labs,shared,16,48
incidents,labs,16,36
incidents,shared,15,51
patients,shared,13,123
imagings,shared,13,37
```

The table in section [Results](#results) above is based on the `json` version of the `csv` file:

```sh
csv2json -o frontend_coupling.json frontend_coupling.csv
```

#### Analyze Coupling of Frontend Code and Tests

To find out how strong the coupling between the code and the tests is, create the following
`frontend_code_test_boundaries.txt`:

```sh
cat << EOF > frontend_code_test_boundaries.txt
^((?!__tests__)(?!__mocks__).)*$ => Code
^(.*__tests__.*)|(.*__mocks__.*)$ => Tests
EOF

# Analyse coupling
# (note: the all_evo.log contains the development from Nov. 2019 - Nov. 2020)
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo.log -c git -a coupling -g /data/frontend_code_test_boundaries.txt
```

For Nov. 2019 - Nov. 2020 the overall coupling of code and test was

```text
entity,coupled,degree,average-revs
Code,Tests,37,633
```

#### Analyze the Trend of Frontend and Tests Coupling

Use the git history files created in the
[Trend of Coupling Analysis](2022/05/10/applied-forensics-trend-of-coupling.html)
to find the trend of coupling in quarterly intervals:

```sh
for EVO_FILE in frontend_evo_201911P3M.log frontend_evo_202002P3M.log frontend_evo_202005P3M.log frontend_evo_202008P3M.log; do
  docker run -v "$PWD":/data -it code-maat-app -l "/data/$EVO_FILE" -c git -a coupling -g /data/frontend_code_test_boundaries.txt; \
done
```

Output:

```text
entity,coupled,degree,average-revs
Code,Tests,34,266
entity,coupled,degree,average-revs
Code,Tests,42,249
entity,coupled,degree,average-revs
Code,Tests,39,200
entity,coupled,degree,average-revs
Code,Tests,41,130
```

For the section [Results](#results), the output was converted to a csv file `frontend_code_test_coupling_trend.csv` and
a plot was created using the `plot` tool from
[maat-scripts](https://github.com/adamtornhill/maat-scripts/tree/python3/plot):

`frontend_code_test_coupling_trend.csv`:

```csv
entity,coupled,degree,average-revs
Code,Tests,34,266
Code,Tests,42,249
Code,Tests,39,200
Code,Tests,41,130
```

```sh
python "$MAAT_SCRIPTS/plot/plot.py" --column 3 --file "frontend_code_test_coupling_trend.csv"
```

#### Analyze Trend of Frontend and Test Growth

Analyze the number of commits to the code and to the tests: `-a revisions`

```sh
for EVO_FILE in frontend_evo_201911P3M.log frontend_evo_202002P3M.log frontend_evo_202005P3M.log frontend_evo_202008P3M.log; do
  docker run -v "$PWD":/data -it code-maat-app -l "/data/$EVO_FILE" -c git -a revisions -g /data/frontend_code_test_boundaries.txt; \
done
```

Output:

```text
entity,n-revs
Code,1202
Tests,277
entity,n-revs
Code,1137
Tests,540
entity,n-revs
Code,1228
Tests,553
entity,n-revs
Code,538
Tests,257
```

Transform these values to a csv table:

```csv
date, code-growth, test-growth
Q4/2019, 1202, 277
Q1/2020, 1137, 540
Q2/2020, 1228, 553
Q3/2020, 538, 257
```

TODO Create Plot and Convert Data to JSON

#### Get a Detailed View of Coupling Between Frontend Modules and Associated Tests

To dig deeper into module-test coupling, map the tests for each module to the module itself:

```sh
# Print modules and __mocks__
find ../frontend/src -type d -maxdepth 1 \
  | grep -E --invert-match '(^.*\/src$)|(^.*\/src/__tests__$)' \
  | sed 's/^\.\.\/frontend\/\(.*\/\)\(.*\)/\1\2 => \2/' \
  > frontend_modules_tests_boundaries.txt; \
\
# Add directories below src/__tests__
find ../frontend/src/__tests__ -type d -maxdepth 1 \
  | grep -E --invert-match '^.*\/src/__tests__$' \
  | sed 's/^\.\.\/frontend\/\(.*\/\)\(.*\)/\1\2 => \2 tests/' \
  >> frontend_modules_tests_boundaries.txt

docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo.log -c git -a coupling -g /data/frontend_modules_tests_boundaries.txt > frontend_modules_tests_coupling.csv
```

This shows the coupling between a module and the associated tests more precisely:

```text
entity,coupled,degree,average-revs
imagings,imagings tests,88,9
patients,patients tests,69,171
scheduling,scheduling tests,61,52
labs,labs tests,49,27
incidents,incidents tests,40,30
```

The associated json file for this website is created with

```sh
csv2json -o frontend_modules_tests_coupling.json frontend_modules_tests_coupling.csv
```
