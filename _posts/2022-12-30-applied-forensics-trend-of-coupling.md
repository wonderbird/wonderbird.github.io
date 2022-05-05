---
layout: post-with-latest-d3
title:  "Applied Software Forensics - Trend of Coupling in HospitalRun"
---

### Explore the Trend of Coupling

To generate a coupling file for each development period of interest

- Find an ideal period of months from the [Development Cycles](/2022/03/23/applied-forensics-development-cycles.html) analysis
- Update AFTER date and time period MONTHS in the script below
- Run the script for every development cycle you want to include

```sh
# Analyze Coupling for a development cycle

# Specify start date and development cycles
AFTER=2019-11-06; \
MONTHS=3; \
TIMEZONE=+0100

# Derived variables
declare -a MODULES=("frontend" "server" "components"); \
BEFORE=$(date -j -v+4m -v+2d -f "%4Y-%m-%d %H:%M:%S %z" +%Y-%m-%d "${AFTER} 00:00:00 ${TIMEZONE}"); \
YEARMONTH=$(date -j -f "%4Y-%m-%d %H:%M:%S %z" +%Y%m "${AFTER} 00:00:00 ${TIMEZONE}"); \
ALL_EVO_FILE="all_evo_${YEARMONTH}P${MONTHS}M.log";

# For each module create one git history file per development cycle
for SUT in "${MODULES[@]}"; do \
  EVO_FILE="${SUT}_evo_${YEARMONTH}P${MONTHS}M.log"; \
  \
  echo "Get git history for $SUT ..."; \
  cd ${SUT}; \
  git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --after=$AFTER --before=$BEFORE > "../analysis/$EVO_FILE"; \
  \
  echo "Prepend module path to git history change entries for $SUT ..."; \
  TARGET="${SUT}_evo_${YEARMONTH}P${MONTHS}M_with_extra_path.log"; \
  cat "../analysis/${EVO_FILE}" | awk -F '\t' "{ if (NF == 3) { print \$1 \"\\t\" \$2 \"\\t\" \"$SUT/\" \$3 } else { print \$0 } }" > "../analysis/$TARGET"; \
  \
  cd ..; \
done

### TODO: Continue here: combine the correct history files into one
### Next step: find out how to create the argument list for combine_repos

# Combine the git history files of all modules into one
cd ../analysis; \
python $MAAT_SCRIPTS/combine-repos/combine_repos.py frontend_evo_with_extra_path.log \
                                                    server_evo_with_extra_path.log \
                                                    components_evo_with_extra_path.log \
                                                    --output all_evo.log

# Perform the coupling analysis for each combined history file
SUT=all; \
EVO_FILE="${SUT}_evo_${YEARMONTH}P${MONTHS}M.log"; \
COUPLING_FILE="${SUT}_coupling_${YEARMONTH}P${MONTHS}M.csv"; \
echo "Analyze Coupling for $EVO_FILE to $COUPLING_FILE ..."; \
docker run -v "$PWD":/data -it code-maat-app -l /data/$EVO_FILE -c git -a coupling > "$COUPLING_FILE"; \
cd ..
```

ATTENTION: Coupling results depend on the order of modules above!

TODO: Combining git history files does not work this way! Does coupling analysis expect sorted files?

Filter the files such that only your hotspot of choice is considered in the coupling analysis:

```sh
cd analysis

COUPLING_FILE="frontend_coupling_201911P${MONTHS}M.csv"; \
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
