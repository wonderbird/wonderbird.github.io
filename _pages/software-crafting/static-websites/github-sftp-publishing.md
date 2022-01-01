---
title: GitHub SFTP Publishing
layout: default
---

## Publishing Static Sites from GitHub via SFTP

If you maintain your static website in a repository on GitHub, you can use GitHub Actions to build and publish it to any web server.

The following sections show how this is done for website built with [hugo](hugo.html). The same ideas apply to other static website generators, e.g. for [jekyll](jekyll.html). Just replace the name `public` in the examples below with the folder containing your built website.

### Configure Synchronization Folder

Let's start with the most important aspect:

The GitHub action [SamKirkland/FTP-Deploy-Action@3.1.1](https://github.com/SamKirkland/FTP-Deploy-Action/tree/v3.1.1) will upload only files, which are included in the git repository. Files and directories excluded by a `.gitignore` file will not be uploaded. This is usually the case for the generated website.

Luckily we can instruct the [SamKirkland/FTP-Deploy-Action@3.1.1](https://github.com/SamKirkland/FTP-Deploy-Action/tree/v3.1.1) to include these files in the SFTP synchronization process.

For this purpose, you need to create the file `.git-ftp-include` with this content in your repository root directory:

```text
!public/
```

Using an additional `.git-ftp-ignore` file, you can control whether sensitive files should still be excluded from synchronization, e.g.:

```text
.htaccess
.htpasswd
```

### SFTP Upload Action

The following YAML builds a [hugo](hugo.html) website and publishes the produced `public` folder to your SFTP server.

First, configure the repository secrets `SFTP_USERNAME` and `SFTP_PASSWORD` for the SFTP upload service in your GitHub repository settings.

Next, copy this snippet into into your `.github/workflows/hugo.yml` file:

```yaml
name: Hugo Site CI
on: [push, pull_request]

jobs:
  build_and_deploy:
    name: Build and Deploy
    runs-on: ubuntu-latest

    steps:
    - name: Git Checkout
      uses: actions/checkout@v2
      with:
        submodules: recursive

    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2
      with:
          hugo-version: 'latest'

    - name: Clean Public Directory
      run: rm -rf public

    - name: Build
      run: hugo

    - name: SFTP Deploy
      uses: SamKirkland/FTP-Deploy-Action@3.1.1
      with:
        ftp-server: sftp://www434.your-server.de
        ftp-username: ${{ secrets.SFTP_USERNAME }}
        ftp-password: ${{ secrets.SFTP_PASSWORD }}
        local-dir: public/
        known-hosts: www434.your-server.de ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/mt6O5MmBSHlX7VztOWDNWSb8sc5+rtpMHbcb16jERjz9BFfGa9UDlo1YJyJ2nCOqJqVRyxXkJ1n6yxx+UbPOGKjui/E64g6DLCcj9/Kci7G5HjspuXE/4YnB1ffZEDPZbZ3D09fpi72dyfjuuivXjLlNKRkNN6vjnWWi6mqp8F0a+tJn/FFvTFisIVKgMj7HGOQAVeX6Rn1B9hve2zvFSniWNwj95TnFQEQBxDwsbmmXckjm8BDwiguPO4/yhJOGO9W2SpFe96hOTDvOJ7Pm7WELMJorELPFxf5Msa4I06iREU+NMXaa30UhvcJWh5aVRxv6mQFRexfECxianJQj
```
