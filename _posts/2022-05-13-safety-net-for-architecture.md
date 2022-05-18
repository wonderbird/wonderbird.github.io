---
layout: post
title:  "Applied Software Forensics - HospitalRun Architecture Safety Net"
---

<!-- doctoc --maxlevel 4 $HOME/source/wonderbird/wonderbird.github.io/_posts/2022-05-13-safety-net-for-architecture.md -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Results](#results)
- [Analyzing Coupling on an Architectural Level](#analyzing-coupling-on-an-architectural-level)
  - [Configuration](#configuration)
  - [Level 1: Coupling on System Level](#level-1-coupling-on-system-level)
  - [Level 2: Coupling for the Top Level of the Frontend](#level-2-coupling-for-the-top-level-of-the-frontend)
  - [Coupling of Frontend Code and Tests](#coupling-of-frontend-code-and-tests)
  - [Trend of Coupling of Frontend Code and Tests](#trend-of-coupling-of-frontend-code-and-tests)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
### Results

#### Level 1: Coupling on System Level

For the time period of Nov. 2019 to Nov. 2020 there is no significant temporal coupling across the repositories
[frontend](https://github.com/HospitalRun/hospitalrun-frontend/tree/v2.0.0-alpha.7),
[server](https://github.com/HospitalRun/hospitalrun-server/tree/v2.0.0-alpha.5) and
[components](https://github.com/HospitalRun/components/tree/v3.0.3).

#### Level 2: Coupling for the Top Level Modules of the Frontend

##### Observation

Analyzing the coupling for the top level frontend modules reveals 51% coupling for `patients` and `__tests__`. Other significant coupling is not shown.

##### Coupling of Module and Associated Tests

Digging deeper shows that several top level frontend modules are coupled to their associated tests:

<table>
    <thead>
        <caption>Coupling Between Components and Associated Tests</caption>
        <tr>
        <th style="text-align: left">entity</th>
        <th style="text-align: left">coupled</th>
        <th>degree</th>
        <th>average-revs</th>
        </tr>
    </thead>

    <tbody>
        {% for entry in site.data.hospitalrun.coupling.frontend-modules-tests %}
        <tr>
        <td style="text-align: left">{{ entry.entity }}</td>
        <td style="text-align: left">{{ entry.coupled }}</td>
        <td>{{ entry.degree }}</td>
        <td>{{ entry.average-revs }}</td>
        </tr>
        {% endfor %}
    </tbody>
</table>

The **number of revisions** column shows the highest development activity for the `patients` module. This explains why the previous higher level coupling analysis showed only coupling between `patients` and `__tests__`.

In general, the table above looks fine to me. It shows the modules with development activity and it shows, that tests are maintained for those modules.

As I do not know the code base well enough, I cannot judge whether coupling values above 50% indicate too tight coupling.

##### Coupling Across Components

TODO Idea: Remove the tests from the analysis for now. The test coupling might overshadow coupling across modules.

#### Coupling of Frontend Code and Tests

### Analyze Coupling on an Architectural Level

#### Trend of Coupling of Frontend Code and Tests

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

For me, the output is empty. I assume that there is no significant coupling on the top level :-)

#### Analyze Level 2: Coupling for the Top Level of the Frontend

The top level modules making up the `frontend` are described in `frontend_boundaries.txt`:

```sh
# Run the following command from the "analysis" folder
#
# Create a boundaries file from all module folders within a directory.
#
# Algorithm:
#   Find all directories below ../frontend/src
#     skip the ../frontend/src directory
#     let \1 be the parent directory of the module
#     let \2 be the module directory
#     remove leading '../frontend/'
#     print \1\2 => \1
find ../frontend/src -type d -maxdepth 1 \
  | grep -E --invert-match '^.*\/src$' \
  | sed 's/^\.\.\/frontend\/\(.*\/\)\(.*\)/\1\2 => \2/' \
  > frontend_boundaries.txt

# Analyse coupling
# (note: the frontend_evo.log contains the development from Nov. 2019 - Nov. 2020)
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo.log -c git -a coupling -g /data/frontend_boundaries.txt
```

The output is

```text
entity,coupled,degree,average-revs
__tests__,patients,51,246
```

To dig deeper, map the tests for each module to the module itself:

```sh
find ../frontend/src -type d -maxdepth 1 \
  | grep -E --invert-match '(^.*\/src$)|(^.*\/src/__tests__$)' \
  | sed 's/^\.\.\/frontend\/\(.*\/\)\(.*\)/\1\2 => \2/' \
  > frontend_modules_tests_boundaries.txt; \
\
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

The associated json file for this website is created by

```sh
csv2json -o frontend_modules_tests_coupling.json frontend_modules_tests_coupling.csv
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

#### Analyze the Trend of Coupling of Frontend Code and Tests

For Nov. 2019 - Nov. 2020 the overall coupling of code and test was

```text
entity,coupled,degree,average-revs
Code,Tests,37,633
```

Use the git history files created in the
[Trend of Coupling Analysis](2022/05/10/applied-forensics-trend-of-coupling.html)
to find the trend of coupling in quarterly intervals:

```sh
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo_201911P3M.log -c git -a coupling -g /data/frontend_code_test_boundaries.txt; \
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo_202002P3M.log -c git -a coupling -g /data/frontend_code_test_boundaries.txt; \
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo_202005P3M.log -c git -a coupling -g /data/frontend_code_test_boundaries.txt; \
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo_202008P3M.log -c git -a coupling -g /data/frontend_code_test_boundaries.txt
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
