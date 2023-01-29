---
title: GPG - GnuPG - PGP
layout: default
---

## GPG - GnuPG - PGP

### Use With Caution

- Is pgp / gpg still sufficient for private encryption?
- Are there suffient people fixing security holes?
- See: [A history of end-to-end encryption and the death of PGP](https://www.cryptologie.net/article/487/a-history-of-end-to-end-encryption-and-the-death-of-pgp/)

<!-- doctoc --maxlevel 4 _pages/computers-and-technology/gpg-pgp.md -->
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Signing a File](#signing-a-file)
- [Encrypting a Message](#encrypting-a-message)
- [Administrating GPG Keys](#administrating-gpg-keys)
  - [Receive Keys](#receive-keys)
  - [Send Keys](#send-keys)
  - [Revoke Keys](#revoke-keys)
  - [Extend an Expired Key](#extend-an-expired-key)
- [Links and References](#links-and-references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Signing a File

```shell
gpg --sign --local-user you@example.com --detached --armor filename.txt
gpg --verify filename.txt
```

### Encrypting a Message

```shell
gpg --encrypt --recipient you@example.com --recipient me@example.com --armor filename.txt
gpg --decrypt filename.txt.asc > filename.txt
```

### Administrating GPG Keys

#### Receive Keys

1. Find a key on the keyserver (e.g. [pgp.mit.edu](https://pgp.mit.edu/)) and write down the **full fingerprint**

```shell
gpg --keyserver pool.sks-keyservers.net --recv-keys 
```

**Important:** Always use the full fingerprint for receiving the key. Otherwise hackers can spoof the key.

See also: [Question on Superuser.com](https://unix.stackexchange.com/questions/334912/how-to-import-keys-from-a-keyserver-using-gpg-in-debian)

#### Send Keys

```shell
KEY_ID=<fingerprint>
gpg --send-keys "$KEY_ID"
```

#### Revoke Keys

```bash
KEY_ID=<fingerprint>
gpg --export "$KEY_ID" | gpg --list-packets | grep revocation
```

##### GPG Revocation Reasons

Source: [GPG Revocation Reasons](https://debian-administration.org/article/450/Generating_a_revocation_certificate_with_gpg)

| ----- | -----------              |
| Value | Description              |
|   0   | No reason specified      |
|   1   | Key has been compromised |
|   2   | Key is superseded        |
|   3   | Key is no longer used    |

##### Original Article

See also [Email: Revoked keys and past signatures](https://lists.gnupg.org/pipermail/gnupg-users/2015-February/052405.html)

```shell
$ KEY_ID=<fingerprint>
$ gpg2 --export "$KEY_ID" | gpg2 --list-packets
:public key packet:
        version 4, algo 1, created 1393271747, expires 0
        pkey[0]: [1024 bits]
        pkey[1]: [17 bits]
        keyid: xxxxxxxxxxxxxxxx
:signature packet: algo 1, keyid xxxxxxxxxxxxxxxx
        version 4, created 1423566838, md5len 0, sigclass 0x20
        digest algo 8, begin of digest 9c c5
        hashed subpkt 2 len 4 (sig created 2015-02-10)
        hashed subpkt 29 len 16 (revocation reason 0x01 (Test
revocation))
        subpkt 16 len 8 (issuer key ID xxxxxxxxxxxxxxxx)
        data: [1024 bits]

$ date -d "1970-01-01 +1423566838 secs UTC"
Tue 10 Feb 12:13:58 CET 2015
```

> The RFC clearly states "key superseded" doesn't invalidate old signatures

#### Extend an Expired Key

```shell
KEY_ID=0x<fingerprint>
gpg --edit-key "$KEY_ID"

# Extend the main key
gpg> expire
...

# Extend the first sub key (ssb)
gpg> key 1
gpg> expire
...
gpg> save
```

See:

- [GnuPG: Gültigkeit eines Schlüssels verlängern](https://stephan-nix.de/2020/10/06/gnupg-gultigkeit-eines-schlussels-verlangern/)
- [How to renew an expired keypair with gpg](https://unix.stackexchange.com/questions/177291/how-to-renew-an-expired-keypair-with-gpg)

### Links and References

- [GnuPG](https://gnupg.org/download/)
- [GPG Suite for Mac](https://gpgtools.org)
- [Secure my email - encryption and digital signatures](http://www.secure-my-email.com/)
- [OpenPGP: Optimales Vorgehen](https://riseup.net/de/security/message-security/openpgp/gpg-best-practices)
