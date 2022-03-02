---
layout: post
title:  "Applied Software Forensics - Temporal Coupling in HospitalRun"
---

### Results

#### Sum of Coupling (SoC)

The column "SoC" in the following table shows how often each file has been committed together with other files. Among others this top 10 list includes the hotspots from the previous analyses: `ViewPatient*.tsx`, `HospitalRun*.tsx` and `patient-slice.ts`.

<table>
  <thead>
    <caption>Sum of Coupling</caption>
    <tr>
      <th>SoC</th>
      <th style="text-align: left">Module</th>
    </tr>
  </thead>

  <tbody>
    {% for entry in site.data.hospitalrun.sum-of-coupling %}
    <tr>
      <td>{{ entry.soc }}</td>
      <td style="text-align: left">{{ entry.entity }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

#### Coupling of Individual Modules

<table>
  <thead>
    <caption>Coupling of views/ViewPatient.tsx</caption>
    <tr>
      <th style="text-align: left">entity</th>
      <th style="text-align: left">coupled</th>
      <th>degree</th>
      <th>average-revs</th>
    </tr>
  </thead>

  <tbody>
    {% for entry in site.data.hospitalrun.viewpatient-coupling %}
    <tr>
      <td style="text-align: left">{{ entry.entity }}</td>
      <td style="text-align: left">{{ entry.coupled }}</td>
      <td>{{ entry.degree }}</td>
      <td>{{ entry.average-revs }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

### Performing a Temporal Coupling Analysis

#### Overview: Sum of Coupling (SoC)

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
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a soc | head -n 11 > all_sum_of_coupling.csv
```

### Measure Temporal Coupling on File Level

```sh
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a coupling > all_coupling.csv
```

#### Filter By Hotspot

Using the [Rainbow CSV Plugin for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) you can filter the `all_coupling.csv` file by hotspot name. The following queries where used to create individual CSV files per hotspot:

```sql
SELECT * WHERE LIKE(a1, '%view/ViewPatient%') || LIKE(a2, '%view/ViewPatient%') ORDER BY a3, a4 DESC WITH (header)
```

Save the file(s) as `viewpatient_coupling.csv`.
