---
layout: post-with-gallery
title:  "Applied Software Forensics - Complexity of Hotspots in HospitalRun"
---

<!-- doctoc --maxlevel 4 /Users/stefan/source/wonderbird/wonderbird.github.io/_posts/2022-02-26-applied-forensics-complexity-of-hotspots.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Results](#results)
  - [Hotspots Enriched With Name Quality and Complexity Measures](#hotspots-enriched-with-name-quality-and-complexity-measures)
  - [Trends for Selected Hotspots](#trends-for-selected-hotspots)
- [Extending the Hotspot Analysis](#extending-the-hotspot-analysis)
  - [Judge Power of Names](#judge-power-of-names)
  - [Calculate Complexity](#calculate-complexity)
  - [Visualize Complexity Trends](#visualize-complexity-trends)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Results

#### Hotspots Enriched With Name Quality and Complexity Measures

<table>
  <thead>
    <caption>Hotspots</caption>
    <tr>
      <th rowspan="2">Has good name?</th>
      <th rowspan="2">Revisions</th>
      <th rowspan="2">LOC</th>
      <th colspan="4">Complexity</th>
      <th rowspan="2" style="text-align: left">Module</th>
    </tr>
    <tr>
      <th>Total</th>
      <th>Mean</th>
      <th>SDev</th>
      <th>Max</th>
    </tr>
  </thead>

  <tbody>
    {% for hotspot in site.data.hospitalrun-hotspots-names-complexity %}
    <tr>
      <td>{{ hotspot.has_good_name }}</td>
      <td>{{ hotspot.revisions }}</td>
      <td>{{ hotspot.code }}</td>
      <td>{{ hotspot.total }}</td>
      <td>{{ hotspot.mean }}</td>
      <td>{{ hotspot.sd }}</td>
      <td>{{ hotspot.max }}</td>
      <td style="text-align: left">{{ hotspot.module }}</td>
    </tr>
    {% endfor %}
  </tbody>

</table>

#### Trends for Selected Hotspots

##### ViewPatient.tsx

{% include gallery.html id="ViewPatient" folder="hospitalrun"
   images="ViewPatient.tsx.Total-Trend.png,ViewPatient.tsx.SD-Trend.png,ViewPatient.tsx.Mean-Trend.png"
   captions="Total Complexity for ViewPatient.tsx,Standard Deviation of Complexity for ViewPatient.tsx,Mean Complexity for ViewPatient.tsx" %}

The overall complexity of `ViewPatient` has been growing steadily over the past year. The nearly constant values of mean complexity and standard deviation indicate that the growth is caused by an increase of file length.

##### ViewPatient.test.tsx

{% include gallery.html id="ViewPatientTest" folder="hospitalrun"
   images="ViewPatient.test.tsx.Total-Trend.png,ViewPatient.test.tsx.SD-Trend.png,ViewPatient.test.tsx.Mean-Trend.png"
   captions="Total Complexity for ViewPatient.test.tsx,Standard Deviation of Complexity for ViewPatient.test.tsx,Mean Complexity for ViewPatient.test.tsx" %}

The tests for `ViewPatient` show the same evolution as the class itself. Mean and standard deviation of complexity show an increase towards the end of the observed time period.

##### HospitalRun.tsx

{% include gallery.html id="HospitalRun" folder="hospitalrun"
   images="HospitalRun.tsx.Total-Trend.png,HospitalRun.tsx.SD-Trend.png,HospitalRun.tsx.Mean-Trend.png"
   captions="Total Complexity for HospitalRun.tsx,Standard Deviation of Complexity for HospitalRun.tsx,Mean Complexity for HospitalRun.tsx" %}

The total complexity of `HospitalRun.tsx` has grown strongly for a while in the past year. At some point the development team has removed much of the accumulated complexity. The mean and standard deviation curves mirror this trend.

Still, the name of the module does not reveal its intention and it does not give guidance for what should be a part of the file and what is out of scope.

##### HospitalRun.test.tsx

{% include gallery.html id="HospitalRunTest" folder="hospitalrun"
   images="HospitalRun.test.tsx.Total-Trend.png,HospitalRun.test.tsx.SD-Trend.png,HospitalRun.test.tsx.Mean-Trend.png"
   captions="Total Complexity for HospitalRun.test.tsx,Standard Deviation of Complexity for HospitalRun.test.tsx,Mean Complexity for HospitalRun.test.tsx" %}

The trends of `HospitalRun.test.tsx` are similar to the trends of `HospitalRun.tsx`. It seems as if both files already have the attention of the development team.

##### patient-slice.ts

{% include gallery.html id="patient-slice" folder="hospitalrun"
   images="patient-slice.ts.Total-Trend.png,patient-slice.ts.SD-Trend.png,patient-slice.ts.Mean-Trend.png"
   captions="Total Complexity for patient-slice.ts,Standard Deviation of Complexity for patient-slice.ts,Mean Complexity for patient-slice.ts" %}

The `patient-slice.ts` file has grown in complexity during the past year. However, towards the end of the observed time period, the trend has was reversed and the complexity metric improved. The mean and standard deviation of complexity were rather steady during the entire year.

##### patient-slice.test.ts

{% include gallery.html id="patient-slice-test" folder="hospitalrun"
   images="patient-slice.test.ts.Total-Trend.png,patient-slice.test.ts.SD-Trend.png,patient-slice.test.ts.Mean-Trend.png"
   captions="Total Complexity for patient-slice.test.ts,Standard Deviation of Complexity for patient-slice.test.ts,Mean Complexity for patient-slice.test.ts" %}

Like in the other cases above, the tests trends are similar to the trends of the module under test.

#### Conclusions

`ViewPatient.tsx` and `ViewPatient.test.tsx` raise concerns. The growing trend of total complexity in both files suggests that the amount of code in `ViewPatient.tsx` is increasing. This is supported by the nearly constant shape of mean and standard deviation.

Did `ViewPatient.tsx` attract too many responsibilities?
Is this the reason for why the complexity in `ViewPatient.test.tsx` is growing?

The modules `HospitalRun.tsx`, `HospitalRun.test.tsx`, `patient-slice.ts` and `patient-slice.test.ts` have accumulated much complexity during the past year. However, at some point the development team reversed this trend. It seems as if these files have been taken care of.

 Still, the name of the `HospitalRun` module could be improved. The current name does not tell what kind of code should be part of it. This attracts complexity, because the name does not indicate a clear separation of concerns.

### Extending the Hotspot Analysis

#### Judge Power of Names

- `cp hotspots.csv hotspots-name.csv`
- Add a column **has_good_name** to the `hotspots-name.csv` file.
- For each file, judge whether the file name is good and enter **yes** or **no** into the new column.
- If unsure, leave the new column blank.

#### Calculate Complexity

```sh
cp hotspots-names.csv hotspots-complexity.csv

# Manually insert the following column names into the beginning of the file:
# n,total,mean,sd,max,

# For each hotspot candidate cd to its repository and execute the complexity_analysis:
export MAAT_SCRIPTS=$HOME/source/learn/your-code-as-a-crime-scene/maat-scripts
cd ../frontend
python "$MAAT_SCRIPTS/miner/complexity_analysis.py" "src/patients/view/ViewPatient.tsx"

# Insert the output to the left of each corresponding line
```

#### Visualize Complexity Trends

```sh
# Find oud the first and last revision by inspecting the git log, e.g.
git log --pretty=format:'[%h] %ad %an %s' --date=short --after=2019-11-06 --before=2019-11-11 # First considered commit in 2019
git log --pretty=format:'[%h] %ad %an %s' --date=short --after=2020-11-06 --before=2020-11-08 # Last considered commit in 2020

# Then give the desired dates to the following commands
FIRST_REVISION=$(git log --pretty=format:'%h' --after=2019-11-06 --before=2019-11-11) && git log ${FIRST_REVISION}~1..${FIRST_REVISION} --
LAST_REVISION=$(git log --pretty=format:'%h' --after=2020-11-06 --before=2020-11-08) && git log ${LAST_REVISION}~1..${LAST_REVISION} --

# For every hotspot:

# Give the FULL_PATH of the file of interest - repository folder and file name are derived automatically.
FULL_PATH=frontend/src/__tests__/patients/patient-slice.test.ts \
  && SUB_PATH=${FULL_PATH/frontend\//} \
  && REPO="${FULL_PATH/\/src*/}" && cd "../$REPO"

# Get the evolution of the complexity
python "$MAAT_SCRIPTS/miner/git_complexity_trend.py" --start $FIRST_REVISION --end $LAST_REVISION --file "$SUB_PATH" > ../analysis/trend_data.csv

# Total (growth of complexity)
python "$MAAT_SCRIPTS/plot/plot.py" --column 2 --file ../analysis/trend_data.csv

# Standard deviation of complexity
python "$MAAT_SCRIPTS/plot/plot.py" --column 4 --file ../analysis/trend_data.csv

# Mean of complexity
python "$MAAT_SCRIPTS/plot/plot.py" --column 3 --file ../analysis/trend_data.csv
```
