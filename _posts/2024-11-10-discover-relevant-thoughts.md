---
layout: post
title:  "Discover relevant thoughts"
---
Deutsche Version: [Relevante Gedanken entdecken](/2024/11/09/relevante-gedanken-entdecken.html)

### Technical solution: Determine change frequency in Git

With the following commands, you can find out which thoughts in your Zettelkasten have been particularly relevant lately. I assume that relevant thoughts are changed more frequently, i.e. they have a high change frequency in Git.

```shell
# 1. The day before the period you are interested in
daybeforestart='2024-10-28'

# 2. Write the files changed in the period you are interested in to the file evo.log
git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --after="$daybeforestart" > "./evo.log"

# 3. Use code-maat to calculate the change frequency per file
docker run -v "./":/data -it code-maat-app -l "/data/evo.log" -c git -a revisions > "./freqs.csv"

# 4. Show the files and their respective change frequency
less freqs.csv
```

### Requirements: ZSH, Docker, Git repository, Code-Maat

You need the following prerequisites to execute the commands:

- ZSH as shell
- Docker
- Your Zettelkasten must be in a Git repository
- Code-Maat as Docker image with the name `code-maat-app`.

To create the Code-Maat Docker image, proceed as follows:

- Clone the GitHub repository [code-maat](https://github.com/adamtornhill/code-maat)
- If you are using an Apple Silicon CPU, adjust the Dockerfile as described in the README.md
- Run `docker build -t code-maat-app .`

### Further links

#### The Zettelkasten Method

- M. Eua: [The FUN and EFFICIENT note-taking system I use in my PhD](https://www.youtube.com/watch?app=desktop&v=L9SLlxaEEXY&themeRefresh=1), Video, 2022.
- S. Fast: [Introduction to the Zettelkasten Method](https://zettelkasten.de/introduction/), 2020.

#### Analysis of hotspots

- Adam Tornhill: [Guide Refactorings With Behavioral Code Analysis](https://www.youtube.com/watch?v=okT9xZc6UtY), DDD Europe, Video, 2019.
- Adam Tornhill: [Your Code as a Crime Scene](https://pragprog.com/titles/atcrime2/your-code-as-a-crime-scene-second-edition/), Dallas, Texas: The Pragmatic Programmers, 2024. 
