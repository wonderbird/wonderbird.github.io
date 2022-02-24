---
layout: post
title:  "HospitalRun Architecture"
---

### Status And Support Standard

This document is a work in progress. Its purpose is to help me understand the [HospitalRun](https://hospitalrun.io/) software architecture.

I am using this document for learning. As a consequence, I do not promise that this document will reflect the state of the [HospitalRun](https://hospitalrun.io/) system after Feb. 16, 2022. I also do not promise to keep the document up-to-date. At the moment (Feb. 18, 2022) I am working on it.

Please assume that I will need some days to answer your questions.

### Thanks

This architecture document is structured as proposed in [arc42](https://docs.arc42.org/home/). Many thanks to [Gernot Starke](https://github.com/gernotstarke) and all other [arc42](https://docs.arc42.org/home/) contributors for this template ❤️.

<!-- doctoc --maxlevel 5 _posts/2022-02-19-hospitalrun-architecture.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Introduction and Goals](#introduction-and-goals)
  - [Requirements Overview](#requirements-overview)
  - [Quality Goals](#quality-goals)
- [Building Block View](#building-block-view)
  - [HospitalRun Composite Structure](#hospitalrun-composite-structure)
- [Concepts](#concepts)
  - [aim42 - Issues, Improvements, Evaluation](#aim42---issues-improvements-evaluation)
  - [Setup the Development Environment](#setup-the-development-environment)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Introduction and Goals

As of Feb. 16, 2022 the [HospitalRun Homepage](https://hospitalrun.io/) states:

HospitalRun is one of the most popular offline-first electronic health records and hospital information system. HospitalRun's goal is a higher choice to its proprietary counterparts.

The software can be deployed in a variety of healthcare environments. Thanks to its technical feature that allows use even without connectivity, it is also suitable for clinics located in the most rural areas of the planet. With inspiring volunteers and contributors dedicated to leading HR's status as a free, open-source software solution for medical practices with a commitment to openness, kindness and cooperation.

#### Requirements Overview

As of Feb. 16, 2022 the [HospitalRun Homepage](https://hospitalrun.io/) lists the following top requirements:

| ID | Requirement |
| -- | --- |
| 1  | The software is provided free of charge. |
| 2  | The software is an EHR/HIS application. |

#### Quality Goals

As of Feb. 16, 2022 the [HospitalRun Homepage](https://hospitalrun.io/) lists the following top quality attributes:

| ID | Quality Attribute | Quality Characteristic | Goal |
| -- | --- | --- | --- |
|  1 | Usability | Learnability | **Easy to use** software for developing world healthcare. |
|  2 | Performance Efficiency | Resource Utilization | Provide a modern HIS to the **least resourced environments**. |
|  3 | Reliability | Availability | HospitalRun is an **offline-first** EHR/HIS application. |

### Building Block View

#### HospitalRun Composite Structure

The following diagram is based on the table in the [Contributing Guide](https://github.com/HospitalRun/hospitalrun/blob/master/.github/CONTRIBUTING.md) as of Feb. 16, 2022.

![HospitalRun Composite Structure](/assets/images/hospitalrun/composite-structure.drawio.png)

##### TODO: cli component is not documented on [Contributing Guide](https://github.com/HospitalRun/hospitalrun/blob/master/.github/CONTRIBUTING.md)

The corresponding Github repositories are located below [https://github.com/hospitalrun/](https://github.com/hospitalrun/).

### Concepts

#### aim42 - Issues, Improvements, Evaluation

##### Issue List

- In the top level directory of the mono repository, the `yarn` command shows a large number of deprecation warnings and outdated dependencies
- The current stable Node.js version 16 is not supported by `node-gyp` - it causes the [Error When Installing node-sass: gyp Compile Errors](#error-when-installing-node-sass-gyp-compile-errors)
- The `node-sass` dependency is deprecated, see [Github: node-sass](https://github.com/sass/node-sass) [Github: node-gyp docs](https://github.com/nodejs/node-gyp/tree/master/docs)
- The `node-sass` dependency is outdated. Versions 4.13.0 and 4.14.0, respectively, are used while current is 7.0.1.
- The mono repository cannot be built according to the Monorepo Contributing Guide in the [Contributing Guide](https://github.com/HospitalRun/hospitalrun/blob/master/.github/CONTRIBUTING.md). See [Error When Issuing `yarn workspaces run build`: (typescript) Error: .../Container.tsx(33,25): semantic error TS2769: No overload matches this call.](#error-when-issuing-yarn-workspaces-run-build-typescript-error-containertsx3325-semantic-error-ts2769-no-overload-matches-this-call) and [HospitalRun Issue #363: Error while building the project](https://github.com/HospitalRun/hospitalrun/issues/363)
- When running `npm install` in both the [hospitalrun-frontend](https://github.com/HospitalRun/hospitalrun-frontend/) and in the [hospitalrun-server](https://github.com/HospitalRun/hospitalrun-server/), many deprecation warnings are shown. Some of them seem to be severe.

#### Setup the Development Environment

##### How to Start?

Please make sure that you are using Node.js 14.

As of Feb. 20, 2022 the following versions worked properly:

- [HospitalRun Frontend v2.0.0-alpha.7](https://github.com/HospitalRun/hospitalrun-frontend/tree/v2.0.0-alpha.7)
- [HospitalRun Server v2.0.0-alpha.5](https://github.com/HospitalRun/hospitalrun-server/tree/v2.0.0-alpha.5)

```sh
# Ensure that you are using Node.js 14
node -v
v14.19.0

# Create a directory for the HospitalRun repositories
mkdir hospitalrun
cd hospitalrun

# Clone the server
git clone git@github.com:HospitalRun/hospitalrun-server.git

# Checkout v2.0.0-alpha.5
git checkout v2.0.0-alpha.5

# Clone the frontend
git clone git@github.com:HospitalRun/hospitalrun-frontend.git

# Checkout v2.0.0-alpha.7
git checkout v2.0.0-alpha.7

# Clone the components (used by frontend)
git clone git@github.com:HospitalRun/components.git

# Checkout v3.0.3
git checkout v3.0.3
```

To compile, follow these guides:

- For the [HospitalRun Server](https://github.com/HospitalRun/hospitalrun-server) follow the instructions in section [Contributing](https://github.com/HospitalRun/hospitalrun-server#contributing)

- For the [HospitalRun Frontend](https://github.com/HospitalRun/hospitalrun-frontend/) follow the instructions in the [Frontend Contributing Guide](https://github.com/HospitalRun/hospitalrun-frontend/blob/master/.github/CONTRIBUTING.md)

- For the [HospitalRun Components](https://github.com/HospitalRun/components/) follow the instructions in section [Contributing](https://github.com/HospitalRun/components#contributing)

Note that the frontend can run independently from the server. Actually the frontend will report that port 3000 has already been taken, if you start the server first.

##### How NOT to Start?

As of Feb. 20, 2022, the mono repository does not compile. See [HospitalRun Issue #363: Error while building the project](https://github.com/HospitalRun/hospitalrun/issues/363) and section [Error When Issuing `yarn workspaces run build`: (typescript) Error: .../Container.tsx(33,25): semantic error TS2769: No overload matches this call.](#error-when-issuing-yarn-workspaces-run-build-typescript-error-containertsx3325-semantic-error-ts2769-no-overload-matches-this-call) below.

Follow the Monorepo Contributing Guide in the [Contributing Guide](https://github.com/HospitalRun/hospitalrun/blob/master/.github/CONTRIBUTING.md) to clone and compile the repositories.

Further information for developers is presented here:

- [HospitalRun: Develop](https://hospitalrun.io/contribute/develop) - First place for fresh contributors.

- [HospitalRun Documentations](https://docs.hospitalrun.io/) - Central documentation hub (?). This place is quite empty as of Feb. 16, 2022.

##### Troubleshooting the Development Environment Setup

This section shows errors you may get when following the [Contributing Guide](https://github.com/HospitalRun/hospitalrun/blob/master/.github/CONTRIBUTING.md) along with proposed solutions.

###### Error When Issuing `npm start` in hospitalrun-frontend: Found 3 Errors

####### Symptom of Errors When Issuing `npm start` in hospitalrun-frontend

```text
> @hospitalrun/frontend@2.0.0-alpha.7 translation:check /Users/stefan/source/hospitalrun/hospitalrun-frontend
> tsc -p scripts/tsconfig.json && node ./bin/scripts/check-translations/index.js

node_modules/@types/node/buffer.d.ts:97:14 - error TS2661: Cannot export 'Buffer'. Only local declarations can be exported from a module.

97     export { Buffer };
                ~~~~~~

scripts/check-translations/index.ts:9:23 - error TS2339: Property 'keyword' does not exist on type 'ChalkInstance'.

9 const warning = chalk.keyword('orange')
                        ~~~~~~~

scripts/check-translations/index.ts:10:23 - error TS2339: Property 'keyword' does not exist on type 'ChalkInstance'.

10 const success = chalk.keyword('green')
```

####### Cure Errors When Issuing `npm start` in hospitalrun-frontend

These errors are not present in [HospitalRun Frontend v2.0.0-alpha.7](https://github.com/HospitalRun/hospitalrun-frontend/tree/v2.0.0-alpha.7). Probably they have been introduced after that version. Thus I recommend branching from v2.0.0-alpha.7 and starting work from there.

###### Error When Issuing `yarn`: node-gyp Fails to Compile

####### Symptom of Failing node-gyp Compile

The `yarn` command fails with the following output:

```text
...
In file included from /Users/stefan/.node-gyp/16.14.0/include/node/v8.h:30:
/Users/stefan/.node-gyp/16.14.0/include/node/v8-internal.h:492:38: error: no template named 'remove_cv_t' in namespace 'std'; did you mean 'remove_cv'?
            !std::is_same<Data, std::remove_cv_t<T>>::value>::Perform(data);
                                ~~~~~^~~~~~~~~~~
                                     remove_cv
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1/type_traits:710:50: note: 'remove_cv' declared here
template <class _Tp> struct _LIBCPP_TEMPLATE_VIS remove_cv
                                                 ^
1 error generated.
make: *** [Release/obj.target/binding/src/binding.o] Error 1
gyp ERR! build error 
gyp ERR! stack Error: `make` failed with exit code: 2
gyp ERR! stack     at ChildProcess.onExit (/Users/stefan/source/hospitalrun/hospitalrun/node_modules/node-gyp/lib/build.js:262:23)
gyp ERR! stack     at ChildProcess.emit (node:events:520:28)
gyp ERR! stack     at Process.ChildProcess._handle.onexit (node:internal/child_process:291:12)
gyp ERR! System Darwin 21.2.0
gyp ERR! command "/Users/stefan/.nvm/versions/node/v16.14.0/bin/node" "/Users/stefan/source/hospitalrun/hospitalrun/node_modules/node-gyp/bin/node-gyp.js" "rebuild" "--verbose" "--libsass_ext=" "--libsass_cflags=" "--libsass_ldflags=" "--libsass_library="
gyp ERR! cwd /Users/stefan/source/hospitalrun/hospitalrun/packages/frontend/node_modules/node-sass
gyp ERR! node -v v16.14.0
```

####### Cure Failing node-gyp Compile: Use Node.js 14 LTS

The issue seems to be coupled to using Node.js > 14. See [Node.js issue "error: no template named 'remove_cv_t' in namespace 'std'; did you mean 'remove_cv'?"](https://github.com/nodejs/node/issues/38367).

As of Feb. 19, HospitalRun is [built using Node.js 14](https://github.com/HospitalRun/hospitalrun-frontend/blob/master/.github/workflows/ci.yml). Thus the recommended solution is to use that particular Node.js version on your development computer:

```sh
node --version
v14.19.0

yarn
```

###### Warning When Issuing `yarn`: sqlite3 Fails to Compile (Can Be Ignored)

Because the `sqlite3` dependency is optional, this problem can be ignored.

####### Symptom of Failing sqlite3 Compile

```text
warning Error running install script for optional dependency: "/workspaces/hospitalrun/node_modules/sqlite3: Command failed.
Exit code: 1
Command: node-pre-gyp install --fallback-to-build
Arguments: 
Directory: /workspaces/hospitalrun/node_modules/sqlite3
Output:
node-pre-gyp info it worked if it ends with ok
node-pre-gyp info using node-pre-gyp@0.11.0
node-pre-gyp info using node@14.19.0 | linux | arm64
node-pre-gyp WARN Using request for node-pre-gyp https download 
node-pre-gyp info check checked for \"/workspaces/hospitalrun/node_modules/sqlite3/lib/binding/node-v83-linux-arm64/node_sqlite3.node\" (not found)
node-pre-gyp http GET https://mapbox-node-binary.s3.amazonaws.com/sqlite3/v4.2.0/node-v83-linux-arm64.tar.gz
node-pre-gyp http 403 https://mapbox-node-binary.s3.amazonaws.com/sqlite3/v4.2.0/node-v83-linux-arm64.tar.gz
node-pre-gyp WARN Tried to download(403): https://mapbox-node-binary.s3.amazonaws.com/sqlite3/v4.2.0/node-v83-linux-arm64.tar.gz 
node-pre-gyp WARN Pre-built binaries not found for sqlite3@4.2.0 and node@14.19.0 (node-v83 ABI, glibc) (falling back to source compile with node-gyp) 
node-pre-gyp http 403 status code downloading tarball https://mapbox-node-binary.s3.amazonaws.com/sqlite3/v4.2.0/node-v83-linux-arm64.tar.gz 
gyp info it worked if it ends with ok
gyp info using node-gyp@3.8.0
gyp info using node@14.19.0 | linux | arm64
gyp info ok 
gyp info it worked if it ends with ok
gyp info using node-gyp@3.8.0
gyp info using node@14.19.0 | linux | arm64
gyp ERR! configure error 
gyp ERR! stack Error: Command failed: /usr/bin/python3 -c import sys; print \"%s.%s.%s\" % sys.version_info[:3];
gyp ERR! stack   File \"<string>\", line 1
gyp ERR! stack     import sys; print \"%s.%s.%s\" % sys.version_info[:3];
gyp ERR! stack                       ^
gyp ERR! stack SyntaxError: invalid syntax
gyp ERR! stack 
gyp ERR! stack     at ChildProcess.exithandler (child_process.js:383:12)
gyp ERR! stack     at ChildProcess.emit (events.js:400:28)
gyp ERR! stack     at maybeClose (internal/child_process.js:1058:16)
gyp ERR! stack     at Process.ChildProcess._handle.onexit (internal/child_process.js:293:5)
gyp ERR! System Linux 5.10.76-linuxkit
gyp ERR! command \"/usr/local/bin/node\" \"/workspaces/hospitalrun/node_modules/node-gyp/bin/node-gyp.js\" \"configure\" \"--fallback-to-build\" \"--module=/workspaces/hospitalrun/node_modules/sqlite3/lib/binding/node-v83-linux-arm64/node_sqlite3.node\" \"--module_name=node_sqlite3\" \"--module_path=/workspaces/hospitalrun/node_modules/sqlite3/lib/binding/node-v83-linux-arm64\" \"--napi_version=8\" \"--node_abi_napi=napi\" \"--napi_build_version=0\" \"--node_napi_label=node-v83\"
gyp ERR! cwd /workspaces/hospitalrun/node_modules/sqlite3
gyp ERR! node -v v14.19.0
gyp ERR! node-gyp -v v3.8.0
gyp ERR! not ok 
node-pre-gyp ERR! build error 
node-pre-gyp ERR! stack Error: Failed to execute '/usr/local/bin/node /workspaces/hospitalrun/node_modules/node-gyp/bin/node-gyp.js configure --fallback-to-build --module=/workspaces/hospitalrun/node_modules/sqlite3/lib/binding/node-v83-linux-arm64/node_sqlite3.node --module_name=node_sqlite3 --module_path=/workspaces/hospitalrun/node_modules/sqlite3/lib/binding/node-v83-linux-arm64 --napi_version=8 --node_abi_napi=napi --napi_build_version=0 --node_napi_label=node-v83' (1)
node-pre-gyp ERR! stack     at ChildProcess.<anonymous> (/workspaces/hospitalrun/node_modules/node-pre-gyp/lib/util/compile.js:83:29)
node-pre-gyp ERR! stack     at ChildProcess.emit (events.js:400:28)
node-pre-gyp ERR! stack     at maybeClose (internal/child_process.js:1058:16)
node-pre-gyp ERR! stack     at Process.ChildProcess._handle.onexit (internal/child_process.js:293:5)
node-pre-gyp ERR! System Linux 5.10.76-linuxkit
node-pre-gyp ERR! command \"/usr/local/bin/node\" \"/workspaces/hospitalrun/node_modules/sqlite3/node_modules/.bin/node-pre-gyp\" \"install\" \"--fallback-to-build\"
node-pre-gyp ERR! cwd /workspaces/hospitalrun/node_modules/sqlite3
node-pre-gyp ERR! node -v v14.19.0
node-pre-gyp ERR! node-pre-gyp -v v0.11.0
node-pre-gyp ERR! not ok 
Failed to execute '/usr/local/bin/node /workspaces/hospitalrun/node_modules/node-gyp/bin/node-gyp.js configure --fallback-to-build --module=/workspaces/hospitalrun/node_modules/sqlite3/lib/binding/node-v83-linux-arm64/node_sqlite3.node --module_name=node_sqlite3 --module_path=/workspaces/hospitalrun/node_modules/sqlite3/lib/binding/node-v83-linux-arm64 --napi_version=8 --node_abi_napi=napi --napi_build_version=0 --node_napi_label=node-v83' (1)"
info This module is OPTIONAL, you can safely ignore this error
```

###### Error When Issuing `yarn workspaces run build`: Process Killed While Building Modules

####### Symptom Of Killed Process

```text
yarn workspaces v1.19.1
yarn run v1.19.1
$ npm run clean && tsc -p ./tsconfig.json
npm WARN lifecycle The node binary used for scripts is /tmp/yarn--1645288854644-0.549912080799261/node but npm is using /usr/local/bin/node itself. Use the `--scripts-prepend-node-path` option to include the path for the node binary npm was executed with.

> @hospitalrun/cli@0.3.1 clean /workspaces/hospitalrun/packages/cli
> rimraf bin

Done in 6.00s.
yarn run v1.19.1
$ tsdx build
@rollup/plugin-replace: 'preventAssignment' currently defaults to false. It is recommended to set this option to `true`, as the next major version will default this option to `true`.
@rollup/plugin-replace: 'preventAssignment' currently defaults to false. It is recommended to set this option to `true`, as the next major version will default this option to `true`.
✓ Creating entry file 8.7 secs
⠦ Building modules
Killed
error Command failed with exit code 137.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
error Command failed.
Exit code: 137
Command: /usr/local/bin/node
Arguments: /workspaces/hospitalrun/.yarn/releases/yarn-1.19.1.js build
Directory: /workspaces/hospitalrun/packages/components
Output:

info Visit https://yarnpkg.com/en/docs/cli/workspaces for documentation about this command.
```

####### Cure Killed Build Process

When investigating memory consumption of the docker container in which the build is run, I see that it constantly rises towards the 1.9 GiB limit.

Changing the limit for docker containers to 4 GB prevents the build process from being killed.

###### Error When Issuing `yarn workspaces run build`: (typescript) Error: .../Container.tsx(33,25): semantic error TS2769: No overload matches this call.

####### Symptom Of Typescript Error TS2769

```text
(typescript) Error: /Users/stefan/source/hospitalrun/hospitalrun/packages/components/src/components/Layout/Container.tsx(33,25): semantic error TS2769: No overload matches this call.
  Overload 1 of 2, '(props: ReplaceProps<"symbol", BsPrefixProps<"symbol"> & ContainerProps> | Readonly<ReplaceProps<"symbol", BsPrefixProps<"symbol"> & ContainerProps>>): Container<...>', gave the following error.
    Type '"symbol" | "object" | "a" | "abbr" | "address" | "area" | "article" | "aside" | "audio" | "b" | "base" | "bdi" | "bdo" | "big" | "blockquote" | "body" | "br" | "button" | "canvas" | ... 158 more ... | undefined' is not assignable to type '"symbol" | undefined'.
      Type '"object"' is not assignable to type '"symbol" | undefined'.
  Overload 2 of 2, '(props: ReplaceProps<"symbol", BsPrefixProps<"symbol"> & ContainerProps>, context: any): Container<"symbol">', gave the following error.
    Type '"symbol" | "object" | "a" | "abbr" | "address" | "area" | "article" | "aside" | "audio" | "b" | "base" | "bdi" | "bdo" | "big" | "blockquote" | "body" | "br" | "button" | "canvas" | ... 158 more ... | undefined' is not assignable to type '"symbol" | undefined'.
      Type '"object"' is not assignable to type '"symbol" | undefined'.
```

####### Cure Typescript Error TS2769

See [HospitalRun Issue #363: Error while building the project](https://github.com/HospitalRun/hospitalrun/issues/363)

This [answer from Oct. 1, 2022](https://github.com/HospitalRun/hospitalrun/issues/363#issuecomment-702281086) was the latest as of Feb. 20, 2022:

```text
You have to run hospitalrun-server and hospitalrun-frontend separately
```
