---
layout: post
title:  "Applied Software Forensics - HospitalRun Architecture Safety Net"
---

<!-- doctoc --maxlevel 4 $HOME/source/wonderbird/wonderbird.github.io/_posts/2022-05-13-safety-net-for-architecture.md -->

### Results

There is no temporal coupling across the repositories [frontend](https://github.com/HospitalRun/hospitalrun-frontend/tree/v2.0.0-alpha.7), [server](https://github.com/HospitalRun/hospitalrun-server/tree/v2.0.0-alpha.5), [components](https://github.com/HospitalRun/components/tree/v3.0.3) - used by frontend v2.0.0-alpha7.

### Analyzing Coupling on an Architectural Level

#### Configuration

```sh
cd $HOME/source/hospitalrun/analysis

# Configuration
export MAAT_SCRIPTS=$HOME/source/learn/your-code-as-a-crime-scene/maat-scripts
```

#### Specify Architectural Boundaries

`hospitalrun_boundaries.txt`:

```sh
# Specify architectural boundaries on top level
cat << EOF > hospitalrun_boundaries.txt
frontend => frontend
components => components
server => server
EOF

# Analyse coupling
# (note: the all_evo.log contains the development from Nov. 2019 - Nov. 2020)
docker run -v "$PWD":/data -it code-maat-app -l /data/all_evo.log -c git -a coupling -g /data/hospitalrun_boundaries.txt
```

Looks like there is no significant coupling on the top level :-)