---
layout: post
title:  "Applied Software Forensics - Temporal Coupling in HospitalRun"
---

### Results

### Creating a Storyboard of Temporal Coupling

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
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a soc | head -n 15
```
