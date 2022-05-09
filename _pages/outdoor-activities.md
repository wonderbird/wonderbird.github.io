---
title: Outdoor Aktivitäten
layout: default
---

## Outdoor Aktivitäten Tracken

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [GPX Dateien mit der Apple Watch erstellen](#gpx-dateien-mit-der-apple-watch-erstellen)
- [GPX Dateien via Google Maps erstellen](#gpx-dateien-via-google-maps-erstellen)
- [Garmin eTrex 30x und Basecamp](#garmin-etrex-30x-und-basecamp)
  - [OpenStreetMap / OpenMTBMap Karten für Garmin Basecamp installieren](#openstreetmap--openmtbmap-karten-f%C3%BCr-garmin-basecamp-installieren)
  - [Karten auf das Garmin Gerät überspielen](#karten-auf-das-garmin-ger%C3%A4t-%C3%BCberspielen)
  - [Referenzen](#referenzen)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### GPX Dateien mit der Apple Watch erstellen

Die folgenden Apps können GPX Tracks von der Apple Watch exportieren

- [WorkOutDoors](https://apps.apple.com/de/app/workoutdoors/id1241909999)
- [RunGap](https://apps.apple.com/de/app/rungap-workout-data-manager/id534460198)

### GPX Dateien via Google Maps erstellen

Folge der Anleitung der [Chip: Google Maps: Route exportieren - so geht's](https://praxistipps.chip.de/google-maps-route-exportieren-so-gehts_96226)

1. Erstelle eine neue Karte in [Google My Maps](https://www.google.com/maps/d/u/0/)
1. Wähle 3 Punkte **...** neben dem Kartentitel und klicke **In KML/KMZ exportieren**
1. Wähle die Route aus
1. Aktiviere **Als KML-Datei statt als KMZ-Datei exportieren. Dabei werden nicht alle Symbole unterstützt.**
1. Konvertiere die Datei unter [KML2GPX](https://kml2gpx.com/), wähle dabei nur **Waypoints** und **Tracks** aus, **nicht** Zip Archive

### GPX Dateien (Routen) mit QGis und dem Open Route Service erstellen (Open Street Map)

Benötigt werden die folgenden Werkzeuge:

- [QGIS](https://www.qgis.org/) - Open-Source-Geographisches-Informationssystem.
- [ORS Tools](https://plugins.qgis.org/plugins/ORStools/) - Plugin für [QGis](https://www.qgis.org/).
  - [ORS Tools Help](https://github.com/GIScience/orstools-qgis-plugin/wiki/ORS-Tools-Help) - Installation, Setup, Usage.
- [openroute service](https://openrouteservice.org/dev/#/home?tab=1) - OpenRoute Service API Verwaltung.

Weiterführende Links:

- [Routing on OpenStreetMap.org](https://blog.openstreetmap.org/2015/02/16/routing-on-openstreetmap-org/)

### Garmin eTrex 30x und Basecamp

Um das Garmin eTrex 30x mit Basecamp zu verbinden, muss das Gerät im ''USB Mode / File Transfer'' sein

#### OpenStreetMap / OpenMTBMap Karten für Garmin Basecamp installieren

##### OpenMTBMap unter Windows installieren

Befolge die Anleitung unter [OpenMTBMap: Classic Way of Installation without already having Mapsource installed (please install everything as administrator)](https://openmtbmap.org/tutorials/install-mapsource/#Classic_Way_of_Installation_without_already_having_Mapsource_installed_please_install_everything_as_administrator)

1. Installiere Basecamp 4.7.2
1. Erste installierte Karte: [Europe Map Premium](https://openmtbmap.org/support/europe-map/) - Installer `mtbeurope.exe`,  Checkbox ''Contourlines'' aktivieren
1. Zweite installierte Karte: [Mecklenburg Vorpommern](https://openmtbmap.org/download/odbl/) - Installer `mtbmecklenburg-vorpommern.exe`,  Checkbox **Contourlines** aktivieren
1. Installiere [Garmin MapSource 6.16.3](https://www8.garmin.com/support/download_details.jsp?id=209)

##### Updates

- Contourline Dateien müssen bei einem Update nicht erneut installiert werden

#### Karten auf das Garmin Gerät überspielen

- Folge der betriebssystem-unabhängigen Anleitung [Send Maps to GPS with Mkgmap (Cross-Platform)](https://openmtbmap.org/tutorials/mkgmap/) <br/>&rarr; Benutze Abschnitt **Create gmapsupp.img using the create batches - Windows only**<br/>&rarr; Als FID wählt man die 4 Start-Ziffern der *.img Dateien im Karten Ordner (siehe Anleitung)

#### Referenzen

- [OpenMTBMap](https://openmtbmap.org)
  - [Installation in Basecamp](https://openmtbmap.org/tutorials/install/) ist möglich, Installation auf Garmin eTrex 30x ist möglich
