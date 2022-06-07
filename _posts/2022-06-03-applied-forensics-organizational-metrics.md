---
layout: post
title:  "Applied Software Forensics - Organizational Metrics of the HospitalRun Code Base"
---

## Multiple Authors

```sh
cd analysis
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a authors
```

```sh
entity,n-authors,n-revs
components/package.json,20,407
frontend/package.json,19,397
frontend/src/patients/view/ViewPatient.tsx,16,48
frontend/src/locales/enUs/translations/patient/index.ts,14,24
frontend/src/patients/GeneralInformation.tsx,14,23
components/src/index.tsx,14,21
frontend/src/__tests__/patients/view/ViewPatient.test.tsx,13,37
frontend/src/patients/new/NewPatient.tsx,12,28
frontend/src/labs/requests/NewLabRequest.tsx,12,21
frontend/src/labs/ViewLabs.tsx,12,20
frontend/src/patients/related-persons/RelatedPersonTab.tsx,11,30
frontend/README.md,10,42
frontend/src/patients/patient-slice.ts,10,36
components/src/components/Navbar/Navbar.tsx,10,26
frontend/src/scheduling/appointments/new/NewAppointment.tsx,10,25
frontend/src/patients/edit/EditPatient.tsx,10,24
frontend/src/patients/appointments/AppointmentsList.tsx,10,19
frontend/src/__tests__/HospitalRun.test.tsx,9,39
frontend/src/user/user-slice.ts,9,27
frontend/src/scheduling/appointments/view/ViewAppointment.tsx,9,27
...
```

When interpreting the results, note that the folder structure beneath `src` has been refactored in January 2020. Among
others, the module `containers` has been split into separate modules.

Remember that our main hotspots are

- ViewPatient.tsx
- HospitalRun.tsx
- patient-slice.tsx

In the following we will focus on ViewPatient.tsx, because it seems as if that hotspot has not been improved in the
time period of interest.

Code Maat does not consider renamed files and folders in the coupling analysis. In order to get accurate analysis
results, all renamed file paths should be replaced by the final file path in the git history file.

For `ViewPatient.tsx` this is achieved by the following steps:

- Rename the file to the newest version of its filename in all commits:
  - For every commit listed in all_evo.log from **top to bottom**
    - If you find a commit changing the filename, then replace every occurrence of the **new** filename by the old
      filename
    - Replace the rename entry by just the old filename
  - Finally, rename all occurrences of the oldest filename to the new filename.
- Move the file to the folder used by the latest commits in all commits:
  - Walk through the file all_evo.log from **bottom to top**
    - If you find a commit moving the file to a different folder, then replace every (later) occurrence of the old path
      by the new path

Run a coupling analysis considering changes in one day only:

```sh
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a coupling --temporal-period 1 > all_coupling_1day.csv
```

Now repeat the Rename / Move process from above for all files coupled to `ViewPatient.tsx`.

TODO Perform the rename / move process listed above. Then show the coupling results below.
