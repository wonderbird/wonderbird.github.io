---
layout: post
title:  "Applied Software Forensics - Utilities"
---

The following methods, mechanisms and tool are useful in many steps of the software analysis:

### Convert CSV File to JSON

The [Code Maat](https://github.com/adamtornhill/code-maat) and [Maat Scripts](https://github.com/adamtornhill/maat-scripts) usually result in csv formatted tables. In this static website however, JSON formatted data is passed into the [liquid templates](https://shopify.github.io/liquid/). Using the `csv2json` script allows to convert the data files:

```sh
# Prerequisite: Install the d3-dsv npm package. It brings the csv2json command
npm install -g d3-dsv
csv2json -o hotspots.json hotspots.csv
```

For more information, see section "Convert a CSV file with Headers to JSON" of the [jq Cookbook](https://github.com/stedolan/jq/wiki/Cookbook#convert-a-csv-file-with-headers-to-json).

### Combine Multiple git History Files Into One

Some analyses require (work best) using a git history for multiple repositories making up the system. This history file can be generated from individual history files as follows:

```sh
MODULES="frontend server components"

cd ../analysis

# Combine all git history files into one
rm all_evo.log;  \
for SUT in $MODULES; do \
  cat ${SUT}_evo.log | awk -F '\t' "{ if (NF == 3) { print \$1 \"\\t\" \$2 \"\\t\" \"$SUT/\" \$3 } else { print \$0 } }" >> all_evo.log; \
  echo "" >> all_evo.log; \
done
```

### Filter CSV Files

During the coupling analysis we are interested in specific entries of a CSV file. We use the
[Rainbow Query Language (RBQL)](https://github.com/mechatroner/RBQL) (npm module
[rbql](https://www.npmjs.com/package/rbql)) to filter the CSV file:

```sh
npm install -g rbql

export QUERY="SELECT * WHERE LIKE(a1, '%view/ViewPatient%') || LIKE(a2, '%view/ViewPatient%') ORDER BY a3, a4 DESC WITH (header)"; \
rbql-js --delim "," --query "$QUERY" < all_coupling.csv > viewpatient_coupling.csv
```
