---
layout: post
title:  "Applied Software Forensics - How the Team Works"
---

This section shows the most words the developers used most frequently in their commit messages between November 2019 and November 2020:

![Word Cloud of Commit Messages](/assets/img/hospitalrun/wordcloud.png)

The prominent words "merge branch" indicate that much work is handed over by means of a pull request. Dependabot seems to play an important role in maintaining the dependencies. The word "dependabot" occurs in 817 of the 2614 commit messages. 353 of 1160 merge commits are created by Matteo Vivona, 141 by dependabot, 48 by Maksim Sinik, 

According to the cloud, adding features, fixing issues, refactoring, dependencies (build) and chores play an equally important role in the commit messages.

From a business context the patient and appointment domains were important during the development cycle.

Note that the following words have been excluded from the word cloud:

```text
into
master'
from
to
HospitalRun
```

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
# - Add words to the stopwords (one word per line)
wordcloud_cli --text=wordcloud-input.txt --imagefile=wordcloud.png --stopwords=wordcloud-stopwords.txt --no_collocations --background white --mode RGBA
```

```sh
# Allow filtering commit messages by
git log --pretty=format:'%an,%s' 01bd9cbf..1f0dadcf > ../analysis/commits-by-author.csv
```

TODO: Find out which merge commits are handled by which authors. Use RBQL to filter and sum the CSV
