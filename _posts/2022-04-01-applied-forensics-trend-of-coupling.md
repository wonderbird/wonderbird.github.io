---
layout: post-with-latest-d3
title:  "Applied Software Forensics - Trend of Coupling in HospitalRun"
---

### Explore the Trend of Coupling

To generate a coupling file for each development period of interest

- Update AFTER date and time period MONTHS in the script below
- Run the script for every development cycle you want to include

```sh
# Analyze Coupling for the initial period
AFTER=2019-11-06; \
MONTHS=4; \
declare -a MODULES=("frontend" "server" "components"); \
TIMEZONE=+0100; \
BEFORE=$(date -j -v+4m -v+2d -f "%4Y-%m-%d %H:%M:%S %z" +%Y-%m-%d "${AFTER} 00:00:00 ${TIMEZONE}"); \
YEARMONTH=$(date -j -f "%4Y-%m-%d %H:%M:%S %z" +%Y%m "${AFTER} 00:00:00 ${TIMEZONE}"); \
ALL_EVO_FILE="all_evo_${YEARMONTH}P4M.log"; \
\
for SUT in "${MODULES[@]}"; do \
  EVO_FILE="${SUT}_evo_${YEARMONTH}P4M.log"; \
  \
  echo "Get git history for $SUT ..."; \
  cd ${SUT}; \
  git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --after=$AFTER --before=$BEFORE > "../analysis/$EVO_FILE"; \
  \
  cd ../analysis; \
  cat $EVO_FILE | awk -F '\t' "{ if (NF == 3) { print \$1 \"\\t\" \$2 \"\\t\" \"$SUT/\" \$3 } else { print \$0 } }" >> "$ALL_EVO_FILE"; \
  echo "" >> "$ALL_EVO_FILE"; \
  cd .. ; \
  \
done; \
\
SUT=all; \
EVO_FILE="${SUT}_evo_${YEARMONTH}P4M.log"; \
COUPLING_FILE="${SUT}_coupling_${YEARMONTH}P4M.csv"; \
echo "Analyze Coupling for $EVO_FILE to $COUPLING_FILE ..."; \
cd analysis; \
docker run -v "$PWD":/data -it code-maat-app -l /data/$EVO_FILE -c git -a coupling > "$COUPLING_FILE"; \
cd ..
```

ATTENTION: Coupling results depend on the order of modules above!

TODO: Combining git history files does not work this way! Does coupling analysis expect sorted files?

Filter the files such that only your hotspot of choice is considered in the coupling analysis:

```sh
cd analysis

COUPLING_FILE="frontend_coupling_201911P4M.csv"; \
HOTSPOT=view/ViewPatient; \
COUPLING_PREFIX=viewpatient; \
export QUERY="SELECT * WHERE LIKE(a1, '%${HOTSPOT}%') || LIKE(a2, '%${HOTSPOT}%') ORDER BY a3, a4 DESC WITH (header)"; \
rbql-js --delim "," --query "$QUERY" < "$COUPLING_FILE" > "${COUPLING_PREFIX}_${COUPLING_FILE}"
```

### Earlier Ideas

TODO: Continue transforming the shell code below to python maat-scripts / TrendOfCouplingTest

Create combined git history files for each component:

```sh
./create-git-history-per-year.sh
```

```sh
./identify-hotspots-per-year.sh
```
