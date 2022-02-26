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

##### ViewPatient.tsx and ViewPatient.test.tsx

<!-- Thumbnails: mogrify -format png -auto-orient -thumbnail 250x90 -path thumbnails '*.png' -->
<!-- Thumbnails: mogrify -format png -auto-orient -thumbnail 400x114 -path thumbnails '*.png' -->
<div id="ViewPatient" class="links">
  <a href="/assets/img/hospitalrun/ViewPatient.tsx.Total-Trend.png" title="Total Complexity for ViewPatient.tsx">
    <img src="/assets/img/hospitalrun/thumbnails/ViewPatient.tsx.Total-Trend.png" alt="Total Complexity for ViewPatient.tsx" />
  </a>
  <a href="/assets/img/hospitalrun/ViewPatient.tsx.SD-Trend.png" title="Standard Deviation of Complexity for ViewPatient.tsx">
    <img src="/assets/img/hospitalrun/thumbnails/ViewPatient.tsx.SD-Trend.png" alt="Standard Deviation of Complexity for ViewPatient.tsx" />
  </a>
  <a href="/assets/img/hospitalrun/ViewPatient.tsx.Mean-Trend.png" title="Mean Complexity for ViewPatient.tsx">
    <img src="/assets/img/hospitalrun/thumbnails/ViewPatient.tsx.Mean-Trend.png" alt="Mean Complexity for ViewPatient.tsx" />
  </a>
</div>
<script>
  document.getElementById('ViewPatient').onclick = function (event) {
    event = event || window.event
    var target = event.target || event.srcElement
    var link = target.src ? target.parentNode : target
    var options = { index: link, event: event }
    var links = this.getElementsByTagName('a')
    blueimp.Gallery(links, options)
  }
</script>

##### HospitalRun.tsx and HospitalRun.test.tsx

<div id="HospitalRun" class="links">
  <a href="/assets/img/hospitalrun/HospitalRun.tsx.Total-Trend.png" title="Total Complexity for HospitalRun.tsx">
    <img src="/assets/img/hospitalrun/thumbnails/HospitalRun.tsx.Total-Trend.png" alt="Total Complexity for HospitalRun.tsx" />
  </a>
  <a href="/assets/img/hospitalrun/HospitalRun.tsx.SD-Trend.png" title="Standard Deviation of Complexity for HospitalRun.tsx">
    <img src="/assets/img/hospitalrun/thumbnails/HospitalRun.tsx.SD-Trend.png" alt="Standard Deviation of Complexity for HospitalRun.tsx" />
  </a>
  <a href="/assets/img/hospitalrun/HospitalRun.tsx.Mean-Trend.png" title="Mean Complexity for HospitalRun.tsx">
    <img src="/assets/img/hospitalrun/thumbnails/HospitalRun.tsx.Mean-Trend.png" alt="Mean Complexity for HospitalRun.tsx" />
  </a>
</div>
<script>
  document.getElementById('HospitalRun').onclick = function (event) {
    event = event || window.event
    var target = event.target || event.srcElement
    var link = target.src ? target.parentNode : target
    var options = { index: link, event: event }
    var links = this.getElementsByTagName('a')
    blueimp.Gallery(links, options)
  }
</script>

##### patient-slice.ts and patient-slice.test.ts

<div id="patient-slice" class="links">
  <a href="/assets/img/hospitalrun/patient-slice.ts.Total-Trend.png" title="Total Complexity for patient-slice.ts">
    <img src="/assets/img/hospitalrun/thumbnails/patient-slice.ts.Total-Trend.png" alt="Total Complexity for patient-slice.ts" />
  </a>
  <a href="/assets/img/hospitalrun/patient-slice.ts.SD-Trend.png" title="Standard Deviation of Complexity for patient-slice.ts">
    <img src="/assets/img/hospitalrun/thumbnails/patient-slice.ts.SD-Trend.png" alt="Standard Deviation of Complexity for patient-slice.ts" />
  </a>
  <a href="/assets/img/hospitalrun/patient-slice.ts.Mean-Trend.png" title="Mean Complexity for patient-slice.ts">
    <img src="/assets/img/hospitalrun/thumbnails/patient-slice.ts.Mean-Trend.png" alt="Mean Complexity for patient-slice.ts" />
  </a>
</div>
<script>
  document.getElementById('patient-slice').onclick = function (event) {
    event = event || window.event
    var target = event.target || event.srcElement
    var link = target.src ? target.parentNode : target
    var options = { index: link, event: event }
    var links = this.getElementsByTagName('a')
    blueimp.Gallery(links, options)
  }
</script>

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
FULL_PATH=frontend/src/patients/view/ViewPatient.tsx
SUB_PATH=${FULL_PATH/frontend\//}

REPO="${FULL_PATH/\/src*/}" && cd "../$REPO"

# Find oud the first and last revision by inspecting the git log, e.g.
git log --pretty=format:'[%h] %ad %an %s' --date=short --after=2019-11-06 --before=2019-11-11 # First considered commit in 2019
git log --pretty=format:'[%h] %ad %an %s' --date=short --after=2020-11-06 --before=2020-11-08 # Last considered commit in 2020

# Then give the desired dates to the following commands
FIRST_REVISION=$(git log --pretty=format:'%h' --after=2019-11-06 --before=2019-11-11) && git log ${FIRST_REVISION}~1..${FIRST_REVISION} --
LAST_REVISION=$(git log --pretty=format:'%h' --after=2020-11-06 --before=2020-11-08) && git log ${LAST_REVISION}~1..${LAST_REVISION} --

python "$MAAT_SCRIPTS/miner/git_complexity_trend.py" --start $FIRST_REVISION --end $LAST_REVISION --file "$SUB_PATH" > ../analysis/trend_data.csv

# total (growth of complexity)
python3 "$MAAT_SCRIPTS/plot/plot.py" --column 2 --file ../analysis/trend_data.csv

# standard deviation of complexity
python3 "$MAAT_SCRIPTS/plot/plot.py" --column 4 --file ../analysis/trend_data.csv

# mean of complexity
python3 "$MAAT_SCRIPTS/plot/plot.py" --column 3 --file ../analysis/trend_data.csv
```
