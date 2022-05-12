---
layout: post-with-latest-d3
title:  "Applied Software Forensics - Trend of Coupling in HospitalRun"
---

<!-- doctoc --maxlevel 4 $HOME/source/wonderbird/wonderbird.github.io/_posts/2022-05-10-applied-forensics-trend-of-coupling.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Results](#results)
  - [Trend of Coupling for Hotspot view/ViewPatient.tsx](#trend-of-coupling-for-hotspot-viewviewpatienttsx)
  - [Conclusion](#conclusion)
- [Explore the Trend of Coupling](#explore-the-trend-of-coupling)
  - [Configuration](#configuration)
  - [Combine git History of Multiple Repositories for a Development Cycle](#combine-git-history-of-multiple-repositories-for-a-development-cycle)
  - [Inspect Coupling for a Hotspot](#inspect-coupling-for-a-hotspot)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Results

#### Trend of Coupling for Hotspot view/ViewPatient.tsx

The temporal coupling was measured the time period of Nov. 6, 2019 to Nov. 5, 2020. The year was quite arbitrarily split
into phases of 3 months each. For each phase, the temporal coupling for the hotspot `view/ViewPatient.tsx` was
investigated.

{% include hospitalrun/change-coupling-table.html
   caption="Coupling of view/ViewPatient.tsx from Nov. 6, 2019 to Feb. 5, 2020"
   coupling-data=site.data.hospitalrun.coupling.viewpatient-201911P3M %}

{% include hospitalrun/change-coupling-table.html
   caption="Coupling of view/ViewPatient.tsx from Feb. 6, 2019 to May 5, 2020"
   coupling-data=site.data.hospitalrun.coupling.viewpatient-202002P3M %}

{% include hospitalrun/change-coupling-table.html
   caption="Coupling of view/ViewPatient.tsx from May 6, 2019 to Aug. 5, 2020"
   coupling-data=site.data.hospitalrun.coupling.viewpatient-202005P3M %}

{% include hospitalrun/change-coupling-table.html
   caption="Coupling of view/ViewPatient.tsx from Aug. 6, 2019 to Nov. 5, 2020"
   coupling-data=site.data.hospitalrun.coupling.viewpatient-202008P3M %}

#### Conclusion

For the selected hotspot, the temporal coupling is reduced over time. This is a good trend.

There may be different reasons:

- As shown in the [development cycles analysis](/2022/03/23/applied-forensics-development-cycles.html), the overall
  development speed was reduced in the second half of the time period of interest,

- There was fewer reason for coupling in the second half year: Checking the commit messages reveals that in the first
  six months the number of feature related commits touching the hotspot was significantly higher than in the last six
  months (21+14 vs. 6+6).
  
- The coupling might have been reduced: The number of refactoring related commits for that file was lower in the first
  half of the "year" than in the second half (1+2 vs. 4+5).

### Explore the Trend of Coupling

#### Configuration

To generate a coupling file for each development period of interest

- Find an ideal period of months from the [Development Cycles](/2022/03/23/applied-forensics-development-cycles.html)
  analysis
- Update AFTER date and time period MONTHS in the configuration "script" below
- Run the "scripts" of the next sections for every development cycle you want to include

```sh
# Analyze Coupling for a development cycle
cd $HOME/source/hospitalrun

# Configuration
export MAAT_SCRIPTS=$HOME/source/learn/your-code-as-a-crime-scene/maat-scripts

# Specify start date and development cycles
AFTER=2019-11-06; \
MONTHS=3; \
TIMEZONE=+0100
```

#### Combine git History of Multiple Repositories for a Development Cycle

```sh
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

# Combine the git history files of all modules into one
FRONTEND_EVO="frontend_evo_${YEARMONTH}P${MONTHS}M_with_extra_path.log"; \
SERVER_EVO="server_evo_${YEARMONTH}P${MONTHS}M_with_extra_path.log"; \
COMPONENTS_EVO="components_evo_${YEARMONTH}P${MONTHS}M_with_extra_path.log"; \
\
cd analysis; \
python $MAAT_SCRIPTS/combine-repos/combine_repos.py "$FRONTEND_EVO" \
                                                    "$SERVER_EVO" \
                                                    "$COMPONENTS_EVO" \
                                                    --output all_evo_${YEARMONTH}P${MONTHS}M.log

# Perform the coupling analysis for each combined history file
SUT=all; \
EVO_FILE="${SUT}_evo_${YEARMONTH}P${MONTHS}M.log"; \
COUPLING_FILE="${SUT}_coupling_${YEARMONTH}P${MONTHS}M.csv"; \
echo "Analyze Coupling for $EVO_FILE to $COUPLING_FILE ..."; \
docker run -v "$PWD":/data -it code-maat-app -l /data/$EVO_FILE -c git -a coupling > "$COUPLING_FILE"; \
cd ..
```

#### Inspect Coupling for a Hotspot

Filter the files such that only your hotspot of choice is considered in the coupling analysis:

```sh
# Configure time period and hotspot file
AFTER=2019-11-06; \
MONTHS=3; \
YEARMONTH=$(date -j -f "%4Y-%m-%d %H:%M:%S %z" +%Y%m "${AFTER} 00:00:00 ${TIMEZONE}"); \
\
HOTSPOT=view/ViewPatient.tsx; \
COUPLING_PREFIX=viewpatient

# Filter hotspot coupling into separate csv file
cd analysis; \
\
COUPLING_CSV="all_coupling_${YEARMONTH}P${MONTHS}M.csv"; \
COUPLING_JSON="all_coupling_${YEARMONTH}P${MONTHS}M.json"; \
\
export QUERY="SELECT * WHERE LIKE(a1, '%${HOTSPOT}%') || LIKE(a2, '%${HOTSPOT}%') ORDER BY a3, a4 DESC WITH (header)"; \
rbql-js --delim "," --query "$QUERY" < "$COUPLING_CSV" > "${COUPLING_PREFIX}_${COUPLING_CSV}"

# Convert the csv to json (for publishing the data on this jekyll page)
csv2json -o "${COUPLING_PREFIX}_${COUPLING_JSON}" "${COUPLING_PREFIX}_${COUPLING_CSV}"

cd ..
```
