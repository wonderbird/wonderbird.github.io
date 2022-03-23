#!/usr/bin/env bash
#
# Create a git history file for each year
#
set -Eeufo pipefail

BASE_DIR="$HOME/source/hospitalrun"
START_YEAR=2014

CWD="$PWD"
YEAR=$START_YEAR
while [ $YEAR -lt 2020 ]; do
  NEXT_YEAR=$((YEAR+1))
  AFTER=$YEAR-11-06
  BEFORE=$NEXT_YEAR-11-08

  for SUT in frontend components server; do
    EVO_FILE="${SUT}_evo_${YEAR}.log"

    echo "Write git history for $SUT in $YEAR ..."

    cd "$BASE_DIR/$SUT"
    git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --after=$AFTER --before=$BEFORE > "$BASE_DIR/analysis/$EVO_FILE"
  done

  echo "Combine git history for $YEAR into single file ..."
  cd "$BASE_DIR/analysis"

  COMBINED_EVO_FILE="all_evo_${YEAR}.log"
  rm -f "$COMBINED_EVO_FILE"; 
  for SUT in frontend components server; do
    EVO_FILE="${SUT}_evo_${YEAR}.log"
    LINES=$(wc -l $EVO_FILE | awk "{ print \$1 }")

    if [ $LINES -gt 0 ]; then
      awk -F '\t' "{ if (NF == 3) { print \$1 \"\\t\" \$2 \"\\t\" \"$SUT/\" \$3 } else { print \$0 } }" < "$EVO_FILE" >> "$COMBINED_EVO_FILE"

      echo "" >> "$COMBINED_EVO_FILE"
    fi
  done

  YEAR=$NEXT_YEAR
done

cd "$CWD"
