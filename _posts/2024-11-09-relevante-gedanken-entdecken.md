---
layout: post
title:  "Relevante Gedanken entdecken"
---

Mit den folgenden Befehlen kannst Du herausfinden, welche Gedanken in Deinem Zettelkasten in letzter Zeit besonders relevant waren. Ich nehme dabei an, dass relevante Gedanken häufiger geändert werden, d.h. sie haben eine hohe Änderungsfrequenz in Git.

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

Folgende Voraussetzungen benötigst Du, um die Befehle auszuführen:

- ZSH als Shell
- Docker
- Dein Zettelkasten muss in einem Git-Repository liegen
- Code-Maat als Docker-Image mit dem Namen `code-maat-app`.

Um das Code-Maat Docker-Image zu erstellen, gehe wie folgt vor:

- Clone das GitHub Repository [code-maat](https://github.com/adamtornhill/code-maat)
- Falls Du eine Apple Silicon CPU nutzt, passe das Dockerfile wie in der README.md beschrieben an
- Führe `docker build -t code-maat-app .` aus
