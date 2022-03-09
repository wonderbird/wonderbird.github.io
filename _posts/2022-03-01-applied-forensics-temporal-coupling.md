---
layout: post-with-latest-d3
title:  "Applied Software Forensics - Temporal Coupling in HospitalRun"
---

### Results

#### Sum of Coupling (SoC)

The column "SoC" in the following table shows how often each file has been committed together with other files. Among others this top 10 list includes the hotspots from the previous analyses: `ViewPatient*.tsx`, `HospitalRun*.tsx` and `patient-slice.ts`.

<table>
  <thead>
    <caption>Sum of Coupling</caption>
    <tr>
      <th>SoC</th>
      <th style="text-align: left">Module</th>
    </tr>
  </thead>

  <tbody>
    {% for entry in site.data.hospitalrun.sum-of-coupling %}
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

The basis of the diagram are these coupling tables. The `revs` value
is the number of revisions considered:

<table>
  <thead>
    <caption>Coupling of view/ViewPatient.tsx</caption>
    <tr>
      <th style="text-align: left">entity</th>
      <th style="text-align: left">coupled</th>
      <th>degree</th>
      <th>average-revs</th>
    </tr>
  </thead>

  <tbody>
    {% for entry in site.data.hospitalrun.viewpatient_coupling %}
    <tr>
      <td style="text-align: left">{{ entry.entity }}</td>
      <td style="text-align: left">{{ entry.coupled }}</td>
      <td>{{ entry.degree }}</td>
      <td>{{ entry.average-revs }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

<table>
  <thead>
    <caption>Coupling of src/HospitalRun.tsx</caption>
    <tr>
      <th style="text-align: left">entity</th>
      <th style="text-align: left">coupled</th>
      <th>degree</th>
      <th>average-revs</th>
    </tr>
  </thead>

  <tbody>
    {% for entry in site.data.hospitalrun.hospitalrun_coupling %}
    <tr>
      <td style="text-align: left">{{ entry.entity }}</td>
      <td style="text-align: left">{{ entry.coupled }}</td>
      <td>{{ entry.degree }}</td>
      <td>{{ entry.average-revs }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

<table>
  <thead>
    <caption>Coupling of patient-slice.ts</caption>
    <tr>
      <th style="text-align: left">entity</th>
      <th style="text-align: left">coupled</th>
      <th>degree</th>
      <th>average-revs</th>
    </tr>
  </thead>

  <tbody>
    {% for entry in site.data.hospitalrun.patient-slice_coupling %}
    <tr>
      <td style="text-align: left">{{ entry.entity }}</td>
      <td style="text-align: left">{{ entry.coupled }}</td>
      <td>{{ entry.degree }}</td>
      <td>{{ entry.average-revs }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

### Performing a Temporal Coupling Analysis

#### Overview: Sum of Coupling (SoC)

The analysis is based on the git history for all repositories making up the system.

```sh
cd ../analysis

# Combine all git history files into one
rm all_evo.log;  \
for SUT in frontend server components; do \
  cat ${SUT}_evo.log | awk -F '\t' "{ if (NF == 3) { print \$1 \"\\t\" \$2 \"\\t\" \"$SUT/\" \$3 } else { print \$0 } }" >> all_evo.log; \
  echo "" >> all_evo.log; \
done

# Sum of Coupling
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a soc | head -n 11 > all_sum_of_coupling.csv
```

### Measure Temporal Coupling on File Level

```sh
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a coupling > all_coupling.csv
```

#### Filter By Hotspot

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

#### Visualize Temporal Coupling

The diagram above was created using a [D3.js chord diagram](https://observablehq.com/@d3/chord-dependency-diagram).
You can inspect the associated JavaScript here:
[d3-chord-diagram.html](https://github.com/wonderbird/wonderbird.github.io/blob/main/_includes/d3-chord-diagram.html).

The data from the previously created CSV files is transferred to the JavaScript
variables `names` and `matrix`. In the `matrix` each line and each column
represents the files in the `names` array. The numbers specify the coupling
between the file associated with a line and the file associated with a column.
