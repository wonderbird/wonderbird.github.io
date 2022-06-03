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

```sh
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a coupling --temporal-period 1 > all_coupling_1day.csv
```

When interpreting the results, note that the folder structure beneath `src` has been refactored in January 2020. Among
others, the module `containers` has been split into separate modules.

Remember that our main hotspots are

- ViewPatient.tsx
- HospitalRun.tsx
- patient-slice.tsx

TODO Check whether Code Maat processes folder and file renames correctly

- rename from "frontend/src/containers/ViewPatient.tsx" to "frontend/src/patients/view/ViewPatient.tsx"

The following contain architectural refactorings affecting ViewPatient.tsx

[816d2785] Jack Meyer 2020-01-12 refactor: move HospitalRun to root directory
1	1	frontend/src/App.tsx
9	9	frontend/src/{containers => }/HospitalRun.tsx
1	1	frontend/src/__tests__/App.test.tsx
7	7	frontend/src/__tests__/{containers => }/HospitalRun.test.tsx

[8ff0ac91] Jack Meyer 2019-12-16 fix(patients): fix broken name display in view patient adn lsit patient
2	2	frontend/src/containers/HospitalRun.tsx
3	1	frontend/src/patients/{patients => list}/Patients.tsx
4	5	frontend/src/{containers => patients/view}/ViewPatient.tsx

[e48e2484] Jack Meyer 2019-10-30 feat(patients) seperate containers and components, add edit/view
7	2	frontend/src/clients/db/patients-db.ts
0	11	frontend/src/components/Patient.tsx
53	0	frontend/src/components/PatientForm.tsx
0	0	frontend/src/{components => containers}/Dashboard.tsx
2	2	frontend/src/{components => containers}/HospitalRun.tsx
16	24	frontend/src/{components => containers}/NewPatient.tsx
0	0	frontend/src/{components => containers}/Patients.tsx
88	0	frontend/src/containers/ViewPatient.tsx
0	9	frontend/src/index.tsx



```csv
entity,coupled,degree,average-revs
frontend/src/containers/Dashboard.tsx,frontend/src/containers/Patients.tsx,100,5
components/src/components/Typeahead/Typeahead.tsx,components/test/typeahead.test.tsx,100,5
components/src/components/TextInput/TextInput.tsx,components/stories/textinput.stories.tsx,83,6
frontend/src/__tests__/patients/list/ViewPatients.test.tsx,frontend/src/patients/list/ViewPatients.tsx,76,7
components/src/components/DateTimePicker/DateTimePicker.tsx,components/stories/datetimepicker.stories.tsx,76,7
components/src/components/Navbar/Navbar.tsx,components/stories/navbar.stories.tsx,75,12
frontend/src/__tests__/patients/patient-slice.test.ts,frontend/src/patients/patient-slice.ts,75,12
frontend/src/__tests__/patients/patients-slice.test.ts,frontend/src/patients/patients-slice.ts,75,8
frontend/src/__tests__/patients/related-persons/RelatedPersons.test.tsx,frontend/src/patients/related-persons/RelatedPersonTab.tsx,75,8
components/src/components/Navbar/Navbar.tsx,components/src/components/Navbar/interfaces.tsx,72,11
frontend/src/patients/edit/EditPatient.tsx,frontend/src/patients/new/NewPatient.tsx,71,7
components/stories/navbar.stories.tsx,components/test/navbar.test.tsx,70,10
components/src/components/Navbar/Navbar.tsx,components/test/navbar.test.tsx,70,10
components/src/components/Table/Table.tsx,components/stories/table.stories.tsx,70,9
frontend/src/__tests__/scheduling/appointments/view/ViewAppointment.test.tsx,frontend/src/scheduling/appointments/view/ViewAppointment.tsx,69,13
components/src/components/Navbar/interfaces.tsx,components/stories/navbar.stories.tsx,63,11
components/package.json,frontend/package.json,62,160
frontend/src/__tests__/components/Navbar.test.tsx,frontend/src/components/Navbar.tsx,60,10
frontend/src/__tests__/scheduling/appointments/new/NewAppointment.test.tsx,frontend/src/scheduling/appointments/new/NewAppointment.tsx,60,10
components/src/components/Navbar/interfaces.tsx,components/test/navbar.test.tsx,55,9
frontend/src/__tests__/scheduling/appointments/edit/EditAppointment.test.tsx,frontend/src/__tests__/scheduling/appointments/view/ViewAppointment.test.tsx,55,9
frontend/src/__tests__/patients/view/ViewPatient.test.tsx,frontend/src/patients/view/ViewPatient.tsx,53,21
frontend/src/scheduling/appointments/edit/EditAppointment.tsx,frontend/src/scheduling/appointments/view/ViewAppointment.tsx,50,10
frontend/src/clients/db/PatientRepository.ts,frontend/src/clients/db/Repository.ts,50,10
```
