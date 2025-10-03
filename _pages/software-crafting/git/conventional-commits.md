---
title: Conventional Commits
layout: default
---
## Conventional Commits

Conventional commits make it very easy to share the progress with stakeholders. You can give them a query to see only commits adding features or fixing bugs.

An example is the filtered [GitHub commit log for my Aircraft Noise](https://github.com/search?q=repo%3Awonderbird%2Faircraftnoise+%28%22feat%5C%3A%22+OR+%22fix%5C%3A%22%29&type=commits&p=1) project.

## Specifications

* netlify: [Conventional Commits v1.0.0-beta.4](https://www.conventionalcommits.org/en/v1.0.0-beta.4/)

* GitHub: [angular / angular / CONTRIBUTING.md](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#type) - The section `Type` shows the commit types and their description.

* [conventional-commit-types-cli](https://github.com/AndersDJohnson/conventional-commit-types-cli) - CLI to list [conventional commit types](https://github.com/commitizen/conventional-commit-types).

   ```sh
   npm install -g conventional-commit-types-cli
   ...
   conventional-commit-types
   ```

## Tools and Helpers

* GitHub: [Semantic Pull Requests](https://github.com/zeke/semantic-pull-requests) - GitHub status check that ensures your pull requests follow the Conventional Commits spec.

* GitHub: [Conventional Changelog](https://github.com/conventional-changelog/conventional-changelog) - Generate a CHANGELOG from git metadata.

* [commitlint](https://commitlint.js.org/#/) - npm package helping your team adhering to a commit convention.

* GitHub: [Commitizen for contributors](https://github.com/commitizen/cz-cli) - Prompt to fill out any required commit fields at commit time.

* GitHub: [cz-conventional-changelog](https://github.com/commitizen/cz-conventional-changelog) - Prompt for conventional changelog standard.

* GitHub: [conventional-commit-types](https://github.com/commitizen/conventional-commit-types) - List of conventional commit types.

## Git Trailer Format

* [git Reference: git-interpret-trailers](https://git-scm.com/docs/git-interpret-trailers)

