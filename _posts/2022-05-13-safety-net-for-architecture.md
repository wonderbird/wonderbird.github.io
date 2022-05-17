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

##### Level 1

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

##### Level 2 - Frontend

`frontend_boundaries.txt`:

```sh
# Run the following command from the "analysis" folder
#
# Create a boundaries file from all module folders within a directory.
#
# Find all directories below ../frontend/src
#   skip the ../frontend/src directory
#   let \1 be the parent directory of the module
#   let \2 be the module directory
#   remove leading '../frontend/'
#   print \1\2 => \1
find ../frontend/src -type d -maxdepth 1 | grep -E --invert-match '(^.*\/src$)' | sed 's/^\.\.\/frontend\/\(.*\/\)\(.*\)/\1\2 => \2/' > frontend_boundaries.txt

# Analyse coupling
# (note: the all_evo.log contains the development from Nov. 2019 - Nov. 2020)
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo.log -c git -a coupling -g /data/frontend_boundaries.txt
```

##### Code <=> Test

`frontend_code_test_boundaries.txt`:

```sh
cat << EOF > frontend_code_test_boundaries.txt
^((?!__tests__)(?!__mocks__).)*$ => Code
^(.*__tests__.*)|(.*__mocks__.*)$ => Tests
EOF

# Analyse coupling
# (note: the all_evo.log contains the development from Nov. 2019 - Nov. 2020)
docker run -v "$PWD":/data -it code-maat-app -l /data/frontend_evo.log -c git -a coupling -g /data/frontend_code_test_boundaries.txt
```
