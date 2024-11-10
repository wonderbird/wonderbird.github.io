---
layout: post
title:  "Relevante Gedanken entdecken"
---
English version: [Discover relevant thoughts](/2024/11/10/discover-relevant-thoughts.html)

### Relevante Gedanken anhand der Änderungshäufigkeit im Zettelkasten entdecken

Beim Rückblick möchte ich in meinem Zettelkasten (1)(2) schnell die Gedanken finden, die in den letzten Wochen und Monaten besonders wichtig für mich waren.

Im Folgenden nehme ich an, dass Gedanken umso relevanter sind, je häufiger ich sie bearbeitet habe (3)(4). Daher möchte ich die Gedanken mit hoher Änderungsfrequenz in meinem Zettelkasten finden.

### Technische Voraussetzungen: ZSH, Docker, Git-Repository, Code-Maat

Folgende Voraussetzungen benötigst Du, um die Analyse durchzuführen:

- ZSH als Shell
- Docker
- Dein Zettelkasten muss in einem Git-Repository liegen
- Code-Maat als Docker-Image mit dem Namen `code-maat-app`.

Um das Code-Maat Docker-Image zu erstellen, gehe wie folgt vor:

- Clone das GitHub Repository [code-maat](https://github.com/adamtornhill/code-maat)
- Falls Du eine Apple Silicon CPU nutzt, passe das Dockerfile wie in der README.md beschrieben an
- Führe `docker build -t code-maat-app .` aus

### Technische Lösung: Änderungshäufigkeit in Git ermitteln

Mit den folgenden Befehlen findest Du die Änderungsrate pro Datei in Deinem Zettelkasten:

```shell
# 1. Der Tag vor dem Zeitraum, der Dich interessiert
daybeforestart='2024-10-28'

# 2. Schreibe die im betrachteten Zeitraum geänderten Dateien in die Datei evo.log
git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --after="$daybeforestart" > "./evo.log"

# 3. Benutze code-maat, um die Änderungshäufigkeit pro Datei zu berechnen
docker run -v "./":/data -it code-maat-app -l "/data/evo.log" -c git -a revisions > "./freqs.csv"

# 4. Zeige die Dateien und die jeweilige Änderungshäufigkeit an
less freqs.csv
```

### Weiterführende Links

#### Die Zettelkasten Methode

(1) M. Eua: [The FUN and EFFICIENT note-taking system I use in my PhD](https://www.youtube.com/watch?app=desktop&v=L9SLlxaEEXY&themeRefresh=1), Video, 2022.
(2) S. Fast: [Introduction to the Zettelkasten Method](https://zettelkasten.de/introduction/), 2020.

#### Analyse von Hotspots

(3) Adam Tornhill: [Guide Refactorings With Behavioral Code Analysis](https://www.youtube.com/watch?v=okT9xZc6UtY), DDD Europe, Video, 2019.
(4) Adam Tornhill: [Your Code as a Crime Scene](https://pragprog.com/titles/atcrime2/your-code-as-a-crime-scene-second-edition/), Dallas, Texas: The Pragmatic Programmers, 2024.
