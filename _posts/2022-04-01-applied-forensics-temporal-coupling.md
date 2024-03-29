---
layout: post-with-latest-d3
title:  "Applied Software Forensics - Temporal Coupling in HospitalRun"
---

<!-- doctoc --maxlevel 4 /Users/stefan/source/wonderbird/wonderbird.github.io/_posts/2022-04-01-applied-forensics-temporal-coupling.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Results](#results)
  - [Sum of Coupling (SoC)](#sum-of-coupling-soc)
  - [Coupling of Individual Modules](#coupling-of-individual-modules)
- [Performing a Temporal Coupling Analysis](#performing-a-temporal-coupling-analysis)
  - [Overview: Sum of Coupling (SoC)](#overview-sum-of-coupling-soc)
  - [Measure Temporal Coupling on File Level](#measure-temporal-coupling-on-file-level)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Results

#### Sum of Coupling (SoC)

For the time period of 11/2019 to 11/2020, the column "SoC" in the following
table shows how often each file has been committed together with other files.
Among others this top 10 list includes the hotspots from the previous analyses:
`ViewPatient*.tsx`, `HospitalRun*.tsx` and `patient-slice.ts`.

<table>
  <thead>
    <caption>Sum of Coupling</caption>
    <tr>
      <th>SoC</th>
      <th style="text-align: left">Module</th>
    </tr>
  </thead>

  <tbody>
    {% for entry in site.data.hospitalrun.coupling.sum %}
    <tr>
      <td>{{ entry.soc }}</td>
      <td style="text-align: left">{{ entry.entity }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

#### Coupling of Individual Modules

The following diagram depicts the coupling between hotspots and their
dependencies. Hover over the connection lines to see the percent of coupling,
i.e. in how many percent of commits the partner is also changed.

<div id="hotspots-overview">
</div>
{% include d3-chord-diagram.html %}

Figure 1: Dependencies of the Selected Main Hotspots

The basis of the diagram are these coupling tables. The `revs` value
is the number of revisions considered:

{% include hospitalrun/change-coupling-table.html
   caption="Coupling of view/ViewPatient.tsx"
   coupling-data=site.data.hospitalrun.coupling.viewpatient %}

{% include hospitalrun/change-coupling-table.html
   caption="Coupling of src/HospitalRun.tsx"
   coupling-data=site.data.hospitalrun.coupling.hospitalrun %}

{% include hospitalrun/change-coupling-table.html
   caption="Coupling of patient-slice.ts"
   coupling-data=site.data.hospitalrun.coupling.patient-slice %}

### Performing a Temporal Coupling Analysis

#### Overview: Sum of Coupling (SoC)

The analysis is based on the git history for all repositories making up the system.

```sh
cd ../analysis

# Prepend the component path to all changed files in each evo log
for SUT in frontend server components; do \
  TARGET="${SUT}_evo_with_extra_path.log"; \
  rm $TARGET; \
  cat ${SUT}_evo.log | awk -F '\t' "{ if (NF == 3) { print \$1 \"\\t\" \$2 \"\\t\" \"$SUT/\" \$3 } else { print \$0 } }" >> $TARGET; \
done

# Combine all logs into a single log
python $MAAT_SCRIPTS/combine-repos/combine_repos.py frontend_evo_with_extra_path.log \
                                                    server_evo_with_extra_path.log \
                                                    components_evo_with_extra_path.log \
                                                    --output all_evo.log


# Sum of Coupling
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a soc > all_sum_of_coupling.csv

# Remove excluded files from evo.log
for FILE in $(cat cloc-exclude-files.txt); do sed -i '' "/$FILE/d" all_sum_of_coupling.csv; done

# Use only the top 10 files
head -n 11 all_sum_of_coupling.csv > all_sum_of_coupling_top10.csv

# Convert the csv files to json for processing them with jekyll (just for this website)
csv2json -o sum.json all_sum_of_coupling_top10.csv
```

#### Measure Temporal Coupling on File Level

```sh
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a coupling > all_coupling.csv
```

##### Filter By Hotspot

The [Rainbow CSV Plugin for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) allows experimenting with CSV file filters in a WYSIWIG way.

Once you have found the filter query, you can use the [RBQL CLI](https://www.npmjs.com/package/rbql#using-rbql-as-command-line-tool) to filter the CSV file from the command line:

```sh
# Install the rbql cli
npm install -g rbql

export QUERY="SELECT * WHERE LIKE(a1, '%view/ViewPatient%') || LIKE(a2, '%view/ViewPatient%') ORDER BY a3, a4 DESC WITH (header)"; \
rbql-js --delim "," --query "$QUERY" < all_coupling.csv > viewpatient_coupling.csv

export QUERY="SELECT * WHERE LIKE(a1, '%src/HospitalRun.tsx%') || LIKE(a2, '%src/HospitalRun.tsx%') ORDER BY a3, a4 DESC WITH (header)"; \
echo $QUERY; rbql-js --delim "," --query "$QUERY" < all_coupling.csv > hospitalrun_coupling.csv

export QUERY="SELECT * WHERE LIKE(a1, '%patient-slice.ts%') || LIKE(a2, '%patient-slice.ts%') ORDER BY a3, a4 DESC WITH (header)"; \
rbql-js --delim "," --query "$QUERY" < all_coupling.csv > patient-slice_coupling.csv

# Convert the csv files to json for processing them with jekyll (just for this website)
csv2json -o viewpatient_coupling.json viewpatient_coupling.csv; \
csv2json -o hospitalrun_coupling.json hospitalrun_coupling.csv; \
csv2json -o patient-slice_coupling.json patient-slice_coupling.csv;
```

##### Visualize Temporal Coupling

The diagram above was created using a [D3.js chord diagram](https://observablehq.com/@d3/chord-dependency-diagram).
You can inspect the associated JavaScript here:
[d3-chord-diagram.html](https://github.com/wonderbird/wonderbird.github.io/blob/main/_includes/d3-chord-diagram.html).

The data from the previously created CSV files is transferred to the JavaScript
variables `names` and `matrix`. In the `matrix` each line and each column
represents the files in the `names` array. The numbers specify the coupling
between the file associated with a line and the file associated with a column.
