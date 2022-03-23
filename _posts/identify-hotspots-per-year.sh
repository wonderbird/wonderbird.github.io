#!/usr/bin/env bash
#
# From every git history file per year find out the hotspots.
#
set -Eeufo pipefail

BASE_DIR="$HOME/source/hospitalrun"
START_YEAR=2014
HOTSPOT_NAME=ViewPatient
HOTSPOT_PATH=view
SUT=all

CWD="$PWD"
YEAR=$START_YEAR
cd "$BASE_DIR/analysis"

while [ $YEAR -lt 2020 ]; do
    echo "Analyse coupling for $YEAR ..."
   
    EVO_FILE="${SUT}_evo_${YEAR}.log"
    COUPLING_FILE="${SUT}_coupling_${YEAR}.csv"
    docker run -v "$PWD":/data -it code-maat-app -l "/data/$EVO_FILE" -c git -a coupling > "$COUPLING_FILE"
   
    HOTSPOT_RBQL_EXPRESSION="%${HOTSPOT_PATH}/${HOTSPOT_NAME}%"
    QUERY="SELECT * WHERE LIKE(a1, '$HOTSPOT_RBQL_EXPRESSION') || LIKE(a2, '$HOTSPOT_RBQL_EXPRESSION') ORDER BY a3, a4 DESC WITH (header)"
   
    echo "Filter coupling by \"$HOTSPOT_NAME\" for $YEAR ..."
   
    COUPLING_FILTERED_FILE="${SUT}_coupling_${HOTSPOT_NAME}_${YEAR}.csv"
    rbql-js --delim "," --query "$QUERY" < "$COUPLING_FILE" > "$COUPLING_FILTERED_FILE"
   
    YEAR=$((YEAR+1))
done

cd "$CWD"
