# shell-tools

A collection of my shell tools and scripts

## sshKeys.sh

Display the `authorized_key` contents as `SHA-1` ~ `SHA-160` and legacy `MD-5` hashes.

to invoke: `sshKeys.sh` can yields listing similar to following one:

```
== check ssh key hash: ssh-keygen -l -E sha1 -f your-key.pub
4096 SHA1:pwRqGq123JabcRPk8g7uCS7IJVk user@example.com (RSA)
256 SHA1:1o1a8giTajRtXqyyd0iHVqll123 user@example.com (ECDSA)
== check ssh key hash: ssh-keygen -l -E md5 -f your-key.pub
4096 MD5:12:24:c9:65:6e:a4:21:65:65:81:0d:df:e5:95:a0:11 user@example.com (RSA)
256 MD5:01:21:ba:33:45:80:e2:b9:d8:34:8d:27:27:14:38:d0 user@example.com (ECDSA)
```
