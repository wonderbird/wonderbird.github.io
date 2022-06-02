---
layout: post
title:  "Applied Software Forensics - How the Team Works"
---

## Results

The following words appear most frequently in the commit messages between November 2019 and November 2020:

![Word Cloud of Commit Messages](/assets/img/hospitalrun/wordcloud.png)

To avoid some redundancy, the words "from", "to", "into" and "master'" were excluded from the cloud.

The prominent words "merge" and "branch" indicate that much work is handed over by means of a pull request. "dependabot" ("dependabot-preview[bot]") plays an important role in maintaining the dependencies. It seems as if "HospitalRun Bot" is used to keep development branches in sync with the master branch (unfortunately, I did not find related documentation).

The merge commits are distributed as follows:

| Author | Number of Merge Commits |
| ------ | ----------------------- |
| HospitalRun Bot | 512 |
| Matteo Vivona | 353 |
| Maksim Sinik | 48 |
| Jack Meyer | 23 |
| Others | 215 |

According to the word cloud, adding features, fixing issues, refactoring, maintaining dependencies (build) and chores
play an equally important role in the commit messages. For dependency updates, dependabot-preview[bot] creates branches
containing the word "npm_and_yarn". Usually, Matteo Vivona merges these branches. Especially eslint and typescript
updates cause many commits.

From a business context the patient and appointment domains were important during the development cycle.

## Analyze the Team's Modus Operandi

### Generate the Word Cloud Image

```sh
# https://github.com/amueller/word_cloud
pip install wordcloud

# Collect git commit messages for the time period from Nov. 10, 2019 to Nov. 7, 2020 line by line
cd frontend
git log --pretty=format:'%s' 01bd9cbf..1f0dadcf > ../analysis/wordcloud-input.txt

cd ../analysis

# Create empty stopwords list (words which are ignored in the cloud)
touch wordcloud-stopwords.txt

# Repeat:
# - Run wordcloud_cli
# - Check the output png
# - Add words to the stopwords (one word per line)
wordcloud_cli --text=wordcloud-input.txt --imagefile=wordcloud.png --stopwords=wordcloud-stopwords.txt --no_collocations --background white
```

### Investigate: Type of Work and Associated Authors

```sh
# Sort commit messages by author name
cd ../frontend
git log --pretty=format:'%an,%s' 01bd9cbf..1f0dadcf | sort > ../analysis/commits-by-author.csv

# Count the number of commit messages containing a specific word (i.e. author or type of work)
cd ../analysis
grep "Merge" commits-by-author.csv | grep "HospitalRun Bot" | wc -l
grep "Merge" commits-by-author.csv | grep -E --invert-match "HospitalRun Bot|dependabot-preview[bot]|Matteo Vivona|Maksim Sinik|Jack Meyer" | wc -l
```

While doing this analysis, really searching, reading and scrolling through the `commits-by-author.csv` file provides
interesting insights.
