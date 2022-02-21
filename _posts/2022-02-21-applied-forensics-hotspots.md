---
layout: post
title:  "Applied Software Forensics - Hotspot Analysis for HospitalRun"
---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Results](#results)
  - [Hotspots Overview](#hotspots-overview)
  - [Hotspots of Frontend](#hotspots-of-frontend)
  - [Hotspots of Server](#hotspots-of-server)
- [Executing a Hotspot Analysis For Individual Repositories](#executing-a-hotspot-analysis-for-individual-repositories)
  - [Prepare Complexity (LOC) and Effort (Change Frequencies)](#prepare-complexity-loc-and-effort-change-frequencies)
  - [Merge complexity (LOC) and effort](#merge-complexity-loc-and-effort)
  - [Visualize hotspots](#visualize-hotspots)
- [Executing a Combined Hotspot Analysis For Multiple Repositories](#executing-a-combined-hotspot-analysis-for-multiple-repositories)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Results

Let me start with showing the results of the hotspot analysis. You can reproduce these results on your own as described in the next sections.

#### Hotspots Overview

![Hotspots Overview](/assets/hospitalrun/hotspots-all.png)

#### Hotspots of Frontend

![Hotspots of Frontend](/assets/hospitalrun/hotspots-frontend.png)

#### Hotspots of Server

![Hotspots of Server](/assets/hospitalrun/hotspots-server.png)

### Executing a Hotspot Analysis For Individual Repositories

The following commands are used to create a hotspot analysis for

- [HospitalRun Frontend v2.0.0-alpha.7](https://github.com/HospitalRun/hospitalrun-frontend/tree/v2.0.0-alpha.7)
- [HospitalRun Server v2.0.0-alpha.5](https://github.com/HospitalRun/hospitalrun-server/tree/v2.0.0-alpha.5)

#### Prepare Complexity (LOC) and Effort (Change Frequencies)

```sh
# We assume that the frontend code is in a directory named frontend and the server code is in a directory named server.
# Select which module you want to analyze:
export SUT=server

# Prepare target folder
mkdir analysis
echo "package-lock.json" > cloc-exclude-files.txt

# Collect git history
cd "$SUT"
git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --after=2020-01-01 > "../analysis/${SUT}_evo.log"

# Count lines of code
cloc ./ --by-file --csv --exclude-dir=node_modules,bin --exclude-list-file=../analysis/cloc-exclude-files.txt --quiet "--report-file=../analysis/${SUT}_lines.csv"
# Note: For me this command showed errors for files named acorn-loose.js, acorn-loose.mjs, acorn-loose.es.js

# Inspect the data
cd ../analysis
docker run -v "$PWD":/data -it code-maat-app -l "/data/${SUT}_evo.log" -c git -a summary

# Collect change frequencies
docker run -v "$PWD":/data -it code-maat-app -l "/data/${SUT}_evo.log" -c git -a revisions > "../analysis/${SUT}_freqs.csv"
```

#### Merge complexity (LOC) and effort

```sh
# Set the folder containing your https://github.com/adamtornhill/maat-scripts python3 branch checkout
export MAAT_SCRIPTS=$HOME/source/learn/your-code-as-a-crime-scene/maat-scripts
python "$MAAT_SCRIPTS/merge/merge_comp_freqs.py" "${SUT}_freqs.csv" "${SUT}_lines.csv"
```

#### Visualize hotspots

```sh
# Set the folder containing Adam Tornhill's sample zip (extracted) from https://adamtornhill.com/code/crimescenetools.htm
export MAAT_SAMPLE=/Users/stefan/source/learn/your-code-as-a-crime-scene/sample
python "$MAAT_SCRIPTS/transform/csv_as_enclosure_json.py" --structure "${SUT}_lines.csv" --weights "${SUT}_freqs.csv" --weightcolumn 1 > "${SUT}_hotspot_proto.json"
mkdir d3
cp "$MAAT_SAMPLE/hibernate/d3/d3.min.js" "$MAAT_SAMPLE/hibernate/d3/LICENSE" ./d3/
cp "$MAAT_SAMPLE/hibernate/hibzoomable.html" "./$SUT.html"
sed -i '' "s/hib_hotspot_proto/${SUT}_hotspot_proto/g" "./${SUT}.html"
python -m http.server 8888

# Now open http://localhost:8888/
```

### Executing a Combined Hotspot Analysis For Multiple Repositories

Note: In the following I am using the GNU version of `head`. On macOS you can install these using `brew install coreutils`. Then use the GNU version of the respective tool by adding the `g` prefix. On Linux just replace `ghead` by `head` in the following.

In the previous section we have created multiple git history files named `*_evo.log`. In this section we will run a hotspot analysis on a set of repositories.

```sh
# Combine the analysis results into a single file
echo "entity,n-revs" > all_freqs.csv
awk 'FNR > 1 {print "frontend/" $0}' frontend_freqs.csv >> all_freqs.csv
awk 'FNR > 1 {print "server/" $0}' server_freqs.csv >> all_freqs.csv

# Concatenate the lines of code into a single file
echo "language,filename,blank,comment,code" > all_lines.csv
ghead -n-1 frontend_lines.csv | awk -F "," 'FNR > 1 {path=$2; sub(/\.\//, "frontend/", path); print $1 "," path "," $3 "," $4 "," $5}' >> all_lines.csv
ghead -n-1 server_lines.csv | awk -F "," 'FNR > 1 {path=$2; sub(/\.\//, "server/", path); print $1 "," path "," $3 "," $4 "," $5}' >> all_lines.csv
```

Now `export SUT=all` and apply the code from sections [Merge complexity (LOC) and effort](#merge-complexity-loc-and-effort) and [Visualize hotspots](#visualize-hotspots) to `all_freqs.csv` and `all_lines.csv`.
